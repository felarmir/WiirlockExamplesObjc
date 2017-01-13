//
//  WDownloader.m
//  Wiirlock Downloader Class
//
//  Created by Denis Andreev on 13/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "WDownloader.h"
#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@implementation WDownloader
{
    NSUInteger dwnFile;
}
@synthesize delegate;


-(void)didChangeDataURL:(NSString*)dataUrl fileName:(NSString*)fileName
{
    dwnFile = 0;
    _filePath = [DOCUMENTS stringByAppendingPathComponent:fileName];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *url = [NSURL URLWithString:dataUrl];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    NSURLConnection *theConnection = [NSURLConnection connectionWithRequest:theRequest delegate:self];
    if (theConnection) {
        [[NSFileManager defaultManager] createFileAtPath:_filePath contents:nil attributes:nil];
        _file = [NSFileHandle fileHandleForUpdatingAtPath:_filePath];
    } else {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSLog(@"Connection failed");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_file seekToEndOfFile];
    
    NSMutableData *receivedData = [NSMutableData data];
    [receivedData setLength:0];
    [receivedData appendData:data];
    
    dwnFile +=[data length];
    float persent = (float)dwnFile/[_response expectedContentLength];
    SEL selector = @selector(updatePersentCounter:);
    if(delegate && [delegate respondsToSelector:selector]){
        [delegate performSelector:selector withObject:[NSNumber numberWithFloat:persent]];
    }   
    [_file writeData:receivedData];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if ([response expectedContentLength]) {
        _response = response;
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [_file closeFile];
    SEL selector = @selector(downloadFinish);
    if(delegate && [delegate respondsToSelector:selector]){
        [delegate performSelector:selector];
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [_file closeFile];
    NSLog(@"%@", error);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end

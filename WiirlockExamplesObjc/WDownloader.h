//
//  WDownloader.h
//  Wiirlock Downloader Class
//
//  Created by Denis Andreev on 13/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol WDownloaderDelegate <NSObject>
@required
-(void)updatePersentCounter:(NSNumber*)persent;
@optional
-(void)downloadFinish;
@end

@interface WDownloader : NSObject

@property (nonatomic, assign) id<WDownloaderDelegate> delegate;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSURLRequest *request;
@property (nonatomic, retain) NSURLResponse *response;
@property (nonatomic, retain) NSFileHandle *file;
@property (nonatomic, retain) NSString *filePath;

-(void)didChangeDataURL:(NSString*)dataUrl fileName:(NSString*)fileName;

@end

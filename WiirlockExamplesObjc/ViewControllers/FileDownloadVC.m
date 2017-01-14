//
//  FileDownloadVC.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 13/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "FileDownloadVC.h"
#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@interface FileDownloadVC ()

@property (strong, nonatomic) WDownloader *downloader;
@property (nonatomic, strong) CIImage *blankImage;
@property (nonatomic, strong) CIFilter *filter;

@end

@implementation FileDownloadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _downloader = [[WDownloader alloc] init];
    _downloader.delegate = self;
    _progressView.progress = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)sepiaFilter:(id)sender{
    _filter = [CIFilter filterWithName:@"CISepiaTone"];
    [self setFilterToImage];
}
-(IBAction)pixelFilter:(id)sender{
    _filter = [CIFilter filterWithName:@"CIPixellate"];
    [self setFilterToImage];
}
-(IBAction)gaussFilter:(id)sender{
    _filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [self setFilterToImage];
}

-(void)setFilterToImage {
    _blankImage = [CIImage imageWithData:[NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/1.jpg", DOCUMENTS]]];
    [_filter setValue:_blankImage forKey:kCIInputImageKey];
    UIImage *newImage = [UIImage imageWithCIImage:[_filter outputImage]];
    _imageView.image = newImage;
}

-(IBAction)downloadFile:(id)sender {
    NSString *url = @"http://images.independenttraveler.com/homepage/newyorkbig.jpg";
    [_downloader didChangeDataURL:url fileName:@"1.jpg"];
}

-(void)updatePersentCounter:(NSNumber *)persent
{
    _progressView.progress = [persent floatValue];
}

-(void)downloadFinish {
    _imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/1.jpg", DOCUMENTS]]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

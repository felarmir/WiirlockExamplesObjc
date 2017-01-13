//
//  FileDownloadVC.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 13/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDownloader.h"

@interface FileDownloadVC : UIViewController<WDownloaderDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

-(IBAction)downloadFile:(id)sender;

@end

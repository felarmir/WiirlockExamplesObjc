//
//  TextOnImage.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 08/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "TextOnImage.h"

@interface TextOnImage ()

- (UIImage*)createTextImage:(NSString*)text image:(UIImage*)image point:(CGPoint)point;

@end

@implementation TextOnImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIImage*)createTextImage:(NSString*)text image:(UIImage*)image point:(CGPoint)point {
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIColor *textColor = [UIColor whiteColor];
    UIFont *textFont = [UIFont fontWithName:@"Helvetica Light" size:20];
    
    UIGraphicsBeginImageContextWithOptions([_imageView bounds].size, false, scale);
    
    NSMutableDictionary *attribute = [[NSMutableDictionary alloc] init];
    [attribute setObject:textFont forKey:NSFontAttributeName];
    [attribute setObject:textColor forKey:NSForegroundColorAttributeName];
    
    [image drawInRect:CGRectMake(CGPointZero.x, CGPointZero.y, _imageView.bounds.size.width, _imageView.bounds.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, _imageView.bounds.size.width, _imageView.bounds.size.height);
    [text drawInRect:rect withAttributes:attribute];
    UIImage *imageResult = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageResult;
}

-(IBAction)setTextOnImage:(id)sender {
    NSString *text = _textField.text;
    UIImage *newImage = [self createTextImage:text image:_imageView.image point:CGPointMake(20, _imageView.bounds.size.height-40)];
    _imageView.image = newImage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

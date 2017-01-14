//
//  GardientLayerVC.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 14/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "GardientLayerVC.h"

@interface GardientLayerVC ()

@end

@implementation GardientLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color1 = [UIColor colorWithRed:153.0/255.0 green:26.0/255.0 blue:61.0/255.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:243.0/255.0 green:155.0/255.0 blue:52.0/255.0 alpha:1.0];
    UIColor *color3 = [UIColor colorWithRed:153.0/255.0 green:26.0/255.0 blue:53.0/255.0 alpha:1.0];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.layer.bounds;
    gradientLayer.colors = @[(id)[color1 CGColor], (id)[color2 CGColor], (id)[color3 CGColor]];
    gradientLayer.startPoint = CGPointMake(0.5, 0.0);
    gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    [self.view.layer insertSublayer:gradientLayer atIndex:0];
    
    CABasicAnimation *rotate;
    rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.toValue = [NSNumber numberWithFloat:M_PI * 2 * 2 * 10];
    rotate.duration = 20;
    rotate.cumulative = YES;
    rotate.repeatCount = 10;
    rotate.beginTime = CACurrentMediaTime() + 0.5;
    rotate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_imageView.layer addAnimation:rotate forKey:@"rotationAnimation"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

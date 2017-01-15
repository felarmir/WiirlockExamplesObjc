//
//  ClockLayer.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface ClockLayer : CAShapeLayer

@property (nonatomic, strong) NSDate *time;

-(void)setTime:(NSDate*)time;

@end

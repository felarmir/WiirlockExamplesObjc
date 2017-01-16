//
//  ClockLayer.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ClockLayer.h"


@interface ClockLayer()

@property (nonatomic, strong) CAShapeLayer *hourHand;
@property (nonatomic, strong) CAShapeLayer *minuteHand;
@property (nonatomic, strong) CAShapeLayer *secondHand;

@end

@implementation ClockLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bounds = CGRectMake(0, 0, 200, 200);
        self.path = [[UIBezierPath bezierPathWithOvalInRect:self.bounds] CGPath];
        self.fillColor = [[UIColor whiteColor] CGColor];
        self.strokeColor = [[UIColor blackColor] CGColor];
        self.lineWidth = 4;
        
        _hourHand = [CAShapeLayer layer];
        _hourHand.path = [[UIBezierPath bezierPathWithRect:CGRectMake(-2, -70, 5, 70)] CGPath];
        _hourHand.fillColor = [[UIColor blackColor] CGColor];
        _hourHand.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSublayer:_hourHand];
        
        _minuteHand = [CAShapeLayer layer];
        _minuteHand.path = [[UIBezierPath bezierPathWithRect:CGRectMake(-1, -90, 3, 90)] CGPath];
        _minuteHand.fillColor = [[UIColor blackColor] CGColor];
        _minuteHand.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSublayer:_minuteHand];
        
        _secondHand = [CAShapeLayer layer];
        _secondHand.path = [[UIBezierPath bezierPathWithRect:CGRectMake(0, -90, 1, 90)] CGPath];
        _secondHand.fillColor = [[UIColor redColor] CGColor];
        _secondHand.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self addSublayer:_secondHand];
        
        
    }
    return self;
}

-(void)setTime:(NSDate*)time {
    _time = time;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:time];
    _hourHand.affineTransform = CGAffineTransformMakeRotation(components.hour / 12.0 * 2.0 * M_PI);
    _minuteHand.affineTransform = CGAffineTransformMakeRotation(components.minute / 60.0 * 2.0 * M_PI);
    _secondHand.affineTransform = CGAffineTransformMakeRotation(components.second / 60.0 *2.0 * M_PI);
}


@end

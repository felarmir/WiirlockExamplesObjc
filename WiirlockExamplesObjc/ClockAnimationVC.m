//
//  ClockAnimationVC.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ClockAnimationVC.h"
#import "ClockLayer.h"

@interface ClockAnimationVC ()

@property (nonatomic, strong) ClockLayer *clockLayer;

@end

@implementation ClockAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _clockLayer = [[ClockLayer alloc] init];
    _clockLayer.position = CGPointMake(self.view.bounds.size.width/2, 180);
    [_clockLayer setTime:[NSDate date]];
    [self.view.layer addSublayer:_clockLayer];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [_clockLayer setTime:[NSDate date]];
    }];
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

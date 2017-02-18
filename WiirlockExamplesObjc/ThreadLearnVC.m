//
//  ThreadLearnVC.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 18/02/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ThreadLearnVC.h"

@interface ThreadLearnVC ()

@end

@implementation ThreadLearnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_oneProgress setProgress:0.0];
    [_twoProgress setProgress:0.0];
    [_threeProgress setProgress:0.0];
    [_fourProgress setProgress:0.0];
    [_fiveProgress setProgress:0.0];
    
    [_oneText setText:@" "];
    [_twoText setText:@" "];
    [_threeText setText:@" "];
    [_fourText setText:@" "];
    [_fiveText setText:@" "];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)firstThread:(id)sender{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 1; i <= 10; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_oneProgress setProgress:((float)i/(float)10)];
                if (i == 10) {
                    [_oneText setText:@"Thirst thread finish"];
                }
            });
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
}

-(IBAction)secondThread:(id)sender{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 1; i <= 10; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_twoProgress setProgress:((float)i/(float)10)];
                if (i == 10) {
                    [_twoText setText:@"Second thread finish"];
                }
            });
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
}

-(IBAction)thirdThread:(id)sender{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        for (int i = 1; i <= 10; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_threeProgress setProgress:((float)i/(float)10)];
                if (i == 10) {
                    [_threeText setText:@"Third thread finish"];
                }
            });
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
}

-(IBAction)forthThread:(id)sender{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 1; i <= 10; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_fourProgress setProgress:((float)i/(float)10)];
                if (i == 10) {
                    [_fourText setText:@"Forth thread finish"];
                }
            });
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
}

-(IBAction)fiethThread:(id)sender{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        for (int i = 1; i <= 10; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_fiveProgress setProgress:((float)i/(float)10)];
                if (i == 10) {
                    [_fiveText setText:@"Fifth thread finish"];
                }
            });
            [NSThread sleepForTimeInterval:1.0f];
        }
    });
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

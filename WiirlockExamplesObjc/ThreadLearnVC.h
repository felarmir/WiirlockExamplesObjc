//
//  ThreadLearnVC.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 18/02/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadLearnVC : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *oneText;
@property (weak, nonatomic) IBOutlet UILabel *twoText;
@property (weak, nonatomic) IBOutlet UILabel *threeText;
@property (weak, nonatomic) IBOutlet UILabel *fourText;
@property (weak, nonatomic) IBOutlet UILabel *fiveText;

@property (weak, nonatomic) IBOutlet UIProgressView *oneProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *twoProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *threeProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *fourProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *fiveProgress;

-(IBAction)firstThread:(id)sender;
-(IBAction)secondThread:(id)sender;
-(IBAction)thirdThread:(id)sender;
-(IBAction)forthThread:(id)sender;
-(IBAction)fiethThread:(id)sender;

@end

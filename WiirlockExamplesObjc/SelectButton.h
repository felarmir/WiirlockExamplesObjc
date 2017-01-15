//
//  SelectButton.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectButton : UIButton

@property (nonatomic) BOOL isTaskSeleted;
-(void)setSelectedTask:(BOOL)selected;

@end

//
//  SelectButton.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "SelectButton.h"

@implementation SelectButton

-(void)setSelectedTask:(BOOL)selected{
    _isTaskSeleted = selected;
    if (_isTaskSeleted) {
        [self setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    } else {
        [self setImage:nil forState:UIControlStateNormal];
    }
}

@end

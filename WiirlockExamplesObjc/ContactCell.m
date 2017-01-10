//
//  ContactCell.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 10/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ContactCell.h"

@implementation ContactCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _profilePhoto.backgroundColor = [UIColor grayColor];
    _profilePhoto.layer.cornerRadius = 30.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

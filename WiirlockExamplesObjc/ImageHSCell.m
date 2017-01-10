//
//  ImageHSCell.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 09/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ImageHSCell.h"

@implementation ImageHSCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _isCellSelected = NO;
}

- (void)tapToCell {
    if (_isCellSelected) {
        _imageHight.constant = 167.0;
    } else {
        _imageHight.constant = 0.0;
    }
    _isCellSelected = !_isCellSelected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

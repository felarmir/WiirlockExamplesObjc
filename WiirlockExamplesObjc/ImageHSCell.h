//
//  ImageHSCell.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 09/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageHSCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewinCell;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHight;

@property (nonatomic) BOOL isCellSelected;

-(void)tapToCell;

@end

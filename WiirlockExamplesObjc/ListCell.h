//
//  ListCell.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectButton.h"

@interface ListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *rowNumber;
@property (weak, nonatomic) IBOutlet UILabel *task;
@property (weak, nonatomic) IBOutlet SelectButton *selectButton;

@end

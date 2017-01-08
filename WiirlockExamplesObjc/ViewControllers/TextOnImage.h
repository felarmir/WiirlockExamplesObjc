//
//  TextOnImage.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 08/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextOnImage : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UITextField *textField;

-(IBAction)setTextOnImage:(id)sender;


@end

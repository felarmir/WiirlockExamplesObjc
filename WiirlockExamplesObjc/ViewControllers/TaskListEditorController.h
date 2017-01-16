//
//  TaskListEditorController.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskList+CoreDataProperties.h"

@interface TaskListEditorController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *taskSwitch;
@property (weak, nonatomic) IBOutlet UILabel *taskSwitchLabel;
@property (weak, nonatomic) IBOutlet UITextView *taskField;

@property (nonatomic, strong) TaskList *taskList;

@property (nonatomic) BOOL isSwitchHide;

-(IBAction)saveTask:(id)sender;
-(IBAction)setTaskSwitchFinished:(id)sender;
@end

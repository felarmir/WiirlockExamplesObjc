//
//  TaskListEditorController.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "TaskListEditorController.h"
#import "DataStore.h"

@interface TaskListEditorController ()

@end

@implementation TaskListEditorController
{
    DataStore *dataStore;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (_isSwitchHide) {
        _taskSwitch.hidden = YES;
        _taskSwitchLabel.hidden = YES;
    }
    if (!_isSwitchHide) {
        _taskField.text = _taskList.task;
        [_taskSwitch setOn:_taskList.finished];
    }
    dataStore = [DataStore instance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(IBAction)saveTask:(id)sender {
    BOOL okAdd = [dataStore addTask:_taskField.text];
    if (!okAdd) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Don't add Task" message:@"Tray again" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(IBAction)setTaskSwitchFinished:(id)sender {
    _taskList.finished = [sender isOn];
    _taskList.task = _taskField.text;
    NSError *error = nil;
    [_taskList.managedObjectContext save:&error];
}

@end

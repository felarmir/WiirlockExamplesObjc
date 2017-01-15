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
    dataStore = [DataStore instance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ListTableVC.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ListTableVC.h"
#import "ListCell.h"
#import "DataStore.h"
#import "TaskList+CoreDataProperties.h"
#import "TaskListEditorController.h"

@interface ListTableVC ()

@end

@implementation ListTableVC
{
    NSMutableArray<TaskList*> *dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0f);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dataArray = [NSMutableArray arrayWithArray:[[DataStore instance] dataArray]];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TASK" forIndexPath:indexPath];
    if (!cell) {
        cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TASK"];
    }
    
    TaskList *object = [dataArray objectAtIndex:indexPath.row];
    [cell.selectButton setSelectedTask:object.finished];
    cell.rowNumber.text = [NSString stringWithFormat:@"%lu.", (indexPath.row + 1)];
    cell.task.text = object.task;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TaskListEditorController *editor = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"addSegue"]) {
        editor.isSwitchHide = YES;
    }
    if ([[segue identifier] isEqualToString:@"showTask"]) {
        editor.isSwitchHide = NO;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [editor setTaskList:[dataArray objectAtIndex:indexPath.row]];
    }
}


@end

//
//  ImageShowHideTVC.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 09/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ImageShowHideTVC.h"
#import "ImageHSCell.h"

@interface ImageShowHideTVC ()

@end

@implementation ImageShowHideTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 2.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageHSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IMAGECELL" forIndexPath:indexPath];
    if (!cell) {
        cell = [[ImageHSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IMAGECELL"];
    }
    cell.cellLabel.text = [NSString stringWithFormat:@"Cell:%li", (long)indexPath.row];
    cell.isCellSelected = NO;
    [cell tapToCell];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageHSCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.3 animations:^{
        [tableView beginUpdates];
        [cell tapToCell];
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:true];
        [tableView endUpdates];
    }];
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

//
//  ContactViewController.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 08/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ContactViewController.h"
#import <Contacts/Contacts.h>

@interface ContactViewController ()

@property (nonatomic, strong) NSMutableArray *arrayList;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayList = [[NSMutableArray alloc] init];
    if([CNContactStore class]) {
        CNEntityType entityType = CNEntityTypeContacts;
    
        if([CNContactStore authorizationStatusForEntityType:entityType] == CNAuthorizationStatusNotDetermined) {
            CNContactStore *cs = [[CNContactStore alloc] init];
            [cs requestAccessForEntityType:entityType completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (granted) {
                    [self getContatcs];
                }
            }];
        } else if([CNContactStore authorizationStatusForEntityType:entityType] == CNAuthorizationStatusAuthorized) {
                [self getContatcs];
        }
    }
    
}


- (void)getContatcs {
    if ([CNContactStore class]) {
        NSError *error;
        CNContactStore *addressBook = [[CNContactStore alloc] init];
        [addressBook containersMatchingPredicate:[CNContainer predicateForContainersWithIdentifiers:@[addressBook.defaultContainerIdentifier]] error:&error];
        NSArray *keyContact = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keyContact];
        BOOL success = [addressBook enumerateContactsWithFetchRequest:request error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
            if (error) {
                NSLog(@"Error:%@", error);
            } else {
                [_arrayList addObject:contact];
            }
        }];
        
    }
    [self.tableView reloadData];
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
    return [_arrayList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CONTACT" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"CONTACT"];
    }
    cell.textLabel.text = [[_arrayList objectAtIndex:indexPath.row] givenName];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

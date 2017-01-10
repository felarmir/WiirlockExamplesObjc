//
//  ContactViewController.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 08/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "ContactViewController.h"
#import <Contacts/Contacts.h>
#import "ContactCell.h"

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
        NSArray *keyContact = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey];
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keyContact];
        [addressBook enumerateContactsWithFetchRequest:request error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
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
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CONTACT" forIndexPath:indexPath];
    if (!cell) {
        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"CONTACT"];
    }
    
    CNContact *contact = [_arrayList objectAtIndex:indexPath.row];
    
    cell.name.text = [contact givenName];
    cell.fname.text = [contact familyName];
    cell.phoneNumber.text = [[[[contact phoneNumbers] objectAtIndex:0] valueForKey:@"value"] valueForKey:@"digits"];
    if ([contact imageData] != nil) {
        cell.imageView.image = [UIImage imageWithData:[contact imageData]];
    } else {
        cell.imageView.image = [self setSimpleImage:[contact givenName] fname:[contact familyName]];
    }
    return cell;
}

- (UIImage*)setSimpleImage:(NSString*)name fname:(NSString*)fname {
    NSString *str = [NSString stringWithFormat:@"%@%@", [name substringToIndex:1], [fname substringToIndex:1]];
    
    UIColor *textColor = [UIColor whiteColor];
    UIFont *textFont = [UIFont fontWithName:@"Helvetica Light" size:30];
    NSMutableDictionary *attribute = [[NSMutableDictionary alloc] init];
    [attribute setObject:textFont forKey:NSFontAttributeName];
    [attribute setObject:textColor forKey:NSForegroundColorAttributeName];
    CGRect rect = CGRectMake(5, 15, 61, 61);
    UIGraphicsBeginImageContext(CGSizeMake(61.0, 61.0));
    [str drawInRect:rect withAttributes:attribute];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

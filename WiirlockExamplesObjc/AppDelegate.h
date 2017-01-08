//
//  AppDelegate.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 08/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


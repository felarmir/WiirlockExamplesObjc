//
//  DataStore.m
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import "DataStore.h"
#import "AppDelegate.h"
#import "TaskListDataController.h"


@implementation DataStore
{
    TaskListDataController *taskDataController;
}

+(id)instance {
    static DataStore *storeInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storeInstance = [[DataStore alloc] init];
    });
    return storeInstance;
}

-(NSArray*)dataArray {
    taskDataController = [[TaskListDataController alloc] init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDeskripton = [NSEntityDescription entityForName:@"TaskList" inManagedObjectContext:[taskDataController manageObjectContext]];
    [fetchRequest setEntity:entityDeskripton];
    
    NSError *error = nil;
    NSArray *array = [[taskDataController manageObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Data base error");
    } else {
        return array;
    }
    return nil;
}

-(BOOL)addTask:(NSString*)task {
    TaskList *object = [NSEntityDescription insertNewObjectForEntityForName:@"TaskList" inManagedObjectContext:[taskDataController manageObjectContext]];
    object.task = task;
    object.finished = NO;
    
    NSError *error = nil;
    [object.managedObjectContext save:&error];
    if (!error) {
        return YES;
    }
    return NO;
}

@end

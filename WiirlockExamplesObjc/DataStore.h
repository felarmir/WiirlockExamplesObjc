//
//  DataStore.h
//  WiirlockExamplesObjc
//
//  Created by Denis Andreev on 15/01/2017.
//  Copyright © 2017 Denis Andreev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskList+CoreDataProperties.h"

@interface DataStore : NSObject

+ (id)instance;
- (NSArray*)dataArray;
- (BOOL)addTask:(NSString*)task;

@end

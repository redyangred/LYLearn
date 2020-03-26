//
//  AppDelegate.h
//  LYLearn
//
//  Created by YangChang on 2019/12/17.
//  Copyright © 2019 liuyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


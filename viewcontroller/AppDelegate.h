//
//  AppDelegate.h
//  viewcontroller
//
//  Created by Ishani Perera on 4/13/20.
//  Copyright © 2020 Ishani Perera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end


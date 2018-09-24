//
//  AppDelegate.h
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


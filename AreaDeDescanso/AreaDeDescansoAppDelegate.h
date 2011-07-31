//
//  AreaDeDescansoAppDelegate.h
//  AreaDeDescanso
//
//  Created by BKB on 23/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AreaDeDescansoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow                         *window;
@property (nonatomic, retain) IBOutlet UINavigationController           *navController;

@property (nonatomic, retain, readonly) NSManagedObjectContext          *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel            *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator    *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

// Returns the AppDelegate (self) so it is accesible from all classes
+ (AreaDeDescansoAppDelegate *)sharedAppDelegate;


@end

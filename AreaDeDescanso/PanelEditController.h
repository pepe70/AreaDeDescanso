//
//  PanelEditController.h
//  AreaDeDescanso
//
//  Created by BKB on 25/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PanelEditController : UITableViewController {
    NSManagedObject *panel;
    
@private
    NSArray *sectionNames;
    NSArray *rowLabels;
    NSArray *rowKeys;
    NSArray *rowArguments;
    NSArray *rowControllers;
}

@property (nonatomic, retain) NSManagedObject *panel;

@end

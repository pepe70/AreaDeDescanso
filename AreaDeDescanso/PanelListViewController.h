//
//  PanelListViewController.h
//  AreaDeDescanso
//
//  Created by BKB on 23/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cliente.h"
//#import "Panel.h"

@class  Panel;
@class  PanelEditController;
@class  PANELCell;

@interface PanelListViewController : UIViewController 
    <UITableViewDelegate, UITableViewDataSource,
    UIAlertViewDelegate, NSFetchedResultsControllerDelegate>

{
    UITableView         *tableView;
    UIToolbar           *toolBar;
    PanelEditController *detailController;
    Cliente             *cliente;
    PANELCell           *tvCell;
    
@private
    NSFetchedResultsController *_fetchedResultsController;
    NSUInteger                  sectionInsertCount;
    
}

@property (nonatomic, retain)   IBOutlet    UITableView                 *tableView;
@property (nonatomic, retain)   IBOutlet    UIToolbar                   *toolBar;
@property (nonatomic, retain)   IBOutlet    PanelEditController         *detailController;
@property (nonatomic, readonly)             NSFetchedResultsController  *fetchedResultsController;
@property (nonatomic, assign)               Cliente                     *cliente;
@property (nonatomic, assign)   IBOutlet    PANELCell                   *tvCell;


- (void)addPanel;
- (IBAction)toggleEdit;
+ (Panel *)takePanel: (NSString *)ip;

@end

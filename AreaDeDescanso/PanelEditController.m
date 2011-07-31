#import "PanelEditController.h"
#import "NSArray-NestedArrays.h"
#import "PanelValueDisplay.h"
#import "ManagedObjectAttributeEditor.h" 

@implementation PanelEditController
@synthesize panel;

- (void)viewWillAppear:(BOOL)animated {	
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    sectionNames = [[NSArray alloc] initWithObjects:
                    [NSNull null],
                    NSLocalizedString(@"General", @"General"),
                    nil];
    rowLabels = [[NSArray alloc] initWithObjects:
				 
                 // Section 1
                 [NSArray arrayWithObjects:NSLocalizedString(@"Nombre", @"Nombre"), nil],
				 
                 // Section 2
                 [NSArray arrayWithObjects:NSLocalizedString(@"IP", @"IP"),
                  NSLocalizedString(@"Puerto", @"Puerto"),
                  nil],
                 
                 // Sentinel
                 nil];
	
    rowKeys = [[NSArray alloc] initWithObjects:
               
               // Section 1
               [NSArray arrayWithObjects:@"nombre", nil],
			   
               // Section 2
               [NSArray arrayWithObjects:@"ip", @"puerto", nil],
               
               // Sentinel
               nil];
    
	rowControllers = [[NSArray alloc] initWithObjects:
					  
                      // Section 1
                      [NSArray arrayWithObject:@"ManagedObjectStringEditor"],
					  
                      // Section 2
                      [NSArray arrayWithObjects:@"ManagedObjectStringEditor", 
                       @"ManagedObjectStringEditor", nil],
					  
                      // Sentinel
                      nil];
    rowArguments = [[NSArray alloc] initWithObjects:
                    
                    // Section 1
                    [NSArray arrayWithObject:[NSNull null]],
                    
                    // Section 2,
                    [NSArray arrayWithObjects:[NSNull null], 
                     [NSNull null], 
                     nil],
                    
                    // Sentinel
                    nil];
 
    [super viewDidLoad];
}
- (void)dealloc {
    [panel release];
    [sectionNames release];
    [rowLabels release];
    [rowKeys release];
    [rowControllers release];
    [super dealloc];
}

#pragma mark -
#pragma mark Table View Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sectionNames count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id theTitle = [sectionNames objectAtIndex:section];
    if ([theTitle isKindOfClass:[NSNull class]])
        return nil;
	
    return theTitle;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [rowLabels countOfNestedArray:section];
} 
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Panel Edit Cell Identifier";
    
    UITableViewCell *cell = [theTableView 
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 
                                       reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSString *rowKey = [rowKeys nestedObjectAtIndexPath:indexPath];
    NSString *rowLabel = [rowLabels nestedObjectAtIndexPath:indexPath];
    
    id <PanelValueDisplay> rowValue = [panel valueForKey:rowKey];
    
    cell.detailTextLabel.text = [rowValue panelValueDisplay];
    cell.textLabel.text = rowLabel;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    NSString *controllerClassName = [rowControllers 
                                     nestedObjectAtIndexPath:indexPath];
    NSString *rowLabel = [rowLabels nestedObjectAtIndexPath:indexPath];
    NSString *rowKey = [rowKeys nestedObjectAtIndexPath:indexPath];
    Class controllerClass = NSClassFromString(controllerClassName);
    ManagedObjectAttributeEditor *controller = 
    [controllerClass alloc];
    controller = [controller initWithStyle:UITableViewStyleGrouped];
    controller.keypath = rowKey;
    controller.managedObject = panel;
    controller.labelString = rowLabel;
    controller.title = rowLabel;
    
    NSDictionary *args = [rowArguments nestedObjectAtIndexPath:indexPath];
    if ([args isKindOfClass:[NSDictionary class]]) {
        if (args != nil) {
            for (NSString *oneKey in args) {
                id oneArg = [args objectForKey:oneKey];
                [controller setValue:oneArg forKey:oneKey];
            }
        }
    }    
    
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

@end

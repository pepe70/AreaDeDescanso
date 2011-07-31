#import "PanelValueDisplay.h"

@implementation NSString (PanelValueDisplay)
- (NSString *)panelValueDisplay {
	return self;
}
@end

@implementation NSDate (PanelValueDisplay)
- (NSString *)panelValueDisplay {
    
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateStyle:NSDateFormatterMediumStyle];
	NSString *ret = [formatter stringFromDate:self];
	[formatter release];
	return ret;
}
@end

@implementation NSNumber (PanelValueDisplay) 
- (NSString *)panelValueDisplay {
    return [self descriptionWithLocale:[NSLocale currentLocale]];
}
@end

@implementation NSDecimalNumber (PanelValueDisplay) 
- (NSString *)panelValueDisplay {
    return [self descriptionWithLocale:[NSLocale currentLocale]];
}
@end

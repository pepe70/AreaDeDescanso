#import <Foundation/Foundation.h>

@protocol PanelValueDisplay
- (NSString *)panelValueDisplay;
@end

@interface NSString (PanelValueDisplay) <PanelValueDisplay>
- (NSString *)panelValueDisplay;
@end

@interface NSDate (PanelValueDisplay) <PanelValueDisplay>
- (NSString *)panelValueDisplay;
@end

@interface NSNumber (PanelValueDisplay) <PanelValueDisplay>
- (NSString *)panelValueDisplay;
@end

@interface NSDecimalNumber (PanelValueDisplay) <PanelValueDisplay>
- (NSString *)panelValueDisplay;
@end



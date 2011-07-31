//
//  PANELCell.h
//  AreaDeDescanso
//
//  Created by BKB on 13/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColorRGBValueTransformer.h"

@class  Panel;


@interface PANELCell : UITableViewCell {
    
    UILabel     *nombre;
    UILabel     *ip;
    UILabel     *valueTemperatura;
    UILabel     *valueLuminosidad;
    UIImageView *texto;
}

@property (nonatomic, retain) IBOutlet UILabel      *nombre;
@property (nonatomic, retain) IBOutlet UILabel      *ip;
@property (nonatomic, retain) IBOutlet UILabel      *valueTemperatura;
@property (nonatomic, retain) IBOutlet UILabel      *valueLuminosidad;
@property (nonatomic, retain) IBOutlet UIImageView  *texto;

- (void) configureForPanel:(Panel *)panel;

@end

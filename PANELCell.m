//
//  PANELCell.m
//  AreaDeDescanso
//
//  Created by BKB on 13/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PANELCell.h"
#import "Panel.h"


@implementation PANELCell

@synthesize nombre;
@synthesize ip;
@synthesize valueTemperatura;
@synthesize valueLuminosidad;
@synthesize texto;

- (void) configureForPanel:(Panel *)panel {
    self.nombre.text = panel.nombre;
    self.ip.text = panel.ip;
}

- (void)dealloc
{
    [nombre release];
    [ip release];
    [valueTemperatura release];
    [valueLuminosidad release];
    [texto release];
    [super dealloc];
}

@end

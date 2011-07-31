//
//  Panel.h
//  AreaDeDescanso
//
//  Created by BKB on 15/05/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Panel : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * puerto;
@property (nonatomic, retain) NSNumber * temperatura;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) UIColor  * color;
@property (nonatomic, retain) NSString * texto;
@property (nonatomic, retain) NSNumber * luminosidad;
@property (nonatomic, retain) NSString * ip;

@end

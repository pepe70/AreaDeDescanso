//
//  NSArray-NestedArrays.h
//  AreaDeDescanso
//
//  Created by BKB on 25/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray(NestedArrays)
    
- (id)nestedObjectAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)countOfNestedArray:(NSUInteger)section;

@end

//
//  EasyTable.m
//  EasyStore
//
//  Created by Jeremy Nortey on 9/28/13.
//  Copyright (c) 2013 Jeremy Nortey. All rights reserved.
//

#import "EasyTable.h"


@implementation EasyTable

/* Public Methods */

-(id)initWithName:(NSString*)name{
    self = [super init];
    if (self) {
        _name = [[NSString alloc] initWithString:name];
        _columns = [NSMutableArray new];
    }
    return self;
}


/*
 Create column
 */
-(EasyColumn*)createColumnWithName:(NSString*)name withType:(int)type{
    EasyColumn* column = [[EasyColumn alloc] initWitName:name withType:type];
    [_columns addObject:column];
    
    return column;
}


/* Private Methods */
-(NSString*)getCreationString;{
    NSMutableArray* columnStringArray = [NSMutableArray new];
    for(EasyColumn* column in _columns){
        [columnStringArray addObject:[column getCreationString]];
    }
    
    NSString* allColumnStrings = [columnStringArray componentsJoinedByString:@", "];
    NSString* createString = [NSString stringWithFormat:@"( %@ )", allColumnStrings];
    
    return createString;
}


/* Properties */

-(NSString*)getName{
    return _name;
}

@end
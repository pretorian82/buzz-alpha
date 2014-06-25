//
//  Grade.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "Grade.h"

@implementation Grade

- (instancetype)initWithType:(NSString *)type value:(NSNumber *)value date:(NSDate *)date
{
    self = [super init];
    if (self) {
        _type = type;
        _value = value;
        _date = date;
        
        return self;
    }
    
    return nil;
}

@end

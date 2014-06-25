//
//  Subject.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "Subject.h"

@implementation Subject

- (instancetype)initWithTitle:(NSString *)title average:(NSNumber *)average
{
    self = [super init];
    if (self) {
        _title = title;
        _average = average;
        return self;
    }
    return nil;
}

@end

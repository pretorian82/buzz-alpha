//
//  Grade.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grade : NSObject

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) NSDate *date;

- (instancetype)initWithType:(NSString *)type value:(NSNumber *)value date:(NSDate *)date;

@end

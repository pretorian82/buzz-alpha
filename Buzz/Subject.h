//
//  Subject.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *average;

- (instancetype)initWithTitle:(NSString *)title average:(NSNumber *)average;

@end

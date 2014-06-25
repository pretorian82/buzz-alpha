//
//  GraphViewController.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FDGraphView;

@interface GraphViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *pointGrades;
@property (nonatomic) FDGraphView *graphView;

@end

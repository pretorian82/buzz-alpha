//
//  GradeViewController.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GradeTableViewController;
@class GraphViewController;

@interface GradeViewController : UIViewController

@property (nonatomic, strong) GradeTableViewController *tableViewController;
@property (nonatomic, strong) GraphViewController *graphViewController;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end

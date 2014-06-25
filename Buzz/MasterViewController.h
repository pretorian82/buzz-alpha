//
//  MasterViewController.h
//  Buzz
//
//  Created by Manfredi on 23/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *subjects;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end

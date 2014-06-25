//
//  GradeViewController.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "GradeViewController.h"

#import "MasterViewController.h"
#import "GradeTableViewController.h"
#import "GraphViewController.h"
#import "AddGradeViewController.h"
#import "Grade.h"

#import "FDGraphView.h"

@interface GradeViewController ()

@property (nonatomic, strong) NSMutableArray *gradesArray;

@end

@implementation GradeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Lazy Init
    [self gradesArray];
}

#pragma mark - Useful Method(s)

- (NSMutableArray *)gradesArray
{
    if (!_gradesArray) {
        _gradesArray = [[NSMutableArray alloc] init];
    }
    return _gradesArray;
}

- (void)reloadViews
{
    [self.tableViewController.tableView reloadData];
    [self.graphViewController.graphView setNeedsDisplay];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"graphSegue"]) {
        GraphViewController *graphViewController = (GraphViewController *)segue.destinationViewController;
        [self setGraphViewController:graphViewController];
        graphViewController.pointGrades = self.gradesArray;
    }
    
    if ([segue.identifier isEqualToString:@"tableSegue"]) {
        GradeTableViewController *tableViewController = (GradeTableViewController *)segue.destinationViewController;
        [self setTableViewController:tableViewController];
        tableViewController.tableGrades = self.gradesArray;
    }
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnNew"]) {
        AddGradeViewController *addController = [segue sourceViewController];
        
        if (addController.grade) {
            [self gradesArray];
            [_gradesArray insertObject:addController.grade atIndex:0]; // New object will be added as first object
            [self reloadViews]; // Reload Graph and Table View's
        }
        //[self dismissViewControllerAnimated:YES completion:NULL]; No need
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnCancel"]) {
        //[self dismissViewControllerAnimated:YES completion:NULL]; No need
    }
}

@end

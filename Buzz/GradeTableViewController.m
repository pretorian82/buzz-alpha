//
//  GradeTableViewController.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "GradeTableViewController.h"
#import "GraphViewController.h"
#import "GradeTableViewCell.h"

#import "Grade.h"

@interface GradeTableViewController ()

@end

@implementation GradeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //lazy init
    [self tableGrades];
    
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the # of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the # of rows in the section.
    return [self.tableGrades count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GradeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gradeCell" forIndexPath:indexPath];
    
    Grade *grade = _tableGrades[indexPath.row];
    
    // Configure the cell...
    cell.typeLabel.text = [grade type];
    cell.valueLabel.text = [NSString stringWithFormat:@"%@", [grade value]];
    cell.dateLabel.text = [NSString stringWithFormat:@"%@", [grade date]];
    
    return cell;
}

#pragma mark - Useful Method(s)

- (NSMutableArray *)tableGrades
{
    if (!_tableGrades) {
        _tableGrades = [[NSMutableArray alloc] init];
    }
    return _tableGrades;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

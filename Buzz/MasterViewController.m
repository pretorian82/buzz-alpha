//
//  MasterViewController.m
//  Buzz
//
//  Created by Manfredi on 23/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "MasterViewController.h"
#import "AddSubjectViewController.h"

#import "Subject.h"
#import "OverviewTableViewCell.h"

@interface MasterViewController () {
    
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Lazy Init
    [self subjects];
    
}

/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/

#pragma mark - Useful Method(s)

- (NSMutableArray *)subjects
{
    if (!_subjects) {
        _subjects = [[NSMutableArray alloc] init];
    }
    return _subjects;
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.subjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OverviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"overViewCell" forIndexPath:indexPath];
    
    Subject *subject = _subjects[indexPath.row];
    
    cell.titleLabel.text = [subject title];
    cell.averageLabel.text = [NSString stringWithFormat:@"%@", [subject average]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_subjects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _subjects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}
*/

#pragma mark - Unwind Segue(s)

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        AddSubjectViewController *addController = [segue sourceViewController];
        
        if (addController.subject) {
            [_subjects addObject:addController.subject];
            [self.tableView reloadData];
    
            //            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            //            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            //            [_subjects insertObject:addController.subject atIndex:0]; // New object will be added as first object
            
        }
        //[self dismissViewControllerAnimated:YES completion:NULL]; No need
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        //[self dismissViewControllerAnimated:YES completion:NULL]; No need
    }
}

@end

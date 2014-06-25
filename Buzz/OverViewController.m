//
//  MasterViewController.m
//  Buzz
//
//  Created by Manfredi on 23/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "OverViewController.h"
#import "AddSubjectViewController.h"

#import "Subject.h"
#import "OverviewTableViewCell.h"

@interface OverViewController () {
    
}
@end

@implementation OverViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self subjects];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
#pragma mark - Convenience Method(s)

- (NSMutableArray *)subjects
{
    if (!_subjects) {
        _subjects = [[NSMutableArray alloc] init];
    }
    return _subjects;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _subjects.count;
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

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        AddSubjectViewController *addController = [segue sourceViewController];
        
        if (addController.subject) {
            [_subjects addObject:addController.subject];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_subjects.count-1 inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            [self.tableView reloadData];
        }
        //[self dismissViewControllerAnimated:YES completion:NULL]; SEGUE AUTOMATICALLY DOES
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        //[self dismissViewControllerAnimated:YES completion:NULL]; SEGUE AUTOMATICALLY DOES
    }
}

@end

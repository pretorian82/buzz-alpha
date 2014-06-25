//
//  AddSubjectViewController.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "AddSubjectViewController.h"
#import "Subject.h"

@interface AddSubjectViewController ()

@end

@implementation AddSubjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleInput.delegate = self;
}

#pragma mark - Useful Method(s)

- (NSString *)titleForSubject
{
    return self.titleInput.text;
}

#pragma mark - Textfield Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.titleInput) {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if ([self.titleInput.text length]) {
            
            Subject *newSubject = [[Subject alloc] initWithTitle:[self titleForSubject] average:[NSNumber numberWithFloat:0.0]];
            self.subject = newSubject;
            NSLog(@"Subject Fired");
        }
    }
}


@end

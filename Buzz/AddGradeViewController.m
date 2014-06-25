//
//  AddGradeViewController.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "AddGradeViewController.h"
#import "Grade.h"

@interface AddGradeViewController ()

@end

@implementation AddGradeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Populate types
    self.types = @[@"Scritto", @"Orale", @"Pratico"];
    
    // Set UITextField delegates
    self.typeTextField.delegate = self;
    self.valueTextField.delegate = self;
    self.dateTextField.delegate = self;
    
    // Set UIPickerView delegates
//    self.typePickerView.dataSource = self;
//    self.typePickerView.delegate = self;
}

#pragma mark - UIPickerView Delegate 

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.types count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return (NSString *)[self.types objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.typeTextField.text = (NSString *)[self.types objectAtIndex:row];
}


#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.typeTextField) {
        [self makePickerView];
        [self makeToolbarForPickerView];
        textField.inputView = self.typePickerView;
        textField.inputAccessoryView = self.toolbar;
    }
    
    else if  (textField == self.dateTextField) {
        [self makeDatePicker];
        [self makeToolbarForDatePicker];
        textField.inputView = self.datePicker;
        textField.inputAccessoryView = self.toolbar;
        
    } else {}
        
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.valueTextField) {
        [textField resignFirstResponder];
    }
    return YES;
}


#pragma mark - Picker View related methods

- (void)makePickerView
{
    self.typePickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    [self.typePickerView setDataSource:self];
    [self.typePickerView setDelegate:self];
    self.typePickerView.backgroundColor = [UIColor whiteColor];
}

- (void)makeToolbarForPickerView
{
    self.toolbar = [[UIToolbar alloc] init];
    self.toolbar.barStyle = UIBarStyleDefault;
    self.toolbar.translucent = YES;
    self.toolbar.tintColor = nil;
    [self.toolbar sizeToFit];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(removePickerView)];
    [self.toolbar setItems:@[doneButton]];
}

- (void)removePickerView
{
    [self.typeTextField resignFirstResponder];
}


#pragma mark - UIDatePicker related methods

- (void)makeDatePicker
{
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.backgroundColor = [UIColor whiteColor];
}

- (void)makeToolbarForDatePicker
{
    self.toolbar = [[UIToolbar alloc] init];
    self.toolbar.barStyle = UIBarStyleDefault;
    self.toolbar.translucent = YES;
    self.toolbar.tintColor = nil;
    [self.toolbar sizeToFit];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(removeDatePicker)];
    [self.toolbar setItems:@[doneButton]];
}

- (void)changeTextOf:(UITextField *)textField from:(UIDatePicker *)datePicker with:(NSDateFormatter *)dateFormatter
{
    textField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:datePicker.date]];
}

- (void)removeDatePicker
{
    [self changeTextOf:self.dateTextField from:self.datePicker with:self.formatter];
    [self.dateTextField resignFirstResponder];
}

- (NSDateFormatter *)formatter
{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setTimeStyle:NSDateFormatterNoStyle];
        [_formatter setDateStyle:NSDateFormatterShortStyle];
        [_formatter setDateFormat:@"dd/MM/yyyy"];
        
    }
    return _formatter;
}

#pragma mark - Useful Method(s)

- (NSString *)typeForGrade
{
    return self.typeTextField.text;
}

- (NSNumber *)valueForGrade
{
    return [NSNumber numberWithFloat:[self.valueTextField.text intValue ]];
}

- (NSDate *)dateForGrade
{
    return self.datePicker.date;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ReturnNew"]) {
        
        if ([self.typeTextField.text length] && [self.valueTextField.text length] && [self.dateTextField.text length]) {
            Grade *newGrade = [[Grade alloc] initWithType:[self typeForGrade] value:[self valueForGrade] date:[self dateForGrade]];
            self.grade = newGrade;
            NSLog(@"Grade Fired");
        }
    }
}



@end

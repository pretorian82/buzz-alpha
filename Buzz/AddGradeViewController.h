//
//  AddGradeViewController.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Grade;

@interface AddGradeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) Grade *grade;

@property (strong, nonatomic) IBOutlet UITextField *typeTextField;
@property (strong, nonatomic) IBOutlet UITextField *valueTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateTextField;

@property (nonatomic, strong) NSArray *types;

@property (nonatomic, strong) UIPickerView *typePickerView;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

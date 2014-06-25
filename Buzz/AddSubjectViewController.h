//
//  AddSubjectViewController.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Subject;

@interface AddSubjectViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) Subject *subject;

@property (weak, nonatomic) IBOutlet UIView *someView;
@property (weak, nonatomic) IBOutlet UITextField *titleInput;

@end

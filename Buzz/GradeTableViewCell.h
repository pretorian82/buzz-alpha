//
//  GradeTableViewCell.h
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;

@end

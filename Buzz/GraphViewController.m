//
//  GraphViewController.m
//  Buzz
//
//  Created by Manfredi on 24/06/14.
//  Copyright (c) 2014 Manfredi. All rights reserved.
//

#import "GraphViewController.h"
#import "FDGraphView.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Lazy Init
    [self graphView];
    [self pointGrades];
    
    // Setup
    [self setUpGraphView];
}


#pragma mark - GraphView Method(s)
- (FDGraphView *)graphView
{
    if (!_graphView) {
        _graphView = [[FDGraphView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    }
    return _graphView;
}

- (NSMutableArray *)pointGrades
{
    if (!_pointGrades) {
        _pointGrades = [[NSMutableArray alloc] init];
    }
    return _pointGrades;
}


- (void)setUpGraphView
{
    // Style
    _graphView.backgroundColor = [UIColor colorWithRed:0.216 green:0.216 blue:0.216 alpha:1];
    _graphView.linesColor = [UIColor whiteColor];
    _graphView.dataPointColor = [UIColor colorWithRed:0.945 green:0.475 blue:0.243 alpha:1];
    _graphView.dataPointStrokeColor = [UIColor colorWithRed:0.945 green:0.475 blue:0.243 alpha:1];
    
    // Data
    _graphView.dataPoints = self.pointGrades;
    
    // View
    [self.view addSubview:_graphView];
}


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

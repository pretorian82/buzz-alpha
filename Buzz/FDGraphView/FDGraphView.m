//
//  FDGraphView.m
//  disegno
//
//  Created by Francesco Di Lorenzo on 14/03/13.
//  Copyright (c) 2013 Francesco Di Lorenzo. All rights reserved.
//

#import "FDGraphView.h"
#import "Grade.h"

@interface FDGraphView()

@property (nonatomic, strong) NSNumber *maxDataPoint;
@property (nonatomic, strong) NSNumber *minDataPoint;

@end

@implementation FDGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // default values
        _edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        _dataPointColor = [UIColor whiteColor];
        _dataPointStrokeColor = [UIColor blackColor];
        _linesColor = [UIColor grayColor];
        _autoresizeToFitData = NO;
        _dataPointsXoffset = 100.0f;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (NSNumber *)maxDataPoint {
    if (_maxDataPoint) {
        return _maxDataPoint;
    } else {
        if (self.dataPoints.count > 0) {
            Grade *materia = self.dataPoints[0];
            __block CGFloat max = ((NSNumber *)materia.value).floatValue;
            [self.dataPoints enumerateObjectsUsingBlock:^(Grade *n, NSUInteger idx, BOOL *stop) {
                if (n.value.floatValue > max)
                    max = n.value.floatValue;
            }];
            return @(max);
        }else{
            return 0;
        }
    }
}

- (NSNumber *)minDataPoint {
    if (_minDataPoint) {
        return _minDataPoint;
    } else {
        if (self.dataPoints.count > 0) {
            Grade *materia = self.dataPoints[0];
            __block CGFloat min = ((NSNumber *)materia.value).floatValue;
            [self.dataPoints enumerateObjectsUsingBlock:^(Grade *n, NSUInteger idx, BOOL *stop) {
                if (n.value.floatValue < min)
                    min = n.value.floatValue;
            }];
            return @(min);
        }else{
            return 0;
        }
    }
}

- (CGFloat)widhtToFitData {
    CGFloat res = 0;
    
    if (self.dataPoints) {
        res += (self.dataPoints.count - 1)*self.dataPointsXoffset; // space occupied by data points
        res += (self.edgeInsets.left + self.edgeInsets.right) ; // lateral margins;
    }
    
    return res;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // STYLE
    // lines color
    [self.linesColor setStroke];
    // lines width
    CGContextSetLineWidth(context, 3);
    
    // Calculate the points
    NSInteger count = self.dataPoints.count;
    CGPoint graphPoints[count];
    
    CGFloat drawingWidth, drawingHeight, min, max;
    
    drawingWidth = rect.size.width - self.edgeInsets.left - self.edgeInsets.right;
    drawingHeight = rect.size.height - self.edgeInsets.top - self.edgeInsets.bottom;
    min = ((NSNumber *)[self minDataPoint]).floatValue;
    max = ((NSNumber *)[self maxDataPoint]).floatValue;
    
    if (count > 1) {
        for (int i = 0; i < count; ++i) {
            CGFloat x, y, dataPointValue;
            Grade *voto = self.dataPoints[i];
            dataPointValue = ((NSNumber *)voto.value).floatValue;
            
            x = self.edgeInsets.left + (drawingWidth/(count-1))*i;
            if (max != min)
                y = rect.size.height - ( self.edgeInsets.bottom + drawingHeight*( (dataPointValue - min) / (max - min) ) );
            else // the graph is a straight line
                y = rect.size.height/2;
            
            graphPoints[i] = CGPointMake(x, y);
        }
    } else if (count == 1) {
        // put the point in the middle
        graphPoints[0].x = drawingWidth/2;
        graphPoints[0].y = drawingHeight/2;
    } else {
        return;
    }
    
    // DRAW THE GRAPH
    CGContextAddLines(context, graphPoints, count);
    CGContextStrokePath(context);
    
    // DRAW DATA POINTS
    for (int i = 0; i < count; ++i) {
        CGRect ellipseRect = CGRectMake(graphPoints[i].x-3, graphPoints[i].y-3, 6, 6);
        CGContextAddEllipseInRect(context, ellipseRect);
        CGContextSetLineWidth(context, 2);
        [self.dataPointStrokeColor setStroke];
        [self.dataPointColor setFill];
        CGContextFillEllipseInRect(context, ellipseRect);
        CGContextStrokeEllipseInRect(context, ellipseRect);
    }
}

#pragma mark - Custom setters

- (void)changeFrameWidthTo:(CGFloat)width {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}

- (void)setDataPointsXoffset:(CGFloat)dataPointsXoffset {
    _dataPointsXoffset = dataPointsXoffset;
    
    if (self.autoresizeToFitData) {
        CGFloat widthToFitData = [self widhtToFitData];
        if (widthToFitData > self.frame.size.width) {
            [self changeFrameWidthTo:widthToFitData];
        }
    }
}

- (void)setAutoresizeToFitData:(BOOL)autoresizeToFitData {
    _autoresizeToFitData = autoresizeToFitData;
    
    CGFloat widthToFitData = [self widhtToFitData];
    if (widthToFitData > self.frame.size.width) {
        [self changeFrameWidthTo:widthToFitData];
    }
}

- (void)setDataPoints:(NSArray *)dataPoints {
    _dataPoints = dataPoints;
    
    if (self.autoresizeToFitData) {
        CGFloat widthToFitData = [self widhtToFitData];
        if (widthToFitData > self.frame.size.width) {
            [self changeFrameWidthTo:widthToFitData];
        }
    }
}

@end

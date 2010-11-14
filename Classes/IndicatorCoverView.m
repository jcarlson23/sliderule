//
//  IndicatorCoverView.m
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import "IndicatorCoverView.h"


@implementation IndicatorCoverView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		[self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	// create a border, with a small triangle for the indicator at the midpoint.
	CGFloat width = rect.size.width;
	CGFloat height= rect.size.height;
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextSetLineWidth(context, 3.0);
	
	CGContextMoveToPoint(context, 0, 0);
	CGContextAddLineToPoint(context, width, 0);
	CGContextAddLineToPoint(context, width, height);
	CGContextAddLineToPoint(context, 0, height);
	CGContextAddLineToPoint(context, 0, 0);
	CGContextStrokePath(context);
	
	// draw our triangle
	CGFloat triDim = height/5;
	CGFloat x1 = width/2 - triDim, x2 = width/2 + triDim, y1 = triDim, y2 = 0;
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextMoveToPoint(context, x1, y2);
	CGContextAddLineToPoint(context, width/2, y1);
	CGContextAddLineToPoint(context, x2, y2);
	CGContextAddLineToPoint(context, x1, y2);
	CGContextFillPath(context);
	
	// CGContextRestoreGState(context);
	
	
	
}


- (void)dealloc {
    [super dealloc];
}


@end

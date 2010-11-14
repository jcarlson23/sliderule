//
//  LineView.m
//  UIWork
//
//  Created by Jared Carlson on 11/8/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import "LineView.h"


@implementation LineView


@synthesize ticksPerMinorInterval=_ticksPerMinorInterval;
@synthesize ticksPerMajorInterval=_ticksPerMajorInterval;
@synthesize  minTickValue=_minTickValue;
@synthesize  maxTickValue=_maxTickValue;
@synthesize textColor=_textColor;
@synthesize lineColor=_lineColor;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		[self setBackgroundColor:[UIColor clearColor]];
		
		_ticksPerMinorInterval = 10;
		_ticksPerMajorInterval = 10;
		_minTickValue = 0.0;
		_maxTickValue = 100.0;
		
		_textColor = [UIColor whiteColor];
		_lineColor = [UIColor lightGrayColor];
		
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGRect line = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, 4);
	CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
	CGContextAddRect(context, line);
	CGContextFillPath(context);
	
	// draw the ticks...
	CGFloat width = self.frame.size.width;
	CGFloat x     = 0.0;
	CGFloat mid   = self.frame.size.height/2;
	CGFloat y     = mid/4;
	CGContextSetLineWidth(context, 2.0);
	CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
	
	for ( x=0.0; x<=width; x+=(width/(_ticksPerMinorInterval+1)) )
	{
		CGContextMoveToPoint(context, x, mid-y);
		CGContextAddLineToPoint(context, x, mid-y);
		CGContextAddLineToPoint(context, x, mid+y);
		CGContextStrokePath(context);
		CGFloat smallWidth = (width/(_ticksPerMinorInterval+1));
		for (float dx=smallWidth/10.0f; dx<smallWidth; dx+=(smallWidth/10.0f))
		{
			CGContextMoveToPoint(context, x+dx, mid-y/2);
			CGContextAddLineToPoint(context, x+dx, mid-y/2);
			CGContextAddLineToPoint(context, x+dx, mid+y/2);
			CGContextStrokePath(context);
		}
		
	}
	
		
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark ScrollView Delegate Method
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	NSLog(@"Scrolling view %@",scrollView);
}

@end

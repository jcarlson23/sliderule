//
//  SlideRuleControlView.m
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import "SlideRuleControlView.h"
#import "GradientCoverView.h"
#import "CustomSliderView.h"
#import "IndicatorCoverView.h"
#import "CustomSliderTheme.h"

@implementation SlideRuleControlView

@synthesize slideDelegate;

- (id)initWithFrame:(CGRect)frame params:(SliderParam*)params
{
	if ( (self = [super initWithFrame:frame]) )
	{
		// initialization code
		slider = [[CustomSliderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:slider];
		slider.maxValue = 10.0;
		slider.minValue = 0.0;
		[slider setSliderDelegate:self];
		
		cover = [[GradientCoverView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:cover];
		[cover setUserInteractionEnabled:NO];
		[cover release];
		
		indicator = [[IndicatorCoverView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:indicator];
		[indicator setUserInteractionEnabled:NO];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		slider = [[CustomSliderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:slider];
		slider.maxValue = 10.0;
		slider.minValue = 0.0;
		[slider setSliderDelegate:self];
		
		cover = [[GradientCoverView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:cover];
		[cover setUserInteractionEnabled:NO];
		[cover release];
		
		indicator = [[IndicatorCoverView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:indicator];
		[indicator setUserInteractionEnabled:NO];
		
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
	
	[indicator release];
	[cover release];
	[slider release];
    [super dealloc];
}


- (IBAction) valueDidChange:(UIEvent*)event
{
	CGFloat value = [self currentValue];
	NSLog(@"The current value is %f",value);
}

#pragma mark -
#pragma mark Setters
- (void) applyTheme:(CustomSliderTheme*)theme
{
	// set the indicator color
	NSLog(@"indicator color %@",theme.indicatorColor);
	[indicator setIndicatorColor:theme.indicatorColor];
	
	// set the gradient colors
	[slider setGradientColors:theme.gradientColors];
	
	// apply the line color
	[slider setLineColor:theme.lineColor];
	
	// apply the text color 
	[slider setTextColor:theme.textColor];
	
	// apply the background color
	[slider setBackgroundColorChart:theme.backgroundColor];
	[slider setBackgroundColor:theme.backgroundColor];
	
	// done...
	[slider setNeedsDisplay];
}

- (CGFloat) currentValue
{

	CGSize  scrollSize = [slider contentSize];
	CGFloat range      = slider.maxValue - slider.minValue;
	CGFloat scrollX    = [slider contentOffset].x;
	CGFloat scaledX    = scrollX / (scrollSize.width/2.0);
	CGFloat xvalue     = scaledX * range + slider.minValue;
	return xvalue;
}

@end

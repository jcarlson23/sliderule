//
//  CustomSliderView.m
//  UIWork
//
//  Created by Jared Carlson on 11/8/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import "CustomSliderView.h"
#import "GradientView.h"
#import "LineView.h"
#import "AnnotationView.h"
#import "CustomSliderTheme.h"
#import "SlideRuleControlView.h"

@implementation CustomSliderView(Hidden)

- (void) setup:(SliderParam*)parms;
{
	// set the scale of the slider..
	if ( parms ) {
		scale = parms->s;
	} else {
		scale = 3;
	}
	
	CGSize contentSize = CGSizeMake(scale*self.bounds.size.width, self.bounds.size.height);
	CGFloat width = self.bounds.size.width;
	[self setContentSize:contentSize];
	
	// set the background
	backgroundGradient = [[GradientView alloc] initWithFrame:CGRectMake(0, 0, scale*width, self.contentSize.height)];
	[backgroundGradient setHighColor:[gradientColors objectAtIndex:0]];
	[backgroundGradient	setLowColor:[gradientColors objectAtIndex:1]];
	[self addSubview:backgroundGradient];
	
	if ( parms ) {
		_line = [[LineView alloc] initWithFrame:CGRectMake(0, 0, scale*width, self.contentSize.height) params:parms];
	} else {
		_line = [[LineView alloc] initWithFrame:CGRectMake(0, 0, scale*width, self.contentSize.height)];
	}
	[self setDelegate:_line];
	[self addSubview:_line];
	
	if ( parms ) {
		_annotations = [[AnnotationView alloc] initWithFrame:CGRectMake(0, 0, scale*width, self.contentSize.height) 
											   params:parms];
	} else {
		_annotations = [[AnnotationView alloc] initWithFrame:CGRectMake(0, 0, scale*width, self.contentSize.height)];
	}
	[self addSubview:_annotations];
	
	/* For styling constraints */
	[self setBounces:YES];
	[self setShowsVerticalScrollIndicator:NO];
	[self setShowsHorizontalScrollIndicator:NO];
	
	[self setDelegate:self];
	
	CGPoint startingContextPt = CGPointMake( (scale - 1) * width / 2 , 0);
	[self setContentOffset:startingContextPt];
}

@end

@implementation CustomSliderView

@synthesize backgroundGradient;
@synthesize minValue=_minValue;
@synthesize maxValue=_maxValue;
@synthesize currentValue=_currentValue;
@synthesize ticksInMinorInterval;
@synthesize ticksInMajorInerval;
@synthesize lineColor;
@synthesize textColor;
@synthesize borderColor;
@synthesize gradientColors;
@synthesize SliderDelegate;
@synthesize scale;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		if ( gradientColors == nil ) {
			gradientColors = [[NSArray alloc] initWithObjects:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.9],
						  [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1],nil];
		}
		
		[self setup:NULL];
		
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
	
	[backgroundGradient release];
	[_annotations release];
	[_line release];
    [super dealloc];
}

- (void) setTextColor:(UIColor *)color
{
	[textColor release];
	textColor = [color retain];
	[_annotations setTextColor:color];
	[_annotations setNeedsDisplay];
}

- (void) setLineColor:(UIColor *)color
{
	[lineColor release];
	lineColor = [color retain];
	[_line setLineColor:color];
	[_line setNeedsDisplay];
}

- (void) setGradientColors:(NSArray *)array
{
	[gradientColors release];
	gradientColors  = [array retain];
	[backgroundGradient setHighColor:[gradientColors objectAtIndex:0]];
	[backgroundGradient	setLowColor:[gradientColors objectAtIndex:1]];
}

- (void) setBackgroundColorChart:(UIColor*)color
{
	[_line setBackgroundColor:color];
}

#pragma mark -
#pragma mark ScrollView Delegate
- (void) scrollViewDidScroll:(UIScrollView *) scrollView
{
	NSLog(@"Scrolling position is %f",self.contentOffset.x);
	CGFloat width = self.frame.size.width;
	CGFloat x = self.contentOffset.x;
	CGFloat w = self.contentSize.width - width;
	CGFloat temp = ( x / w ) * ( _maxValue - _minValue ) + _minValue;
	NSLog(@"Immediate value calculated as %f",temp);
	
	if ( SliderDelegate)
	{
		[SliderDelegate valueDidChange:nil];
	}
}

@end



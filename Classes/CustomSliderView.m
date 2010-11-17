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

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		CGSize contentSize = CGSizeMake(2*self.bounds.size.width, self.bounds.size.height);
		CGFloat width = self.bounds.size.width;
		[self setContentSize:contentSize];
		backgroundGradient = [[GradientView alloc] initWithFrame:CGRectMake(-0.0*width, 0, 2*width, self.contentSize.height)];
		[backgroundGradient setHighColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.9]];
		[backgroundGradient	setLowColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1]];
		[self addSubview:backgroundGradient];
		
		_line = [[LineView alloc] initWithFrame:CGRectMake(-0.0*width, 0, 2*width, self.contentSize.height)];
		[self setDelegate:_line];
		[self addSubview:_line];
		
		_annotations = [[AnnotationView alloc] initWithFrame:CGRectMake(0, 0, 2*width, self.contentSize.height)];
		[self addSubview:_annotations];
		
		// [self.layer setBorderColor:[UIColor blackColor].CGColor];
		// [self.layer setBorderWidth:2.0f];
		
		/* For styling constraints */
		[self setBounces:YES];
		[self setShowsVerticalScrollIndicator:NO];
		[self setShowsHorizontalScrollIndicator:NO];
		
		[self setDelegate:self];
		
		CGPoint startingContextPt = CGPointMake( width / 2, 0);
		[self setContentOffset:startingContextPt];
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


#pragma mark -
#pragma mark ScrollView Delegate
- (void) scrollViewDidScroll:(UIScrollView *) scrollView
{
	NSLog(@"Scrolling position is %f",self.contentOffset.x);
	
	if ( SliderDelegate)
	{
		[SliderDelegate valueDidChange:nil];
	}
}

@end

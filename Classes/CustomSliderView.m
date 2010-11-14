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


@implementation CustomSliderView

@synthesize backgroundGradient;
@synthesize minValue=_minValue;
@synthesize maxValue=_maxValue;
@synthesize ticksInMinorInterval;
@synthesize ticksInMajorInerval;
@synthesize lineColor;
@synthesize textColor;
@synthesize borderColor;
@synthesize gradientColors;

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
		
		/* Add a top mask for a mask to give a 3-D look */
		CAGradientLayer * gradient = [CAGradientLayer layer];
		[gradient setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
		[gradient setTransform:CATransform3DMakeRotation(90 * M_PI / 180.0, 0, 0, 1)];
		UIColor * semiBlack = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
		[gradient setColors:(id)[NSArray arrayWithObjects:semiBlack.CGColor,(id)[UIColor clearColor].CGColor,(id)semiBlack.CGColor,nil]];
		[[self layer] addSublayer:gradient];
		
		// [self.layer setBorderColor:[UIColor blackColor].CGColor];
		// [self.layer setBorderWidth:2.0f];
		
		/* For styling constraints */
		[self setBounces:NO];
		[self setShowsVerticalScrollIndicator:NO];
		[self setShowsHorizontalScrollIndicator:NO];
		
		[self setDelegate:self];
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
	NSLog(@"The scroll stopped.");
	[self updatePosition:nil];
	[_timer invalidate];
	_timer = nil;
}

- (void)updatePosition:(NSTimer*)timer
{
	NSLog(@"Scrolling position is %f",self.contentOffset.x);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	NSLog(@"About to start scrolling..");
	_timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(updatePosition:)
											userInfo:nil repeats:YES];
}

@end

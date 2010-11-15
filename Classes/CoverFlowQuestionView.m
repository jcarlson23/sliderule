//
//  CoverFlowQuestionView.m
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import "CoverFlowQuestionView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CoverFlowQuestionView

@synthesize questions = _questions;
@synthesize borderColor = _borderColor;
@synthesize backgroundColor = _backgroundColor;
@synthesize textColor = _textColor;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		CGFloat width = frame.size.width;
		CGFloat height= frame.size.height;
		CGFloat scale = height/width;
		//
		// split the frame up 1/3 vs 2/3 for the top
		//
		
		// gradient background...
		CAGradientLayer * gradient = [CAGradientLayer layer];
		[gradient setFrame:CGRectMake(0, 0, width, height)];
		CATransform3D transform = CATransform3DMakeRotation(90.0*M_PI/180.0, 0, 0, 1);
		CATransform3D scaling   = CATransform3DMakeScale(1/scale, scale, 1);
		transform = CATransform3DConcat(transform, scaling);
		[gradient setTransform:transform];
		UIColor * semiBlack = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15];
		UIColor * semiWhite = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.15];
		[gradient setColors:[NSArray arrayWithObjects:(id)semiBlack.CGColor,
													  (id)semiWhite.CGColor,
													 (id)semiBlack.CGColor,nil]];
		[[self layer] addSublayer:gradient];
		
		[[self layer] setBorderColor:[UIColor darkGrayColor].CGColor];
		[[self layer] setBorderWidth:2.0f];
		
		// bottom third of the view...
		_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 2*height/3, width, height/3)];
		[_scrollView setBackgroundColor:[UIColor clearColor]];
		CGSize scrollSize = CGSizeMake(width*2, height/3);
		[_scrollView setContentSize:scrollSize];
		[_scrollView setBounces:NO];
		[[_scrollView layer] setBorderColor:[UIColor lightGrayColor].CGColor];
		[[_scrollView layer] setBorderWidth:2.0f];
		[self addSubview:_scrollView];
		[_scrollView setDelegate:self];
		
		
		// populate the scrollview with the survey questions...
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
	
	[_scrollView release];
	
    [super dealloc];
}

- (void) layoutQuestions:(NSArray*)items
{
	self.questions = items;
	[self addQuestions];
}

@end


@implementation CoverFlowQuestionView(Hidden)

- (void) addQuestions
{
	NSUInteger numberOfQuestions = [_questions count];
	CGFloat dim = [self frame].size.width / numberOfQuestions;
	CGFloat x, dx = dim;
	x += 0.05*dim;
	
	for (NSString * string in _questions)
	{
		UIView * qView = [[UIView alloc] initWithFrame:CGRectMake(x, 5, 0.9*dim, 0.9*dim)];
		[[qView layer] setCornerRadius:0.225*dim];
		UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0.9*dim, 0.9*dim)];
		[label setText:string];
		[label setBackgroundColor:[UIColor clearColor]];
		[qView addSubview:label];
		[label release];
		[qView setBackgroundColor:[UIColor redColor]];
		[_scrollView addSubview:qView];
		[qView release];
		x += dim;
	}
	
}

#pragma mark -
#pragma mark ScrollView Delegate
- (void) scrollViewDidScroll:(UIScrollView *) scrollView
{
	// update the subviews in the scroller based on teh content offset...
	
}

@end

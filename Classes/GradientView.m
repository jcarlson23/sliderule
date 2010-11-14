//
//  GradientView.m
//  UIWork
//
//  Created by Jared Carlson on 11/8/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//


#import "GradientView.h"

@implementation GradientView

@synthesize _highColor;
@synthesize _lowColor;
@synthesize gradientLayer;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		gradientLayer = [[CAGradientLayer alloc] init];
		[gradientLayer setBounds:[self bounds]];
		[gradientLayer setPosition:
		 CGPointMake([self bounds].size.width/2, 
					 [self bounds].size.height/2)];
		
		_highColor = nil;
		_lowColor  = nil;
		
		// [[self layer] setCornerRadius:8.0];
		//
		// insert the layer at position zero
		//
		[[self layer] insertSublayer:gradientLayer atIndex:0];
		
		// turn on masking
		[[self layer] setMasksToBounds:YES];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	if ( _highColor && _lowColor )
	{
		[gradientLayer setColors:[NSArray arrayWithObjects:(id)[_highColor CGColor],
								  (id)[_lowColor CGColor],nil]];
	}
	[super drawRect:rect];
}


- (void)dealloc {
	[gradientLayer release];
	[_highColor release];
	[_lowColor release];
    [super dealloc];
}

- (void) setHighColor:(UIColor*)color
{
	[self set_highColor:color];
	[[self layer] setNeedsDisplay];
}

- (void) setLowColor:(UIColor*)color
{
	[self set_lowColor:color];
	[[self layer] setNeedsDisplay];
}

@end

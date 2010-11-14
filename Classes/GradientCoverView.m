//
//  GradientCoverView.m
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import "GradientCoverView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GradientCoverView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		CGFloat w = frame.size.width, h = frame.size.height;
		CGFloat scale = h/w;
		CATransform3D transform = CATransform3DMakeRotation(90.0 * M_PI / 180.0, 0, 0, 1);
		transform = CATransform3DConcat(transform, CATransform3DMakeScale(1/scale, scale, 1));

		
		/* Add a top mask for a mask to give a 3-D look */
		CAGradientLayer * gradient = [CAGradientLayer layer];
		[gradient setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		[gradient setTransform:transform];
		UIColor * semiBlack = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
		UIColor * semiWhite = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
		[gradient setColors:(id)[NSArray arrayWithObjects:(id)semiBlack.CGColor,(id)semiWhite.CGColor,(id)semiBlack.CGColor,nil]];
		[[self layer] addSublayer:gradient];
		
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
    [super dealloc];
}


@end

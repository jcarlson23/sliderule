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


@implementation SlideRuleControlView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		slider = [[CustomSliderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:slider];
		
		GradientCoverView * cover = [[GradientCoverView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		[self addSubview:cover];
		[cover setUserInteractionEnabled:NO];
		[cover release];
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
	[slider release];
    [super dealloc];
}


@end

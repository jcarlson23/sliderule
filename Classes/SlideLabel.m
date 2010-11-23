//
//  SlideLabel.m
//  UIWork
//
//  Created by Jared Carlson on 11/21/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import "SlideLabel.h"


@implementation SlideLabel


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
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

- (void) slideValueChanged:(id)sender
{
	float value = [(SlideRuleControlView*)sender currentValue];
	NSString * valString = [NSString stringWithFormat:@"%f",value];
	[self setText:valString];
}

@end

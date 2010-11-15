//
//  SlideRuleControlView.h
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSliderView;
@class CustomSliderTheme;

@interface SlideRuleControlView : UIView {
	CustomSliderView * slider;
	
}

- (void) setTheme:(CustomSliderTheme*)theme;

@end

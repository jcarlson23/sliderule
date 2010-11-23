//
//  SlideRuleControlView.h
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideRuleParams.h"

@class CustomSliderView;
@class CustomSliderTheme;
@class GradientCoverView;
@class IndicatorCoverView;


@protocol SlideRuleDelegate
- (void) slideValueChanged:(id)sender;
@end

@interface SlideRuleControlView : UIView {
	
	CustomSliderView * slider;
	GradientCoverView * cover;
	IndicatorCoverView * indicator;
	id<SlideRuleDelegate> slideDelegate;
	CGFloat value;
	
}

@property(readonly) CGFloat value;
@property(nonatomic,retain) IBOutlet id<SlideRuleDelegate> slideDelegate;

- (id)initWithFrame:(CGRect)frame params:(SliderParam*)params;
- (void) applyTheme:(CustomSliderTheme*)theme;
- (IBAction) valueDidChange:(UIEvent*)event;
- (CGFloat) currentValue;
- (void) setCurrentValue:(float)_val;

// class methods
+ (SliderParam*) createParametersMin:(float)min max:(float)max scale:(float)scale
					numberMajorTicks:(unsigned int)numberMajorTicks
					numberMinorTicks:(unsigned int)numberMinorTicks 
							  factor:(unsigned int)factor;

@end

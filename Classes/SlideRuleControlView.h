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
	
}

@property(nonatomic,retain) IBOutlet id<SlideRuleDelegate> slideDelegate;

- (void) applyTheme:(CustomSliderTheme*)theme;
- (IBAction) valueDidChange:(UIEvent*)event;
- (CGFloat) currentValue;

@end

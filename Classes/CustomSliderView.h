//
//  CustomSliderView.h
//  UIWork
//
//  Created by Jared Carlson on 11/8/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideRuleParams.h"

@class GradientView;
@class LineView;
@class AnnotationView;
@class SlideRuleControlView;


@interface CustomSliderView : UIScrollView 
<UIScrollViewDelegate>
{

	GradientView * backgroundGradient;
	CGFloat _minValue;
	CGFloat _maxValue;
	CGFloat _currentValue;
	unsigned int ticksInMinorInterval;
	unsigned int ticksInMajorInterval;
	UIColor * lineColor;
	UIColor * textColor;
	UIColor * borderColor;
	NSArray * gradientColors;
	NSUInteger scale;
	
	LineView * _line;
	AnnotationView * _annotations;
	SlideRuleControlView * SliderDelegate;

}

@property(nonatomic,retain) SlideRuleControlView * SliderDelegate;
@property(nonatomic,retain) GradientView * backgroundGradient;
@property(readwrite) CGFloat minValue;
@property(readwrite) CGFloat maxValue;
@property(readwrite) NSUInteger scale;
@property(readonly) CGFloat currentValue;
@property(readwrite) unsigned int ticksInMinorInterval;
@property(readwrite) unsigned int ticksInMajorInerval;
@property(nonatomic,retain) UIColor * lineColor;
@property(nonatomic,retain) UIColor * textColor;
@property(nonatomic,retain) UIColor * borderColor;
@property(nonatomic,retain) NSArray * gradientColors;

- (id)initWithFrame:(CGRect)frame params:(SliderParam*)parms;
- (void) setBackgroundColorChart:(UIColor*)color;

@end

@interface CustomSliderView(Hidden)
- (void) setup:(SliderParam*)parms;
@end


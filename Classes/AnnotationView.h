//
//  AnnotationView.h
//  UIWork
//
//  Created by Jared Carlson on 11/9/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideRuleParams.h"

@interface AnnotationView : UIView {
	NSUInteger numberOfMajorTicks;
	UIColor * textColor;
	float minValue;
	float maxValue;
}

@property(readwrite) NSUInteger numberOfMajorTicks;
@property(nonatomic,retain) UIColor * textColor;

- (id)initWithFrame:(CGRect)frame params:(SliderParam*)parms;

@end

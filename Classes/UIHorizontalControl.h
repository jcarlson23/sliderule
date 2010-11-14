//
//  UIHorizontalControl.h
//  UIWork
//
//  Created by Jared Carlson on 11/6/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIHorizontalControl : UIScrollView 
<UIScrollViewDelegate>
{

	float minValue, maxValue, currentValue;
	float tickRange;
	unsigned int ticksPerRange;
	
	CAGradientLayer * gradientLayer;
	NSArray * _colors;
	
	NSTimer * _timer;
}

/* properties */
@property(readwrite) float minValue;
@property(readwrite) float maxValue;
@property(readonly)  float currentValue;
@property(readwrite) float tickRange;
@property(readwrite) unsigned int ticksPerRange;

/* styles */
- (void) setColors:(NSArray*)colors;
- (void) setTextFont:(UIFont*)font;
- (void) setTextColor:(UIColor*)color;
- (void) setLineColor:(UIColor*)color;

@end

@interface UIHorizontalControl(Hidden)

- (void) createScrollingImage;
- (void) drawSmallLine:(float)xpos;
- (void) drawLargeLine;
- (void) drawText:(NSString*)text;

@end
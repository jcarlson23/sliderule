//
//  GradientView.h
//  GradientTest
//
//  Created by Jared Carlson on 6/19/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface GradientView : UIView {
	CAGradientLayer * gradientLayer;
	UIColor * _highColor;
	UIColor * _lowColor;
}

@property(nonatomic,retain) UIColor * _highColor;
@property(nonatomic,retain) UIColor * _lowColor;
@property(nonatomic,retain) CAGradientLayer * gradientLayer;

- (void) setHighColor:(UIColor*)color;
- (void) setLowColor:(UIColor*)color;

@end

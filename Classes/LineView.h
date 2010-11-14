//
//  LineView.h
//  UIWork
//
//  Created by Jared Carlson on 11/8/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LineView : UIView 
<UIScrollViewDelegate>
{
	unsigned int _ticksPerMinorInterval;
	unsigned int _ticksPerMajorInterval;
	float _minTickValue;
	float _maxTickValue;
	UIColor * _textColor;
	UIColor * _lineColor;
	
}

@property(readwrite) unsigned int ticksPerMinorInterval;
@property(readwrite) unsigned int ticksPerMajorInterval;
@property(readwrite) float minTickValue;
@property(readwrite) float maxTickValue;
@property(nonatomic,retain) UIColor * textColor;
@property(nonatomic,retain) UIColor * lineColor;

@end

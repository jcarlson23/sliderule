//
//  CustomSliderTheme.h
//  UIWork
//
//  Created by Jared Carlson on 11/10/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum CustomSliderEnumerator
{
	kCSThemeNone = 0,
	kCSThemeBlack,
	kCSThemeWhite,
} CustomSliderEnumerator;

@interface CustomSliderTheme : NSObject {
		UIColor * lineColor;
		UIColor * textColor;
		UIColor * borderColor;
		UIColor * indicatorColor;
		NSArray * gradientColors;
		UIColor * backgroundColor;
}

@property(nonatomic,retain) UIColor * lineColor;
@property(nonatomic,retain) UIColor * textColor;
@property(nonatomic,retain) UIColor * borderColor;
@property(nonatomic,retain) UIColor * indicatorColor;
@property(nonatomic,retain) NSArray * gradientColors;
@property(nonatomic,retain) UIColor * backgroundColor;

+ (CustomSliderTheme*) buildTheme:(CustomSliderEnumerator)enumerator;

@end

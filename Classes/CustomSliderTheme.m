//
//  CustomSliderTheme.m
//  UIWork
//
//  Created by Jared Carlson on 11/10/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import "CustomSliderTheme.h"


@implementation CustomSliderTheme

@synthesize lineColor, textColor, borderColor, gradientColors;

+ (CustomSliderTheme*) buildTheme:(CustomSliderEnumerator)enumerator
{
	CustomSliderTheme * theme = [[CustomSliderTheme alloc] init];
	switch (enumerator) {
		case kCSThemeNone:
			// we don't do anything
			break;
		case kCSThemeBlack:
			// black theme...
			break;
		case kCSThemeWhite:
			// white theme...
			break;
		default:
			break;
	}
	
	return theme;
}

@end

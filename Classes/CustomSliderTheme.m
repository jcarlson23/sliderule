//
//  CustomSliderTheme.m
//  UIWork
//
//  Created by Jared Carlson on 11/10/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import "CustomSliderTheme.h"


@implementation CustomSliderTheme

@synthesize lineColor, textColor, borderColor, gradientColors, indicatorColor, backgroundColor;

+ (CustomSliderTheme*) buildTheme:(CustomSliderEnumerator)enumerator
{
	CustomSliderTheme * theme = [[CustomSliderTheme alloc] init];
	switch (enumerator) {
		case kCSThemeNone:
			// we don't do anything
			break;
			
			// ------------------ black theme -----------------------
		case kCSThemeBlack:
			theme.indicatorColor  = [UIColor blackColor];
			UIColor * lighterGray = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.9];
			UIColor * darkerGray  = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
			theme.gradientColors  = [[NSArray alloc] initWithObjects:lighterGray,darkerGray,nil];
			theme.lineColor       = [UIColor lightGrayColor];
			theme.textColor       = [UIColor whiteColor];
			theme.backgroundColor = [UIColor lightGrayColor];
			break;
			
			// ------------------- white theme --------------------------
		case kCSThemeWhite:
			theme.indicatorColor  = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
			UIColor * topColor    = [UIColor whiteColor];
			UIColor * botColor    = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.9];
			theme.gradientColors  = [[NSArray alloc] initWithObjects:topColor,botColor,nil];
			theme.lineColor       = [UIColor lightGrayColor];
			theme.textColor	      = [UIColor blackColor];
			theme.backgroundColor = [UIColor whiteColor];
			break;
			
		default:
			break;
	}
	
	return theme;
}

- (void) dealloc
{
	[gradientColors release];
	[super dealloc];
}

@end

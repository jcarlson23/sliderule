/*
 *  SlideRuleParams.h
 *  UIWork
 *
 *  Created by Jared Carlson on 11/18/10.
 *  Copyright 2010 GoToTheBoard.com. All rights reserved.
 *
 */
#ifndef _SLIDERULEPARAMS_H
#define _SLIDERULEPARAMS_H

#include <stdio.h>

// struct for holding parameters for the slideRuler
typedef struct SliderParam {
	float minValue;
	float maxValue;
	float scale;
	unsigned int numberMinorTicks;
	unsigned int numberIntervals;
	unsigned int s;
} SliderParam;

#endif

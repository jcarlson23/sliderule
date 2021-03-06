//
//  AnnotationView.m
//  UIWork
//
//  Created by Jared Carlson on 11/9/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import "AnnotationView.h"


@implementation AnnotationView

@synthesize numberOfMajorTicks, textColor;

- (id)initWithFrame:(CGRect)frame params:(SliderParam*)parms
{
	if ( (self = [super initWithFrame:frame]) )
	{
		[self setBackgroundColor:[UIColor clearColor]];
		numberOfMajorTicks = parms->numberIntervals;
		minValue = parms->minValue;
		maxValue = parms->maxValue;
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		[self setBackgroundColor:[UIColor clearColor]];
		
		numberOfMajorTicks = 10;
		minValue = 0.0;
		maxValue = 20.0f;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	
	if ( textColor == nil ) {
		self.textColor = [UIColor whiteColor];
	}
	
	CGRect superFrame = [[self superview] frame];
	CGFloat frameWidth = superFrame.size.width;
	
	/* Now add the annotations */
	int i=0, len; 
	CGFloat x;
	CGContextRef context = UIGraphicsGetCurrentContext();
	char buffer[20];
	CGFloat width = self.frame.size.width;
	CGFloat height = self.frame.size.height;
	// float diff = ( maxValue - minValue ) / numberOfMajorTicks;
	float marker = minValue;
	
	
	float * components;
	components = CGColorGetComponents(textColor.CGColor);
	
	CGContextSetStrokeColorWithColor(context, textColor.CGColor);
	CGContextSetFillColorWithColor(context, textColor.CGColor);
    
	CGContextSelectFont(context,"Helvetica-Bold",10,kCGEncodingMacRoman);
	CGContextTranslateCTM(context, 0, height);
	CGContextScaleCTM(context, 1.0, -1.0);
	// CGFloat dx    = (width - frameWidth)/2/numberOfMajorTicks;
	CGFloat windowWidth = (width - frameWidth)/1;
	CGFloat dw    = ((windowWidth / numberOfMajorTicks)) / ((maxValue - minValue) / numberOfMajorTicks);
	CGFloat diff  = (maxValue - minValue)/numberOfMajorTicks;
	CGFloat dx    = dw;// * (width - frameWidth)/2/(_ticksPerMajorInterval);
	
	for (i=0; i<=numberOfMajorTicks; i++)
	{
		sprintf(buffer,"%d",(int)marker);
		NSString * temp = [NSString stringWithFormat:@"%s",buffer];
		CGSize sizeOfString = [temp sizeWithFont:[UIFont fontWithName:@"Helvetica" size:10] constrainedToSize:CGSizeMake(100, 100)];
		len = strlen(buffer);
		CGFloat offset = sizeOfString.width/2;
		x = i*diff*dx+frameWidth/2;
#define OFFSET 15.0f
		CGContextShowTextAtPoint(context, x-offset, height/2 - OFFSET, buffer, strlen(buffer));
		marker += diff;
	}
	 
	
	// NSString * testing = @"Test works!";
	// [testing drawAtPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) withFont:[UIFont systemFontOfSize:10]];

	[super drawRect:rect];
}


- (void)dealloc {
    [super dealloc];
}


@end

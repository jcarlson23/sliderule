//
//  UIHorizontalControl.m
//  UIWork
//
//  Created by Jared Carlson on 11/6/10.
//  Copyright 2010 GoToTheBoard. All rights reserved.
//

#import "UIHorizontalControl.h"


@implementation UIHorizontalControl


/* properties */
@synthesize minValue;
@synthesize maxValue;
@synthesize currentValue;
@synthesize tickRange;
@synthesize ticksPerRange;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		gradientLayer = [[CAGradientLayer alloc] init];
		[gradientLayer setBounds:[self bounds]];
		[gradientLayer setPosition:CGPointMake([self bounds].size.width/2, [self bounds].size.height/2)];
		
		[[self layer] insertSublayer:gradientLayer atIndex:0];
		[[self layer] setMasksToBounds:YES];
		
		_colors = nil;
		
		[self setBackgroundColor:[UIColor whiteColor]];
		
		[self setContentSize:CGSizeMake(2*self.frame.size.width, self.frame.size.height)];
		
		[self createScrollingImage];
		
		[self setDelegate:self];
		
    }   
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
	if ( _colors )
	{
		[gradientLayer setColors:_colors];
	}
	[super drawRect:rect];
}


- (void)dealloc {
	
	[gradientLayer release];
	[_colors release];
	
    [super dealloc];
}

/* styles */
- (void) setColors:(NSArray*)colors
{
	_colors = [colors retain];
}

- (void) setTextFont:(UIFont*)font
{
}

- (void) setTextColor:(UIColor*)color
{
}

- (void) setLineColor:(UIColor*)color
{
}


@end

@implementation UIHorizontalControl(Hidden)

- (void) createScrollingImage
{
	UIImageView * scrollingImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentSize.width, self.contentSize.height)];
	
	
	float x, dtick = ( tickRange / (float) ticksPerRange );
	int i=0;
	
	CGContextRef background = UIGraphicsGetCurrentContext();
	CGContextAddRect(background, CGRectMake(0, 0, self.contentSize.width, self.contentSize.height));
	CGContextSetFillColorWithColor(background, [UIColor whiteColor].CGColor);
	CGContextFillPath(background);
	
	for (x = (minValue-tickRange); x <= (maxValue+tickRange); x+= dtick)
	{
		// test to see whether we draw a small line 
		// or 
		// a larger line
		if ( ++i == ticksPerRange )
		{
			
			[self drawLargeLine];
			[self drawText:[NSString stringWithFormat:@"%d",(int)x]];
			
		} else {
			
			[self drawSmallLine:x];
		}
		
		// ensure wrap condition...
		i == i % ticksPerRange;
		
	}
	
	CGContextRef reference = UIGraphicsGetCurrentContext();
	UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
	[scrollingImage setImage:image];
	
	[self addSubview:scrollingImage];
	[scrollingImage release];
	
}

- (void) drawSmallLine:(float)xpos
{
	// just create a small rectangle...
	CGRect smallRect = CGRectMake(0, 0, 3, 10);
	CGContextRef rectRef = UIGraphicsGetCurrentContext();
	CGContextMoveToPoint(rectRef, xpos, 0.0);
	CGContextAddRect(rectRef, smallRect);
	CGContextSetRGBFillColor(rectRef, 0.7, 0.7, 0.7, 1.0);
	CGContextFillPath(rectRef);
}

- (void) drawLargeLine
{
}

- (void) drawText:(NSString*)nstext
{
	char text[1024];
	sprintf(text,"%d",[nstext intValue]);
	CGContextRef textRef;
	CGContextSetRGBFillColor(textRef, 0, 0, 1, 1);
	CGContextSelectFont(textRef, "Helvetica", 6, kCGEncodingMacRoman);
	CGContextShowTextAtPoint(textRef, 0, 0, text, strlen(text)-1);
	
}


@end

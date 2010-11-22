//
//  UIWorkViewController.m
//  UIWork
//
//  Created by Jared Carlson on 11/6/10.
//  Copyright GoToTheBoard 2010. All rights reserved.
//

#import "UIWorkViewController.h"
#import "SlideRuleControlView.h"
#import "CoverFlowQuestionView.h"
#import "CustomSliderTheme.h"
#import "SlideRuleParams.h"
#import "SlideLabel.h"

@implementation UIWorkViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	UIView * view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[view setBackgroundColor:[UIColor whiteColor]];
	
	// create parameters for the sliders...
	SliderParam * parms = [SlideRuleControlView createParametersMin:0.0f max:10.0f scale:1.0f
												   numberMajorTicks:10
												   numberMinorTicks:10
															 factor:3];
	
	
	SlideRuleControlView * slideRuler = [[SlideRuleControlView alloc] initWithFrame:CGRectMake(10, 150, 300, 50)];
	CustomSliderTheme * theme = [CustomSliderTheme buildTheme:kCSThemeWhite];
	[view addSubview:slideRuler];
	[slideRuler applyTheme:theme];
	[slideRuler release];	

	UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, 30)];
	[view addSubview:label];
	[label release];
	
	SlideRuleControlView * secondSlider = [[SlideRuleControlView alloc] initWithFrame:CGRectMake(10, 300, 300, 50)];
	[view addSubview:secondSlider];
	[secondSlider release];
	
	UILabel * secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 300, 30)];
	[view addSubview:secondLabel];
	[secondLabel release];
	
	// C -style memeory clean up of the parameters
	free( parms );
	
	self.view = view;
	[view release];
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end

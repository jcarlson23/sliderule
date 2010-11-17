//
//  SurveryQuestionViewController.m
//  UIWork
//
//  Created by Jared Carlson on 11/15/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import "SurveryQuestionViewController.h"


@implementation SurveryQuestionViewController

@synthesize label, tableview;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	_items = [[NSArray alloc] initWithObjects:@"Rarely",@"Not Often",@"Sometimes",@"Often",@"All the Time",nil];
}


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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[_items release];
    [super dealloc];
}


#pragma mark -
#pragma mark TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString * identifier = [NSString stringWithFormat:@"cell-%d",[indexPath row]];
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	
	if ( cell == nil )
	{
		
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identifier] autorelease];
		cell.textLabel.text = [_items objectAtIndex:[indexPath row]];
	}
	
	return cell;
}

@end

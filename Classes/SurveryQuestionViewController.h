//
//  SurveryQuestionViewController.h
//  UIWork
//
//  Created by Jared Carlson on 11/15/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SurveryQuestionViewController : UIViewController {
	IBOutlet UILabel * label;
	IBOutlet UITableView * tableview;
	NSArray * _items;
}

@property(nonatomic,retain) UILabel * label;
@property(nonatomic,retain) UITableView * tableview;

@end

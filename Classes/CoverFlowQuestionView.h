//
//  CoverFlowQuestionView.h
//  UIWork
//
//  Created by Jared Carlson on 11/14/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CoverFlowQuestionView : UIView 
<UIScrollViewDelegate>
{
	NSArray * _layers;
	NSArray * _questions;
	UIColor * _borderColor;
	UIColor * _backgroundColor;
	UIColor * _textColor;
	UIScrollView * _scrollView;
}

@property(nonatomic,retain) NSArray * questions;
@property(nonatomic,retain) UIColor * borderColor;
@property(nonatomic,retain) UIColor * backgroundColor;
@property(nonatomic,retain) UIColor * textColor;

- (void) layoutQuestions:(NSArray*)items;

@end


@interface CoverFlowQuestionView(Hidden)
- (void) addQuestions;
@end
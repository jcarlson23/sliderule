//
//  SlideLabel.h
//  UIWork
//
//  Created by Jared Carlson on 11/21/10.
//  Copyright 2010 GoToTheBoard.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideRuleControlView.h"

@interface SlideLabel : UILabel	
<SlideRuleDelegate>
{

}

- (void) slideValueChanged:(id)sender;

@end

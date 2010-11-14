//
//  UIWorkAppDelegate.h
//  UIWork
//
//  Created by Jared Carlson on 11/6/10.
//  Copyright GoToTheBoard 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIWorkViewController;

@interface UIWorkAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIWorkViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIWorkViewController *viewController;

@end


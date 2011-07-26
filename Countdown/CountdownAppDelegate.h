//
//  CountdownAppDelegate.h
//  Countdown
//
//  Created by Alex Coplan on 26/07/2011 - Questions, or bugs? - Email: lexy0202@gmail.com.
//  Copyright 2011 Illogical Development. All rights reserved.
//
//  This sample code was created in response to a question on Stack Overflow. See the original question here: http://stackoverflow.com/q/6828807/840973

#import <UIKit/UIKit.h>

@class CountdownViewController;

@interface CountdownAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CountdownViewController *viewController;

@end

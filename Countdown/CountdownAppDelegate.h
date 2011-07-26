//
//  CountdownAppDelegate.h
//  Countdown
//
//  Created by Alex Coplan on 26/07/2011.
//  Copyright 2011 Illogical Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountdownViewController;

@interface CountdownAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CountdownViewController *viewController;

@end

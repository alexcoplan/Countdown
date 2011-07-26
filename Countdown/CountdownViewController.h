//
//  CountdownViewController.h
//  Countdown
//
//  Created by Alex Coplan on 26/07/2011 - Questions, or bugs? - Email: lexy0202@gmail.com.
//  Copyright 2011 Illogical Development. All rights reserved.
//
// This sample code was created in response to a question on Stack Overflow. See the original question here: http://stackoverflow.com/q/6828807/840973

#import <UIKit/UIKit.h>

@interface CountdownViewController : UIViewController {
    UILabel *countdownLabel;
    UITextField *textField;
    
    NSTimer *theTimer;
    NSDate *targetDate;
    NSCalendar *cal;
    NSDateComponents *components;
}

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UILabel *countdownLabel;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;
- (IBAction)oqButtonPressed:(id)sender;
- (void)hideKeyboard;
- (void)tick;
- (void)reset;

@end

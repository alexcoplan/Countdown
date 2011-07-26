//
//  CountdownViewController.h
//  Countdown
//
//  Created by Alex Coplan on 26/07/2011.
//  Copyright 2011 Illogical Development. All rights reserved.
//

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
- (void)hideKeyboard;
- (void)tick;
- (void)reset;

@end

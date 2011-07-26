//
//  CountdownViewController.m
//  Countdown
//
//  Created by Alex Coplan on 26/07/2011 - Questions, or bugs? - Email: lexy0202@gmail.com.
//  Copyright 2011 Illogical Development. All rights reserved.
//
//  This sample code was created in response to a question on Stack Overflow. See the original question here: http://stackoverflow.com/q/6828807/840973

#import "CountdownViewController.h"

@implementation CountdownViewController
@synthesize textField;
@synthesize countdownLabel;

- (void)dealloc
{
    [cal release];
    [components release];
    [countdownLabel release];
    [textField release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    cal = [[NSCalendar currentCalendar] retain];
    components = [[NSDateComponents alloc] init];
}

- (void)viewDidUnload
{
    [self setCountdownLabel:nil];
    [self setTextField:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonPressed:(id)sender {
    //Check if we're already running
    if (theTimer != nil) {
        return;
    }
    
    NSString *input = textField.text;
    NSArray *timeSplit = [input componentsSeparatedByString:@":"];
    NSUInteger hours =  [[timeSplit objectAtIndex:0] intValue];
    NSUInteger minutes =  [[timeSplit objectAtIndex:1] intValue];
    NSDate *now = [NSDate date];
    NSDateComponents *dateComponents = [cal components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:now];
        [dateComponents setHour:hours];
    [dateComponents setMinute:minutes];
    
    if (!targetDate) {
        targetDate = [[cal dateFromComponents:dateComponents] retain];
    }
    else {
        targetDate = nil;
        targetDate = [[cal dateFromComponents:dateComponents] retain];
    }
    
    if ([targetDate timeIntervalSinceNow] > 0) {
        theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
        [self hideKeyboard];
    }
    else {
        targetDate = nil;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Cannot countdown because time is before now" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (IBAction)resetButtonPressed:(id)sender {
    [self reset];
}

- (IBAction)oqButtonPressed:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://stackoverflow.com/q/6828807/840973"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)reset {
    [theTimer invalidate];
    theTimer = nil;
    targetDate = nil;
    countdownLabel.text = @"";
    textField.text = @"";
}

- (void)tick {
    if ([targetDate timeIntervalSinceNow] <= 0) {
        //Checks if the countdown completed
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Countdown Completed" message:@"YAY! The countdown has complete" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        [self reset];
        return;
    }
    components = [cal components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:[NSDate date] toDate:targetDate options:0];
    
    NSInteger hours = [components hour];
    NSInteger minutes = [components minute];
    NSInteger seconds = [components second];
    
    NSString *output = [NSString stringWithFormat:@"%i Hours\n%i Minutes\n%i Seconds\n", hours, minutes, seconds];
    countdownLabel.text = output;
}

- (void)hideKeyboard {
    if ([textField isFirstResponder]) [textField resignFirstResponder];
}

@end

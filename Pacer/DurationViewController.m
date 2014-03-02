//
//  DurationViewController.m
//  Pacer
//
//  Created by Alex Robinson on 2/2/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "DurationViewController.h"
#import "ViewController.h"
#import "PaceValues.h"

@interface DurationViewController ()

@end

@implementation DurationViewController
@synthesize delegate, durationSeconds;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    _containerView.layer.cornerRadius = 10.0f;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender
{
    // Verify text fields
    NSNumber *hourTemp, *minTemp, *secTemp;
    if ([self verifyValidNumberFormat:_hoursTextField.text insertInto:&hourTemp] &&
        [self verifyValidNumberFormat:_minutesTextField.text insertInto:&minTemp] &&
        [self verifyValidNumberFormat:_secondsTextField.text insertInto:&secTemp])
    {
//        _hours = hourTemp;
//        _minutes = minTemp;
//        _seconds = secTemp;
        [[self delegate] setDurationValuesHour:hourTemp minutes:minTemp seconds:secTemp];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(BOOL)verifyValidNumberFormat:(NSString *)numberString insertInto:(NSNumber **)aNumber;
{
    // If its just an empty string, skip verification
    if ([numberString isEqualToString:@""]) {
        *aNumber = [NSNumber numberWithDouble:0.0];
        return YES;
    }
    else
    {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        *aNumber = [f numberFromString:numberString];
        
        if (!aNumber) {
            NSLog(@"Not a number");
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Invalid Number"
                                  message:@"Please enter a valid number"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            *aNumber = [NSNumber numberWithDouble:0.0];
            return NO;
        }
        else
        {
            return YES;
        }
    }
}
@end

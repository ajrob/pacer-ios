//
//  DurationViewController.m
//  Pacer
//
//  Created by Alex Robinson on 2/2/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "DurationViewController.h"
#import "ViewController.h"

@interface DurationViewController ()

@end

@implementation DurationViewController
@synthesize delegate, durationSecondsDouble;

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
    // Store the value into the delegate variables
    
    durationSecondsDouble = [self calculateTotalDurationInSeconds];
    
    
//    unitOfLengthString = [_segmentedUnitOfLength titleForSegmentAtIndex:[_segmentedUnitOfLength selectedSegmentIndex]];
//    
//    if (![self verifyValidNumberFormat:_distanceTextField.text]) {
//        _distanceTextField.text = @"";
//        return;
//    }
//    [[self delegate] setDistanceValue:distanceDouble];
//    [[self delegate] setUnitOfLength:unitOfLengthString];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (double)calculateTotalDurationInSeconds
{
    
    return 0.0;
}

-(BOOL)verifyValidNumberFormat:(NSString *)numberString insertInto:(double)aDoubleNumber;
{
    // If its just an empty string, skip verification
    if ([numberString isEqualToString:@""]) {
        aDoubleNumber = 0;
        return YES;
    }
    else
    {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        aDoubleNumber = [[f numberFromString:numberString] doubleValue];
        
        if (!aDoubleNumber) {
            NSLog(@"Not a number");
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Invalid Number"
                                  message:@"Please enter a valid number"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            aDoubleNumber = 0;
            return NO;
        }
        else
        {
            return YES;
        }
    }
}
@end

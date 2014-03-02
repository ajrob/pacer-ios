//
//  RateViewController.m
//  Pacer
//
//  Created by Alex Robinson on 2/2/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "RateViewController.h"
#import "ViewController.h"

@interface RateViewController ()

@end

@implementation RateViewController
@synthesize delegate, rate;

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
    NSNumber *minuteTemp, *secondTemp, *speedTemp;
    switch (_rateSegmented.selectedSegmentIndex) {
        case 0:
            // Pace View
            if ([self verifyValidNumberFormat:_paceMinuteTextField.text insertInto:&minuteTemp] &&
                [self verifyValidNumberFormat:_paceSecondTextField.text insertInto:&secondTemp])
            {
                [[self delegate] setPaceValuesMinutes:minuteTemp seconds:secondTemp];
                
            }
            break;
        case 1:
            //Speed View
            if ([self verifyValidNumberFormat:_speedTextField.text insertInto:&speedTemp])
            {
                [[self delegate] setSpeedValue:speedTemp];
                
            }
            break;
            
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)verifyValidNumberFormat:(NSString *)numberString insertInto:(NSNumber **)aNumber;
{
    // If its just an empty string, skip verification
    if ([numberString isEqualToString:@""]) {
        *aNumber = [NSNumber numberWithDouble:0.0];
        return YES;
    }
    // Else there's something in the text field, check it...
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


- (IBAction)rateSegmentChanged:(id)sender
{
    switch (_rateSegmented.selectedSegmentIndex) {
        case 0:
            _paceView.hidden = NO;
            _speedView.hidden = YES;
            break;
        case 1:
            _paceView.hidden = YES;
            _speedView.hidden = NO;
            break;
        default:
            break;
    }
}

@end

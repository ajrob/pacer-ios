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
@synthesize delegate, rateDouble;

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
    // If there's something in the text field, check it...
    if (![_speedTextField.text isEqualToString:@""]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterNoStyle];
        
        // If the text field value isn't a number, show an alert...
        if ([f numberFromString:_speedTextField.text] == nil) {
            NSLog(@"Not a number");
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Invalid Number"
                                  message:@"Please enter a valid number"
                                  delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil, nil];
            [alert show];
            return; //...and jump out of method
        }
        else
        {
            // ...otherwise it's valid, assign it
            [[self delegate] setRateValue:rateDouble];
        }
    }
    // ...resign view and return
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

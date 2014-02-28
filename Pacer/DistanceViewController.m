//
//  DistanceViewController.m
//  Pacer
//
//  Created by Alex Robinson on 2/1/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "DistanceViewController.h"
#import "ViewController.h"

@interface DistanceViewController ()

@end

@implementation DistanceViewController
@synthesize delegate, distanceDouble, unitOfLengthString;

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
    _theView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    [_distanceTextField setDelegate:self];  // Set the textfield as the delegate so that
                                            // it will respond to events since its in a subview
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
    if (![_distanceTextField.text isEqualToString:@""]) {
//        distanceDouble =
    }
    unitOfLengthString = [_segmentedUnitOfLength titleForSegmentAtIndex:[_segmentedUnitOfLength selectedSegmentIndex]];
    
    if (![self verifyValidNumberFormat:_distanceTextField.text]) {
        _distanceTextField.text = @"";
        return;
    }
    [[self delegate] setDistanceValue:distanceDouble];
    [[self delegate] setUnitOfLength:unitOfLengthString];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

-(BOOL)verifyValidNumberFormat:(NSString *)numberString
{
    // If its just an empty string, skip verification
    if ([numberString isEqualToString:@""]) {
        return YES;
    }
    else
    {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        distanceDouble = [[f numberFromString:numberString] doubleValue];
        
        if (!distanceDouble) {
            NSLog(@"Not a number");
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Invalid Number"
                                  message:@"Please enter a valid number"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil, nil];
            [alert show];
            return NO;
        }
        else
        {
            return YES;
        }
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //Verify valid number format
    //If its an empty textfield, just go back
    if ([textField.text isEqualToString:@""])
    {
        return;
    }
    //Otherwise, check to see if its a valid number
    else if (![self verifyValidNumberFormat:textField.text]) {
        textField.text = @"";
        return;
    }
}

@end

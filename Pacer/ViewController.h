//
//  ViewController.h
//  Pacer
//
//  Created by Alex Robinson on 1/17/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DistanceViewController.h"
#import "DurationViewController.h"
#import "RateViewController.h"
#import "PaceValues.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIViewControllerTransitioningDelegate, passDistanceData, passDurationData, passRateData>
{
    double distance;
    double duration;
    double rate;
}
@property (strong, nonatomic) NSNumber *rate, *duration, *distance;

@property (strong, nonatomic) NSString *unitOfLengthString;

@property (strong, nonatomic) PaceValues *paceValues;

@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *durationTextField;
@property (weak, nonatomic) IBOutlet UITextField *rateTextField;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UILabel *coordinates;
@property (weak, nonatomic) IBOutlet UIButton *raceButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *paceSpeed;
@property (strong, nonatomic) IBOutlet UIView *paceView;
@property (strong, nonatomic) IBOutlet UIView *speedView;

@property (weak, nonatomic) IBOutlet UIButton *distanceButton;
@property (weak, nonatomic) IBOutlet UIButton *durationButton;
@property (weak, nonatomic) IBOutlet UIButton *rateButton;


- (IBAction)gotoDistanceView:(id)sender;
- (IBAction)gotoDurationView:(id)sender;
- (IBAction)gotoRateView:(id)sender;
- (IBAction)rateSegmentChanged:(UISegmentedControl *)sender;
@end

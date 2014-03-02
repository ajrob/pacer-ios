//
//  RateViewController.h
//  Pacer
//
//  Created by Alex Robinson on 2/2/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passRateData <NSObject>

-(void) setPaceValuesMinutes:(NSNumber *)minuteData seconds:(NSNumber *)secondData;
-(void) setSpeedValue:(NSNumber *)speedData;

@end

@interface RateViewController : UIViewController

@property (retain) id<passRateData> delegate;
@property (weak, nonatomic) NSNumber *rate;


@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *speedView;
@property (weak, nonatomic) IBOutlet UIView *paceView;
@property (weak, nonatomic) IBOutlet UITextField *speedTextField;
@property (weak, nonatomic) IBOutlet UITextField *paceMinuteTextField;
@property (weak, nonatomic) IBOutlet UITextField *paceSecondTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rateSegmented;

- (IBAction)goBack:(id)sender;
- (IBAction)rateSegmentChanged:(id)sender;
@end

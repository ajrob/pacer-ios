//
//  DurationViewController.h
//  Pacer
//
//  Created by Alex Robinson on 2/2/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passDurationData <NSObject>

-(void) setDurationValuesHour:(NSNumber *)durationHour minutes:(NSNumber *)durationMinutes seconds:(NSNumber *)durationSeconds;

@end

@interface DurationViewController : UIViewController

@property (retain) id<passDurationData> delegate;
@property (weak, nonatomic) NSNumber *durationSeconds;

@property (weak, nonatomic) NSNumber *hours, *minutes, *seconds;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *hoursTextField;
@property (weak, nonatomic) IBOutlet UITextField *minutesTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondsTextField;

- (IBAction)goBack:(id)sender;
@end

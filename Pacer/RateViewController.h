//
//  RateViewController.h
//  Pacer
//
//  Created by Alex Robinson on 2/2/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passRateData <NSObject>

-(void) setRateValue:(double)rateData;

@end

@interface RateViewController : UIViewController

@property (retain) id<passRateData> delegate;
@property double rateDouble;


@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *speedTextField;

- (IBAction)goBack:(id)sender;
@end

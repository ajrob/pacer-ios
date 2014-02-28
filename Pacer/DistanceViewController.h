//
//  DistanceViewController.h
//  Pacer
//
//  Created by Alex Robinson on 2/1/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passDistanceData <NSObject>

-(void)setDistanceValue:(double)distanceValue;
-(void)setUnitOfLength:(NSString *)unitOfLength;

@end

@interface DistanceViewController : UIViewController <UITextFieldDelegate>

@property (retain) id<passDistanceData> delegate;
//@property (strong, nonatomic) NSNumber *distanceDouble;
@property double distanceDouble;
@property (strong, nonatomic) NSString *unitOfLengthString;

@property (strong, nonatomic) IBOutlet UIView *theView;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedUnitOfLength;

- (IBAction)goBack:(id)sender;

@end

//
//  PaceValues.h
//  Pacer
//
//  Created by Alex Robinson on 2/26/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaceValues : NSObject

// Input values from the views
@property (weak, nonatomic) NSNumber *distance;
@property (weak, nonatomic) NSNumber *durationHour;
@property (weak, nonatomic) NSNumber *durationMin;
@property (weak, nonatomic) NSNumber *durationSec;
@property (weak, nonatomic) NSNumber *rateMin;
@property (weak, nonatomic) NSNumber *rateSec;

// Public methods

@end

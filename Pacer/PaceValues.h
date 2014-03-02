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
@property (strong, nonatomic) NSNumber *distance;
@property (strong, nonatomic) NSNumber *durationHour, *durationMin, *durationSec, *durationTotalSeconds;
@property (strong, nonatomic) NSNumber *rateMin, *rateSec, *speed, *distanceUnitPerSecond, *secondsPerDistanceUnit;

// Public methods
-(NSNumber *)convertToSecondsUsingHours:(NSNumber *)hours minutes:(NSNumber *)minutes seconds:(NSNumber *)seconds;
-(NSNumber *)convertDistancePerHourIntoPerSecond:(NSNumber *)speed;
//-(NSNumber *)convertSecondsPerDistanceUnitUsingMinutes:(NSNumber *)minutes andSeconds:(NSNumber *)seconds;
@end

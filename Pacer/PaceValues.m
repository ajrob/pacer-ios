//
//  PaceValues.m
//  Pacer
//
//  Created by Alex Robinson on 2/26/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "PaceValues.h"

@implementation PaceValues
{
    NSUInteger variableCount;
    BOOL isDistanceKnown, isDurationKnown, isDistanceUnitPerSecondKnown, isSecondsPerDistanceUnitKnown;
}

-(id)init
{
    self = [super init];
    if (self) {
        // Initialize self.
        self->variableCount = 0;
        self->isDistanceKnown = NO;
        self->isDurationKnown = NO;
        self->isDistanceUnitPerSecondKnown = NO;
        self->isSecondsPerDistanceUnitKnown = NO;
    }
    return self;
}

#pragma mark -
#pragma mark Private Methods

-(void)watchForTwoKnowns
{
    if (variableCount == 2) {
        NSLog(@"Time to calculate!");
        [self calculateUnknown];
        
        // Reset variable counter
        variableCount = 0;
        
        // Decide whether to retain or clear the variable values
//        [self clearValues];
//        [self retainValues];
    }
    if (isDistanceKnown && isDurationKnown) {
        // Calculate mile/km per second
        _distanceUnitPerSecond = @([_distance doubleValue] / [_durationTotalSeconds doubleValue]);

        // Calculate minutes per mile/km
        _secondsPerDistanceUnit = @(1 / ([_distanceUnitPerSecond doubleValue] * 60));
        NSLog(@"The rate in %@ per second is %@", _unitOfLength, _distanceUnitPerSecond);
        NSLog(@"The rate in minutes per %@ is %@", _unitOfLength, _secondsPerDistanceUnit);
        [self resetVariableWatchers];
    }
}

-(void)calculateUnknown
{
    NSLog(@"Unknown is now calculated!");
    
}

-(void)clearValues
{
    
}

-(void)retainValues
{
    
}

-(void)resetVariableWatchers
{
    self->isDistanceKnown = NO;
    self->isDurationKnown = NO;
    self->isDistanceUnitPerSecondKnown = NO;
    self->isSecondsPerDistanceUnitKnown = NO;
}

#pragma mark -
#pragma mark Setters

-(void)setDistance:(NSNumber *)distance
{
    _distance = distance;
    isDistanceKnown = YES;
    variableCount += 1;
    [self watchForTwoKnowns];
    NSLog(@"Distance has changed");
}

-(void)setDurationTotalSeconds:(NSNumber *)durationTotalSeconds
{
    _durationTotalSeconds = durationTotalSeconds;
    isDurationKnown = YES;
    variableCount += 1;
    [self watchForTwoKnowns];
    NSLog(@"Duration in total seconds has been calculated");
}

-(void)setDistanceUnitPerSecond:(NSNumber *)distanceUnitPerSecond
{
    _distanceUnitPerSecond = distanceUnitPerSecond;
    variableCount += 1;
    [self watchForTwoKnowns];
    NSLog(@"Distance units per second have been calculated");
}

-(void)setSecondsPerDistanceUnit:(NSNumber *)secondsPerDistanceUnit
{
    _secondsPerDistanceUnit = secondsPerDistanceUnit;
    variableCount += 1;
    [self watchForTwoKnowns];
    NSLog(@"Seconds per distance unit have been calculated");
}


#pragma mark -
#pragma mark Utility Methods

-(NSNumber *)convertToSecondsUsingHours:(NSNumber *)hours minutes:(NSNumber *)minutes seconds:(NSNumber *)seconds
{
    // Any character, numberic, or boolean value prefixed with '@' will evaluate to a pointer to an NSNumber object using the appropriate initializer.
    // For example:
    //     NSNumber *theLetterZ = @'z' ---> evaluates to [NSNumber numberWithChar:'z']
    //     NSNumber *piDouble = @3.142 ---> evaluates to [NSNumber numberWithDouble:3.14]
    return @(([hours intValue] * 3600) + ([minutes intValue] * 60) + [seconds intValue]);
}

-(void)convertToHoursMinutesSeconds:(NSNumber *)seconds
{
    
}

-(NSNumber *)convertDistancePerHourIntoPerSecond:(NSNumber *)speed
{
    return @([speed doubleValue] / 3600);
}

//-(NSNumber *)convertSecondsPerDistanceUnitUsingMinutes:(NSNumber *)minutes andSeconds:(NSNumber *)seconds
//{
//    return @(([minutes intValue] * 60) + [seconds intValue]);
//}

#pragma mark -
#pragma mark Protocols
#pragma mark passDurationData Protocol Methods
-(void)setDurationValuesHour:(NSNumber *)durationHour minutes:(NSNumber *)durationMinutes seconds:(NSNumber *)durationSeconds
{
    _durationHour = durationHour;
    _durationMin = durationMinutes;
    _durationSec = durationSeconds;
    _durationTotalSeconds = [self convertToSecondsUsingHours:_durationHour
                                                                       minutes:_durationMin
                                                                       seconds:_durationSec];
}

#pragma mark passRateData Protocol Methods

#pragma mark passDistanceValues Protocol Methods
-(void)setUnitOfLength:(NSString *)unitOfLength
{
    _unitOfLength = unitOfLength;
    NSLog(@"%@", _unitOfLength);
    
}

-(void)setDistanceValue:(NSNumber *)distanceValue
{
//    if (willResetVariables) {
//        [self resetPacerVariables];
//    }
//    _paceValues.distance = distanceValue;
//    //    _distance = _paceValues.distance;
//    _variableCounter += 1;
//    if ([self canDoCalculationWith:[NSNumber numberWithInteger:_variableCounter]]) {
//        [self calculateFormula];
//    }
//    NSLog(@"%@", _distance);
}


@end

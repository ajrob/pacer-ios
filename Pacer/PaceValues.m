//
//  PaceValues.m
//  Pacer
//
//  Created by Alex Robinson on 2/26/14.
//  Copyright (c) 2014 Alex Robinson. All rights reserved.
//

#import "PaceValues.h"

@implementation PaceValues

#pragma mark -
#pragma mark Private Methods

-(void)watchForTwoKnowns
{
    
}

-(void)calculateUnknown
{
    
}

-(void)clearValues
{
    
}

-(void)retainValues
{
    
}

#pragma mark -
#pragma mark Utility Methods

-(NSNumber *)convertToSecondsUsing:(NSNumber *)hours using:(NSNumber *)minutes using:(NSNumber *)seconds
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

@end

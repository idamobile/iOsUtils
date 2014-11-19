//
// Created by Aleksey Kozhevnikov on 23.08.13.
// Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "NSDate+iOSUtils.h"

@implementation NSDate(iOSUtils)

+(instancetype)dateWithUnixMillisecondsTimestamp:(int64_t)timestamp
{
  return [NSDate dateWithTimeIntervalSince1970:timestamp / 1000.];
}


-(int64_t)unixMillisecondsTimestamp
{
  return (int64_t)(self.timeIntervalSince1970 * 1000);
}

-(NSDate*)beginningOfTheDayNumberOfDaysBefore:(NSUInteger)numberOfDaysBefore numberOfMonthsBefore:(NSUInteger)numberOfMonthsBefore
{
  NSCalendar* calendar = [NSCalendar currentCalendar];
  NSDateComponents* selfComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:self];
  NSDate* beginningOfTheDay = [calendar dateFromComponents:selfComponents];

  NSDateComponents* components = [[NSDateComponents alloc] init];
  components.day = -(NSInteger)numberOfDaysBefore;
  components.month = -(NSInteger)numberOfMonthsBefore;

  return [calendar dateByAddingComponents:components toDate:beginningOfTheDay options:0];
}

-(NSDate*)beginningOfTheDay
{
  NSCalendar* calendar = [NSCalendar currentCalendar];
  NSDateComponents* selfComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:self];
  return [calendar dateFromComponents:selfComponents];
}

@end

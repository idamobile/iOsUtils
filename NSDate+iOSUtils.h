//
// Created by Aleksey Kozhevnikov on 23.08.13.
// Copyright (c) 2013 iDa Mobile. All rights reserved.
//


@interface NSDate(iOSUtils)

+(instancetype)dateWithUnixMillisecondsTimestamp:(int64_t)timestamp;


-(int64_t)unixMillisecondsTimestamp;
-(NSDate*)beginningOfTheDayNumberOfDaysBefore:(NSUInteger)numberOfDaysBefore numberOfMonthsBefore:(NSUInteger)numberOfMonthsBefore;

@end
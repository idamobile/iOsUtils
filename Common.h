//
//  Common.h
//  iOSUtils
//
//  Created by Aleksey Kozhevnikov on 18.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#define COMPILE_ASSERT(x) extern int __compile_assert[(x) ? 1 : -1] __unused

// DLog is almost a drop-in replacement for NSLog
// DLog();
// DLog(@"here");
// DLog(@"value: %d", x);
// Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);
#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif

#ifdef DEBUG
#	define DAssert(condition, desc, ...) NSAssert(condition, desc, ##__VA_ARGS__);
#else
#	define DAssert(...)
#endif

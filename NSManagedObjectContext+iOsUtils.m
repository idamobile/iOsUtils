//
//  NSManagedObjectContext+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 24.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "NSManagedObjectContext+iOsUtils.h"

@implementation NSManagedObjectContext(iOsUtils)

-(NSSet*)fetchObjectsForEntityName:(NSString*)newEntityName
                     withPredicate:(id<NSObject>)stringOrPredicate, ...
{
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:newEntityName];
  
  if( stringOrPredicate ) {
    NSPredicate* predicate;
    if( [stringOrPredicate isKindOfClass:[NSString class]] ) {
      va_list variadicArguments;
      va_start( variadicArguments, stringOrPredicate );
      predicate = [NSPredicate predicateWithFormat:(NSString*)stringOrPredicate arguments:variadicArguments];
      va_end( variadicArguments );
    } else {
      NSAssert2( [stringOrPredicate isKindOfClass:[NSPredicate class]],
                @"Second parameter passed to %s is of unexpected class %@",
                sel_getName( _cmd ),
                NSStringFromClass( [stringOrPredicate class] ) );
      predicate = (NSPredicate*)stringOrPredicate;
    }
    [request setPredicate:predicate];
  }
  
  NSError* error = nil;
  NSArray* results = [self executeFetchRequest:request error:&error];
  if( error ) {
    [NSException raise:NSGenericException format:error.description];
  }
  
  return [NSSet setWithArray:results];
}

@end

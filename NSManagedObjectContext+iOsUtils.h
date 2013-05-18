//
//  NSManagedObjectContext+iOsUtils.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 24.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext(iOsUtils)

-(NSSet*)fetchObjectsForEntityName:(NSString*)newEntityName
                     withPredicate:(id<NSObject>)stringOrPredicate, ...;

@end

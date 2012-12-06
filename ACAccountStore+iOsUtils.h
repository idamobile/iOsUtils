//
//  ACAccountStore+iOsUtils.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 30.10.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import <Accounts/Accounts.h>

@interface ACAccountStore(iOsUtils)

+(BOOL)hasFbAccount;

// Only calls completion on iOS < 6.0
+(void)syncFbAccountCompletion:(void (^)())completion;

@end

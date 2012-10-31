//
//  ACAccountStore+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 30.10.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "ACAccountStore+iOsUtils.h"

@implementation ACAccountStore(iOsUtils)

+(void)syncFbAccountCompletion:(void (^)())completion
{
  if( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0") ) {
    ACAccountStore* accountStore = [[ACAccountStore alloc] init];
    ACAccountType* accountTypeFB = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    NSArray* fbAccounts = [accountStore accountsWithAccountType:accountTypeFB];
    if( fbAccounts.count > 0 ) {
      ACAccount* fbAccount = fbAccounts.firstObject;
      [accountStore renewCredentialsForAccount:fbAccount completion:^(ACAccountCredentialRenewResult renewResult, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), completion);
      }];
    }
  } else {
    dispatch_async(dispatch_get_main_queue(), completion);
  }
}

@end

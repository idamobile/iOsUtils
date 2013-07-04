//
//  ACAccountStore+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 30.10.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "ACAccountStore+iOsUtils.h"

@implementation ACAccountStore(iOsUtils)

+(ACAccount*)fbAccount
{
  if( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0") ) {
    ACAccountStore* accountStore = [[ACAccountStore alloc] init];
    ACAccountType* accountTypeFB = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
    NSArray* fbAccounts = [accountStore accountsWithAccountType:accountTypeFB];
    return [fbAccounts lastObject];
  } else {
    return nil;
  }
}

+(BOOL)hasFbAccount
{
  return [self fbAccount] != nil;
}

+(void)syncFbAccountCompletion:(void (^)())completion
{
  ACAccount* fbAccount = [self fbAccount];
  if( fbAccount ) {
    [[[ACAccountStore alloc] init] renewCredentialsForAccount:fbAccount
                                                   completion:^(ACAccountCredentialRenewResult renewResult, NSError *error)
    {
      if( renewResult == ACAccountCredentialRenewResultFailed ) {
        DLog(@"%@", [error description]);
      }
      dispatch_async(dispatch_get_main_queue(), completion);
    }];
  } else {
    completion();
  }
}

@end

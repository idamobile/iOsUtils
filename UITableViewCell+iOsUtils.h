//
//  UITableViewCell+iOsUtils.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 24.12.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#define UITableViewCellDeclareClassSpecificReuseId \
+(NSString*)reuseId;

#define UITableViewCellDefineClassSpecificReuseId \
+(NSString*)reuseId \
{ \
  return NSStringFromClass([self class]); \
} \
\
-(NSString *)reuseIdentifier \
{ \
  return [[self class] reuseId]; \
}

//
//  NSKeyedArchiver+StringifyMacros.h
//  NSArchivingStringifyMacros
//
//  Created by Murray Sagal on 2/15/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <Foundation/Foundation.h>


#define NS_STRINGIFY(x)             @#x

#define encodeBool(BOOL)            [aCoder encodeBool:BOOL forKey:NS_STRINGIFY(BOOL)]
#define encodeDouble(double)        [aCoder encodeDouble:double forKey:NS_STRINGIFY(double)]
#define encodeFloat(float)          [aCoder encodeFloat:float forKey:NS_STRINGIFY(float)]
#define encodeInt(int)              [aCoder encodeInt:int forKey:NS_STRINGIFY(int)]
#define encodeInt32(int32_t)        [aCoder encodeInt32:int32_t forKey:NS_STRINGIFY(int32_t)]
#define encodeInt64(int64_t)        [aCoder encodeInt64:int64_t forKey:NS_STRINGIFY(int64_t)]
#define encodeObject(object)        [aCoder encodeObject:object forKey:NS_STRINGIFY(object)]



@interface NSKeyedArchiver (StringifyMacros)

@end

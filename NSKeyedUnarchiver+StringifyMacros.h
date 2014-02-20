//
//  NSKeyedUnarchiver+StringifyMacros.h
//  NSArchivingStringifyMacros
//
//  Created by Murray Sagal on 2/15/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <Foundation/Foundation.h>


#define NS_STRINGIFY(x)             @#x

#define containsValue(value)        [aDecoder containsValueForKey:NS_STRINGIFY(value)]
#define decodeBool(BOOL)            BOOL = [aDecoder decodeBoolForKey:NS_STRINGIFY(BOOL)]
#define decodeDouble(double)        double = [aDecoder decodeDoubleForKey:NS_STRINGIFY(double)]
#define decodeFloat(float)          float = [aDecoder decodeFloatForKey:NS_STRINGIFY(float)]
#define decodeInt(int)              int = [aDecoder decodeIntForKey:NS_STRINGIFY(int)]
#define decodeInt32(int32_t)        int32_t = [aDecoder decodeInt32ForKey:NS_STRINGIFY(int32_t)]
#define decodeInt64(int64_t)        int64_t = [aDecoder decodeInt64ForKey:NS_STRINGIFY(int64_t)]
#define decodeObject(object)        object = [aDecoder decodeObjectForKey:NS_STRINGIFY(object)]



@interface NSKeyedUnarchiver (StringifyMacros)

@end

//
//  MSStringifyMacros_Archiving.h
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2/20/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <Foundation/Foundation.h>


#define NS_STRINGIFY(x)             @#x

#define encodeBool(BOOL)            [aCoder encodeBool:BOOL forKey:NS_STRINGIFY(BOOL)]
#define decodeBool(BOOL)            BOOL = [aDecoder decodeBoolForKey:NS_STRINGIFY(BOOL)]

#define encodeDouble(double)        [aCoder encodeDouble:double forKey:NS_STRINGIFY(double)]
#define decodeDouble(double)        double = [aDecoder decodeDoubleForKey:NS_STRINGIFY(double)]

#define encodeFloat(float)          [aCoder encodeFloat:float forKey:NS_STRINGIFY(float)]
#define decodeFloat(float)          float = [aDecoder decodeFloatForKey:NS_STRINGIFY(float)]

#define encodeInt(int)              [aCoder encodeInt:int forKey:NS_STRINGIFY(int)]
#define decodeInt(int)              int = [aDecoder decodeIntForKey:NS_STRINGIFY(int)]

#define encodeInt32(int32_t)        [aCoder encodeInt32:int32_t forKey:NS_STRINGIFY(int32_t)]
#define decodeInt32(int32_t)        int32_t = [aDecoder decodeInt32ForKey:NS_STRINGIFY(int32_t)]

#define encodeInt64(int64_t)        [aCoder encodeInt64:int64_t forKey:NS_STRINGIFY(int64_t)]
#define decodeInt64(int64_t)        int64_t = [aDecoder decodeInt64ForKey:NS_STRINGIFY(int64_t)]

#define encodeObject(object)        [aCoder encodeObject:object forKey:NS_STRINGIFY(object)]
#define decodeObject(object)        object = [aDecoder decodeObjectForKey:NS_STRINGIFY(object)]

#define containsValue(value)        [aDecoder containsValueForKey:NS_STRINGIFY(value)]



@interface MSStringifyMacros_Archiving : NSObject

@end

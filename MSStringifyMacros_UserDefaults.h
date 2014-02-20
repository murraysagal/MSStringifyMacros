//
//  MSStringifyMacros_UserDefaults.h
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2/20/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <Foundation/Foundation.h>


#define NS_STRINGIFY(x)                                      @#x
#define SUD                                                 [NSUserDefaults standardUserDefaults]

#define setDefaultForBool(BOOL)                             [SUD setBool:BOOL forKey:NS_STRINGIFY(BOOL)]
#define defaultForBool(BOOL)                                BOOL = [SUD boolForKey:NS_STRINGIFY(BOOL)]

#define setDefaultForDouble(double)                         [SUD setDouble:double forKey:NS_STRINGIFY(double)]
#define defaultForDouble(double)                            double = [SUD doubleForKey:NS_STRINGIFY(double)]

#define setDefaultForFloat(float)                           [SUD setFloat:float forKey:NS_STRINGIFY(float)]
#define defaultForFloat(float)                              float = [SUD floatForKey:NS_STRINGIFY(float)]

#define setDefaultForInteger(integer)                       [SUD setInteger:integer forKey:NS_STRINGIFY(integer)]
#define defaultForInteger(integer)                          integer = [SUD integerForKey:NS_STRINGIFY(integer)]

#define setDefaultForObject(object)                         [SUD setObject:object forKey:NS_STRINGIFY(object)]
#define defaultForObject(object)                            object = [SUD objectForKey:NS_STRINGIFY(object)]
#define removeDefaultForObject(object)                      [SUD removeObjectForKey:NS_STRINGIFY(object)]

#define defaultDoesNotExistForObject(object)                [SUD objectForKey:NS_STRINGIFY(object)] == nil
#define defaultExistsForObject(object)                      [SUD objectForKey:NS_STRINGIFY(object)] != nil

#define defaultForArray(array)                              array = [SUD arrayForKey:NS_STRINGIFY(array)]
#define defaultForMutableArray(mutableArray)                mutableArray = [[SUD arrayForKey:NS_STRINGIFY(mutableArray)] mutableCopy]

#define defaultForData(data)                                data = [SUD dataForKey:NS_STRINGIFY(data)]
#define defaultForMutableData(mutableData)                  mutableData = [[SUD dataForKey:NS_STRINGIFY(mutableData)] mutableCopy]

#define defaultForDictionary(dictionary)                    dictionary = [SUD dictionaryForKey:NS_STRINGIFY(dictionary)]
#define defaultForMutableDictionary(mutableDictionary)      mutableDictionary = [[SUD dictionaryForKey:NS_STRINGIFY(mutableDictionary)] mutableCopy]

#define defaultForString(string)                            string = [SUD stringForKey:NS_STRINGIFY(string)]
#define defaultForMutableString(mutableString)              mutableString = [[SUD stringForKey:NS_STRINGIFY(mutableString)] mutableCopy]

#define defaultForStringArray(stringArray)                  stringArray = [SUD stringArrayForKey:NS_STRINGIFY(stringArray)]
#define defaultForStringArrayMutable(stringArrayMutable)    stringArrayMutable = [[SUD stringArrayForKey:NS_STRINGIFY(stringArrayMutable)] mutableCopy]

#define setDefaultForURL(url)                               [SUD setURL:url forKey:NS_STRINGIFY(url)]
#define defaultForURL(url)                                  url = [SUD URLForKey:NS_STRINGIFY(url)]



@interface MSStringifyMacros_UserDefaults : NSObject

@end

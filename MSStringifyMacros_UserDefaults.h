//
//  MSStringifyMacros_UserDefaults.h
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2/20/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//



#import "MSStringifyMacro.h"

#define SUD                                                 [NSUserDefaults standardUserDefaults]

#define MSSetDefaultForBool(BOOL)                           [SUD setBool:BOOL forKey:MSStringify(BOOL)]
#define MSDefaultForBool(BOOL)                              BOOL = [SUD boolForKey:MSStringify(BOOL)]

#define MSSetDefaultForDouble(double)                       [SUD setDouble:double forKey:MSStringify(double)]
#define MSDefaultForDouble(double)                          double = [SUD doubleForKey:MSStringify(double)]

#define MSSetDefaultForFloat(float)                         [SUD setFloat:float forKey:MSStringify(float)]
#define MSDefaultForFloat(float)                            float = [SUD floatForKey:MSStringify(float)]

#define MSSetDefaultForInteger(integer)                     [SUD setInteger:integer forKey:MSStringify(integer)]
#define MSDefaultForInteger(integer)                        integer = [SUD integerForKey:MSStringify(integer)]

#define MSSetDefaultForObject(object)                       [SUD setObject:object forKey:MSStringify(object)]
#define MSDefaultForObject(object)                          object = [SUD objectForKey:MSStringify(object)]
#define MSRemoveDefaultForObject(object)                    [SUD removeObjectForKey:MSStringify(object)]

#define MSDefaultDoesNotExistForObject(object)              [SUD objectForKey:MSStringify(object)] == nil
#define MSDefaultExistsForObject(object)                    [SUD objectForKey:MSStringify(object)] != nil

#define MSDefaultForArray(array)                            array = [SUD arrayForKey:MSStringify(array)]
#define MSDefaultForMutableArray(mutableArray)              mutableArray = [[SUD arrayForKey:MSStringify(mutableArray)] mutableCopy]

#define MSDefaultForData(data)                              data = [SUD dataForKey:MSStringify(data)]
#define MSDefaultForMutableData(mutableData)                mutableData = [[SUD dataForKey:MSStringify(mutableData)] mutableCopy]

#define MSDefaultForDictionary(dictionary)                  dictionary = [SUD dictionaryForKey:MSStringify(dictionary)]
#define MSDefaultForMutableDictionary(mutableDictionary)    mutableDictionary = [[SUD dictionaryForKey:MSStringify(mutableDictionary)] mutableCopy]

#define MSDefaultForString(string)                          string = [SUD stringForKey:MSStringify(string)]
#define MSDefaultForMutableString(mutableString)            mutableString = [[SUD stringForKey:MSStringify(mutableString)] mutableCopy]

#define MSDefaultForStringArray(stringArray)                stringArray = [SUD stringArrayForKey:MSStringify(stringArray)]
#define MSDefaultForStringArrayMutable(stringArrayMutable)  stringArrayMutable = [[SUD stringArrayForKey:MSStringify(stringArrayMutable)] mutableCopy]

#define MSSetDefaultForURL(url)                             [SUD setURL:url forKey:MSStringify(url)]
#define MSDefaultForURL(url)                                url = [SUD URLForKey:MSStringify(url)]
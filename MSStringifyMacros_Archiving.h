//
//  MSStringifyMacros_Archiving.h
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
#import "NSKeyedArchiver+MSStringifyMacrosAdditions.h"
#import "NSKeyedUnarchiver+MSStringifyMacrosAdditions.h"


#define MSEncodeBool(BOOL)          [aCoder encodeBool:BOOL forKey:MSStringify(BOOL)]
#define MSDecodeBool(BOOL)          BOOL = [aDecoder decodeBoolForKey:MSStringify(BOOL)]

#define MSEncodeDouble(double)      [aCoder encodeDouble:double forKey:MSStringify(double)]
#define MSDecodeDouble(double)      double = [aDecoder decodeDoubleForKey:MSStringify(double)]

#define MSEncodeFloat(float)        [aCoder encodeFloat:float forKey:MSStringify(float)]
#define MSDecodeFloat(float)        float = [aDecoder decodeFloatForKey:MSStringify(float)]

#define MSEncodeInt(int)            [aCoder encodeInt:int forKey:MSStringify(int)]
#define MSDecodeInt(int)            int = [aDecoder decodeIntForKey:MSStringify(int)]

#define MSEncodeInt32(int32_t)      [aCoder encodeInt32:int32_t forKey:MSStringify(int32_t)]
#define MSDecodeInt32(int32_t)      int32_t = [aDecoder decodeInt32ForKey:MSStringify(int32_t)]

#define MSEncodeInt64(int64_t)      [aCoder encodeInt64:int64_t forKey:MSStringify(int64_t)]
#define MSDecodeInt64(int64_t)      int64_t = [aDecoder decodeInt64ForKey:MSStringify(int64_t)]

#define MSEncodeObject(object)      [aCoder encodeObject:object forKey:MSStringify(object)]
#define MSDecodeObject(object)      object = [aDecoder decodeObjectForKey:MSStringify(object)]

#define MSContainsValue(value)      [aDecoder containsValueForKey:MSStringify(value)]



#define MSArchiveToDocsDirectory(object, result)                        result = [NSKeyedArchiver archiveObject:object toDocumentsDirectoryWithFileName:MSStringify(object)]
#define MSArchiveToDocsDirectoryUsingFilename(object, result, filename) result = [NSKeyedArchiver archiveObject:object toDocumentsDirectoryWithFileName:filename]
#define MSUnarchiveFromDocsDirectory(object)                            object = [NSKeyedUnarchiver unarchiveObjectWithFileName:MSStringify(object)]
#define MSUnarchiveFromDocsDirectoryUsingFilename(object, filename)     object = [NSKeyedUnarchiver unarchiveObjectWithFileName:filename]

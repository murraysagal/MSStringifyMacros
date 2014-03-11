//
//  NSKeyedUnarchiver+MSStringifyMacrosAdditions.m
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2014-03-10.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import "NSKeyedUnarchiver+MSStringifyMacrosAdditions.h"

@implementation NSKeyedUnarchiver (MSStringifyMacrosAdditions)

+ (id)unarchiveObjectWithFileName:(NSString *)fileName {
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return object;
    
}

@end

//
//  NSKeyedArchiver+MSStringifyMacrosAdditions.m
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2014-03-10.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import "NSKeyedArchiver+MSStringifyMacrosAdditions.h"

@implementation NSKeyedArchiver (MSStringifyMacrosAdditions)

+ (BOOL)archiveObject:(id)object toDocumentsDirectoryWithFileName:(NSString *)fileName {
    
    if (object == nil) return NO;
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
    BOOL result = [NSKeyedArchiver archiveRootObject:object toFile:filePath];
    return result;
    
}

@end

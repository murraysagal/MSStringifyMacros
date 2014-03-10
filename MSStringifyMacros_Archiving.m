//
//  MSStringifyMacros_Archiving.m
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2014-03-06.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import "MSStringifyMacros_Archiving.h"

@implementation MSStringifyMacros_Archiving

+ (NSString *)documentsDirectory {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
}

+ (NSString *)filePathInDocumentsForFileName:(NSString *)fileName {
    
    return [[self documentsDirectory] stringByAppendingPathComponent:fileName];
    
}

+ (BOOL)archiveObject:(id)object toDocumentsDirectoryWithFileName:(NSString *)fileName {
    
    NSString *filePath = [self filePathInDocumentsForFileName:fileName];
    BOOL result = (object != nil)? [NSKeyedArchiver archiveRootObject:object toFile:filePath] : NO;
    return result;
    
}

+ (id)unarchiveObjectWithFileName:(NSString *)fileName {
    
    NSString *filePath = [self filePathInDocumentsForFileName:fileName];
    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return object;
    
}

@end

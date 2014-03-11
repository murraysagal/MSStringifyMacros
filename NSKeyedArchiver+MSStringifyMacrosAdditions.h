//
//  NSKeyedArchiver+MSStringifyMacrosAdditions.h
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2014-03-10.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSKeyedArchiver (MSStringifyMacrosAdditions)

+ (BOOL)archiveObject:(id)object toDocumentsDirectoryWithFileName:(NSString *)fileName;

@end

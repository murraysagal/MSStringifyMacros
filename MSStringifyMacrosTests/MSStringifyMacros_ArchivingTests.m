//
//  MSStringifyMacros_ArchivingTests.m
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2/15/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSStringifyMacros_Archiving.h"

static BOOL shouldTestContainsValue;
static BOOL containsValueTestResultExpectedYes;
static BOOL containsValueTestResultExpectedNo;

@interface TestObject : NSObject  <NSCoding>

@property (nonatomic, assign) BOOL testBool;
@property (nonatomic, assign) double testDouble;
@property (nonatomic, assign) float testfloat;
@property (nonatomic, assign) int32_t testInt32;
@property (nonatomic, assign) int64_t testInt64;
@property (nonatomic, assign) int testInt;
@property (strong, nonatomic) NSString *testString;

@end

@implementation TestObject

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        
        decodeBool(self.testBool);
        decodeDouble(self.testDouble);
        decodeFloat(self.testfloat);
        decodeInt(self.testInt);
        decodeInt32(self.testInt32);
        decodeInt64(self.testInt64);
        decodeObject(self.testString);
        
        if (shouldTestContainsValue) {
            containsValueTestResultExpectedYes = containsValue(self.testBool);
            containsValueTestResultExpectedNo = containsValue(@"aNonExistentValue");
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

    encodeBool(self.testBool);
    encodeDouble(self.testDouble);
    encodeFloat(self.testfloat);
    encodeInt(self.testInt);
    encodeInt32(self.testInt32);
    encodeInt64(self.testInt64);
    encodeObject(self.testString);
    
}

@end



@interface MSStringifyMacros_ArchivingTests : XCTestCase

@property (strong, nonatomic) TestObject *testObject;
@property (strong, nonatomic) NSString *filePath;

@end

@implementation MSStringifyMacros_ArchivingTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.testObject = [[TestObject alloc] init];
    self.filePath = [self filePathInDocumentsForFileName:@"testObject"];
    shouldTestContainsValue = NO;
    
    (void) [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:nil];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

}

- (void)testEncodeDecodeBool {
    
    self.testObject.testBool = YES;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertTrue(self.testObject.testBool, @"Archived testObject.testBool archived as YES, unarchived as NO.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testEncodeDecodeDouble {
    
    double expectedResult = 99.9;
    self.testObject.testDouble = 99.9;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertEqual(self.testObject.testDouble, expectedResult, @"Unarchived testObject.testDouble not equal to expectedResult.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testEncodeDecodeFloat {
    
    float expectedResult = 99.9;
    self.testObject.testfloat = 99.9;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertEqual(self.testObject.testfloat, expectedResult, @"Unarchived testObject.testFloat not equal to expectedResult.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testEncodeDecodeInt32 {
    
    int32_t expectedResult = 99;
    self.testObject.testInt32 = 99;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertEqual(self.testObject.testInt32, expectedResult, @"Unarchived testObject.testInt32 not equal to expectedResult.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testEncodeDecodeInt64 {
    
    int64_t expectedResult = 99;
    self.testObject.testInt64 = 99;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertEqual(self.testObject.testInt64, expectedResult, @"Unarchived testObject.testInt64 not equal to expectedResult.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testEncodeDecodeInt {
    
    int expectedResult = 99;
    self.testObject.testInt = 99;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertEqual(self.testObject.testInt, expectedResult, @"Unarchived testObject.testInt not equal to expectedResult.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testEncodeDecodeObject {
    
    NSString *expectedResult = @"testString";
    self.testObject.testString = @"testString";
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertEqualObjects(self.testObject.testString, expectedResult, @"Unarchived testObject.testString not equal to expectedResult.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (void)testContainsValue {
    
    shouldTestContainsValue = YES;
    BOOL archiveSuccessful = [NSKeyedArchiver archiveRootObject:self.testObject toFile:self.filePath];
    if (archiveSuccessful) {
        self.testObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        XCTAssertTrue(containsValueTestResultExpectedYes, @"containsValue() returned no, should be yes.");
        XCTAssertFalse(containsValueTestResultExpectedNo, @"containsValue() returned yes, should be no.");
    } else {
        XCTFail(@"archiveRootObject failed.");
    }
}

- (NSString *)documentsDirectory {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
}

- (NSString *)filePathInDocumentsForFileName:(NSString *)fileName {
    
    return [[self documentsDirectory] stringByAppendingPathComponent:fileName];

}

- (void)testArchiveUnarchiveObject {
    
    NSString *stringObject = @"test";
    NSString *stringObjectCopy = [stringObject copy];
    
    BOOL result;
    
//    stringObject = nil; // test
    
    archiveToDocsDirectory(stringObject, result);
    NSLog(@"[<%@ %p> %@ line= %d] result= %@", [self class], self, NSStringFromSelector(_cmd), __LINE__, (result)? @"YES" : @"NO");
    
    if (result == YES) {

        unarchiveFromDocsDirectory(stringObject);
        NSLog(@"[<%@ %p> %@ line= %d] stringObject= %@", [self class], self, NSStringFromSelector(_cmd), __LINE__, stringObject);
        
        XCTAssertEqualObjects(stringObject, stringObjectCopy, @"Failed: Unarchived object not equal to original.");

    } else {
        XCTFail(@"Failed: archiveObjectToDocsDirectory");
    }
    

}


@end




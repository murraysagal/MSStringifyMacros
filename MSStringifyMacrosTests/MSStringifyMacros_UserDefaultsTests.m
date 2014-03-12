//
//  MSStringifyMacros_UserDefaultsTests.m
//  MSStringifyMacros
//
//  Created by Murray Sagal on 2/13/2014.
//  Copyright (c) 2014 Murray Sagal. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSStringifyMacros_UserDefaults.h"

@interface MSStringifyMacros_UserDefaultsTests : XCTestCase

@end

@implementation MSStringifyMacros_UserDefaultsTests

- (void)setUp {
    
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [NSUserDefaults resetStandardUserDefaults];
    
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



//--------------------------
#pragma mark - boolForKey...

- (void)testBOOLNoKey {
    
    BOOL savedBOOL = YES;
    MSDefaultForBool(savedBOOL);
    XCTAssertFalse(savedBOOL, @"No key for savedBOOL, savedBOOL should be NO");
}

- (void)testBOOLNO {
    
    BOOL expectedResult = NO;
    BOOL savedBOOL = NO;
    MSSetDefaultForBool(savedBOOL);
    MSDefaultForBool(savedBOOL);
    XCTAssertEqual(savedBOOL, expectedResult, @"savedBOOL and expectedResult not equal.");
}

- (void)testBOOLYES {
    
    BOOL expectedResult = YES;
    BOOL savedBOOL = YES;
    MSSetDefaultForBool(savedBOOL);
    MSDefaultForBool(savedBOOL);
    XCTAssertEqual(savedBOOL, expectedResult, @"savedBOOL and expectedResult not equal.");
}



//-----------------------------
#pragma mark - integerForKey...

- (void)testIntegerNoKey {
    
    NSInteger expectedResult = 0;
    NSInteger savedValue = 1;
    MSDefaultForInteger(savedValue);
    XCTAssertEqual(savedValue, expectedResult, @"No key for savedValue, savedValue should be zero.");
}

- (void)testIntegerZero {
    
    NSInteger expectedResult = 0;
    NSInteger savedInteger = 0;
    MSSetDefaultForInteger(savedInteger);
    MSDefaultForInteger(savedInteger);
    XCTAssertEqual(savedInteger, expectedResult, @"savedInteger and expectedResult not equal.");
}

- (void)testIntegerOne {
    
    NSInteger expectedResult = 1;
    NSInteger savedInteger = 1;
    MSSetDefaultForInteger(savedInteger);
    MSDefaultForInteger(savedInteger);
    XCTAssertEqual(savedInteger, expectedResult, @"savedInteger and expectedResult not equal.");
}

- (void)testIntegerNegativeOne {
    
    NSInteger expectedResult = -1;
    NSInteger savedInteger = -1;
    MSSetDefaultForInteger(savedInteger);
    MSDefaultForInteger(savedInteger);
    XCTAssertEqual(savedInteger, expectedResult, @"savedInteger and expectedResult not equal.");
}



//---------------------------
#pragma mark - floatForKey...

- (void)testFloatNoKey {
    
    // XCTest bug workaround. Without the 1 suffix XCTAssertEqual is using
    // the savedFloat value from testFloatNegative99Point9.
    
    float expectedResult1 = 0;
    float savedFloat1 = 1;
    MSDefaultForFloat(savedFloat1);
    XCTAssertEqual(savedFloat1, expectedResult1, @"No key for savedFloat, savedFloat should be zero.");
}

- (void)testFloatZero {
    
    float expectedResult = 0;
    float savedFloat = 0;
    MSSetDefaultForFloat(savedFloat);
    MSDefaultForFloat(savedFloat);
    XCTAssertEqual(savedFloat, expectedResult, @"savedFloat and expectedResult not equal.");
}

- (void)testFloat99Point9 {
    
    float expectedResult = 99.9;
    float savedFloat = 99.9;
    MSSetDefaultForFloat(savedFloat);
    MSDefaultForFloat(savedFloat);
    XCTAssertEqual(savedFloat, expectedResult, @"savedFloat and expectedResult not equal.");
}

- (void)testFloatNegative99Point9 {
    
    float expectedResult = -99.0;
    float savedFloat = -99.0;
    MSSetDefaultForFloat(savedFloat);
    MSDefaultForFloat(savedFloat);
    XCTAssertEqual(savedFloat, expectedResult, @"savedFloat and expectedResult not equal.");
}



//----------------------------
#pragma mark - doubleForKey...

- (void)testDoubleNoKey {
    
    // XCTest bug workaround. Without the 1 suffix XCTAssertEqual is using
    // the savedFloat value from testDoubleNegative99Point9.
    
    double expectedResult1 = 0;
    double savedDouble1 = 1;
    MSDefaultForDouble(savedDouble1);
    XCTAssertEqual(savedDouble1, expectedResult1, @"No key for savedDouble, savedDouble should be zero.");
}

- (void)testDoubleZero {
    
    double expectedResult = 0;
    double savedDouble = 0;
    MSSetDefaultForDouble(savedDouble);
    MSDefaultForDouble(savedDouble);
    XCTAssertEqual(savedDouble, expectedResult, @"savedDouble and expectedResult not equal.");
}

- (void)testDouble99Point9 {
    
    double expectedResult = 99.9;
    double savedDouble = 99.9;
    MSSetDefaultForDouble(savedDouble);
    MSDefaultForDouble(savedDouble);
    XCTAssertEqual(savedDouble, expectedResult, @"savedDouble and expectedResult not equal.");
}

- (void)testDoubleNegative99Point9 {
    
    double expectedResult = -99.9;
    double savedDouble = -99.9;
    MSSetDefaultForDouble(savedDouble);
    MSDefaultForDouble(savedDouble);
    XCTAssertEqual(savedDouble, expectedResult, @"savedDouble and expectedResult not equal.");
}



//---------------------------
#pragma mark - arrayForKey...

- (void)testArrayNoKey {
    
    NSArray *testArray = @[ @1, @2, @3 ];
    MSDefaultForArray(testArray);
    XCTAssertNil(testArray, @"There is no key for testArray, should be nil but was not.");
}

- (void)testArrayNotNSArray {
    
    id stringObject = @"not an NSArray";
    MSSetDefaultForObject(stringObject);
    MSDefaultForArray(stringObject);
    XCTAssertNil(stringObject, @"stringObject is not an NSArray, should be nil but was not.");
}

- (void)testArray {
    
    NSArray *expectedResult = @[ @1, @2, @3 ];
    NSArray *savedArray = [expectedResult copy];
    MSSetDefaultForObject(savedArray);
    MSDefaultForArray(savedArray);
    XCTAssertEqualObjects(savedArray, expectedResult, @"savedArray and expectedResult not equal.");
}

- (void)testMutableArray {
    
    NSArray *array = @[ @1, @2, @3 ];
    NSMutableArray *expectedResult = [array mutableCopy];
    NSMutableArray *savedMutableArray = [expectedResult copy];
    MSSetDefaultForObject(savedMutableArray);
    MSDefaultForMutableArray(savedMutableArray);
    XCTAssertEqualObjects(savedMutableArray, expectedResult, @"savedMutableArray and expectedResult not equal.");
    
    [savedMutableArray removeLastObject];
    NSUInteger newSize = 2;
    XCTAssertEqual(savedMutableArray.count, newSize, @"savedMutableArray.count and newSize not equal after mutation.");
}



//--------------------------
#pragma mark - dataForKey...

- (void)testDataNoKey {
    
    NSString *testString = @"testString";
    NSData *testData = [testString dataUsingEncoding:NSUTF8StringEncoding];
    MSDefaultForData(testData);
    XCTAssertNil(testData, @"There is no key for testData, should be nil but was not.");
}

- (void)testDataNotNSData {
    
    id stringObject = @"not an NSData";
    MSSetDefaultForObject(stringObject);
    MSDefaultForData(stringObject);
    XCTAssertNil(stringObject, @"stringObject is not an NSData, should be nil but was not.");
}

- (void)testData {
    
    NSString *testString = @"testString";
    NSData *expectedResult = [testString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *savedData = [expectedResult copy];
    MSSetDefaultForObject(savedData);
    MSDefaultForData(savedData);
    XCTAssertEqualObjects(savedData, expectedResult, @"savedData and expectedResult not equal.");
}

- (void)testMutableData {
    
    NSString *testString = @"testString";
    NSMutableData *expectedResult = [[testString dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    NSMutableData *savedMutableData = [expectedResult copy];
    MSSetDefaultForObject(savedMutableData);
    MSDefaultForMutableData(savedMutableData);
    XCTAssertEqualObjects(savedMutableData, expectedResult, @"savedData and expectedResult not equal.");
    
    [savedMutableData increaseLengthBy:1];
    NSUInteger newLength = expectedResult.length + 1;
    XCTAssertEqual(savedMutableData.length, newLength, @"savedMutableData.length and newLength not equal after mutation.");
}



//--------------------------------
#pragma mark - dictionaryForKey...

- (void)testDictionaryNoKey {
    
    NSDictionary *testDictionary = [NSDictionary dictionaryWithObject:@1 forKey:@"1"];
    MSDefaultForDictionary(testDictionary);
    XCTAssertNil(testDictionary, @"There is no key for testDictionary, should be nil but was not.");
}

- (void)testDictionaryNotNSDictionary {
    
    id stringObject = @"not an NSDictionary";
    MSSetDefaultForObject(stringObject);
    MSDefaultForDictionary(stringObject);
    XCTAssertNil(stringObject, @"stringObject is not an NSDictionary, should be nil but was not.");
}

- (void)testDictionary {
    
    NSDictionary *expectedResult = [NSDictionary dictionaryWithObject:@1 forKey:@"1"];
    NSDictionary *savedDictionary = [expectedResult copy];
    MSSetDefaultForObject(savedDictionary);
    MSDefaultForDictionary(savedDictionary);
    XCTAssertEqualObjects(savedDictionary, expectedResult, @"savedDictionary and expectedResult not equal.");
}

- (void)testMutableDictionary {
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:@1 forKey:@"1"];
    NSMutableDictionary *expectedResult = [dictionary mutableCopy];
    NSMutableDictionary *savedMutableDictionary = [expectedResult copy];
    MSSetDefaultForObject(savedMutableDictionary);
    MSDefaultForMutableDictionary(savedMutableDictionary);
    XCTAssertEqualObjects(savedMutableDictionary, expectedResult, @"savedMutableDictionary and expectedResult not equal.");
    
    [savedMutableDictionary removeObjectForKey:@"1"];
    NSUInteger newCount = 0;
    XCTAssertEqual(savedMutableDictionary.count, newCount, @"savedMutableDictionary.count and newCount not equal after mutation.");
}



//---------------------------------
#pragma mark - stringArrayForKey...

- (void)testStringArrayNoKey {
    
    NSArray *arrayOfStrings = @[ @"a", @"b", @"c" ];
    MSDefaultForStringArray(arrayOfStrings);
    XCTAssertNil(arrayOfStrings, @"There is no key for testStringArray, should be nil but was not.");
}

- (void)testStringArrayNotNSArray {
    
    id stringObject = @"not an NSArray";
    MSSetDefaultForObject(stringObject);
    MSDefaultForStringArray(stringObject);
    XCTAssertNil(stringObject, @"stringObject is not an NSArray, should be nil but was not.");
}

- (void)testStringArrayNotNSArrayOfStrings {
    
    NSArray *arrayOfNumbers = @[ @1, @2, @3 ];
    MSSetDefaultForObject(arrayOfNumbers);
    MSDefaultForStringArray(arrayOfNumbers);
    XCTAssertNil(arrayOfNumbers, @"arrayOfNumbers is not an NSArray of strings, should be nil but was not.");
}

- (void)testStringArray {
    
    NSArray *expectedResult = @[ @"a", @"b", @"c" ];
    NSArray *savedArrayOfStrings = [expectedResult copy];
    MSSetDefaultForObject(savedArrayOfStrings);
    MSDefaultForStringArray(savedArrayOfStrings);
    XCTAssertEqualObjects(savedArrayOfStrings, expectedResult, @"savedArrayOfStrings and expectedResult not equal.");
}

- (void)testStringArrayMutable {
    
    NSArray *arrayOfStrings = @[ @"a", @"b", @"c" ];
    NSMutableArray *expectedResult = [arrayOfStrings mutableCopy];
    NSMutableArray *savedMutableArrayOfStrings = [expectedResult copy];
    MSSetDefaultForObject(savedMutableArrayOfStrings);
    MSDefaultForStringArrayMutable(savedMutableArrayOfStrings);
    XCTAssertEqualObjects(savedMutableArrayOfStrings, expectedResult, @"savedMutableArrayOfStrings and expectedResult not equal.");
    
    [savedMutableArrayOfStrings removeLastObject];
    NSUInteger newCount = 2;
    XCTAssertEqual(savedMutableArrayOfStrings.count, newCount, @"savedMutableArrayOfStrings.count and newCount not equal after mutation.");
}



//----------------------------
#pragma mark - stringForKey...

- (void)testStringNoKey {
    
    NSString *testString = @"testString";
    MSDefaultForString(testString);
    XCTAssertNil(testString, @"There is no key for testString, should be nil but was not.");
}

- (void)testStringNotNSStringOrNSNumber {
    
    id arrayObject = [NSArray array];
    MSSetDefaultForObject(arrayObject);
    MSDefaultForString(arrayObject);
    XCTAssertNil(arrayObject,  @"arrayObject is not an NSString or an NSNumber, should be nil but was not.");
}

- (void)testStringWithString {
    
    NSString *expectedResult = @"testString";
    NSString *savedString = [expectedResult copy];
    MSSetDefaultForObject(savedString);
    MSDefaultForString(savedString);
    XCTAssertEqualObjects(savedString, expectedResult, @"savedString and expectedResult not equal.");
}

- (void)testStringWithNumber {
    
    NSString *expectedResult = @"1";
    NSNumber *testNumber = @1;
    id savedNumber = testNumber;
    MSSetDefaultForObject(savedNumber);
    MSDefaultForString(savedNumber);
    XCTAssertEqualObjects(savedNumber, expectedResult, @"savedNumber and expectedResult not equal.");
}

- (void)testMutableString {
    
    NSString *testString = @"testString";
    NSMutableString *expectedResult = [testString mutableCopy];
    NSMutableString *savedMutableString = [expectedResult copy];
    MSSetDefaultForObject(savedMutableString);
    MSDefaultForMutableString(savedMutableString);
    XCTAssertEqualObjects(savedMutableString, expectedResult, @"savedMutableString and expectedResult not equal.");
    
    [savedMutableString setString:@"a"];
    NSUInteger newLength = 1;
    XCTAssertEqual(savedMutableString.length, newLength, @"savedMutableString.length and newLength not equal after mutation.");
}



//-------------------------
#pragma mark - urlForKey...

- (void)testURLNoKey {
    
    NSURL *testURL = [NSURL URLWithString:@"http://www.apple.com"];
    MSDefaultForURL(testURL);
    XCTAssertNil(testURL, @"There is no key for testURL, should be nil but was not.");
}

- (void)testURL {
    
    NSURL *expectedResult = [NSURL URLWithString:@"http://www.apple.com"];
    NSURL *savedURL = [expectedResult copy];
    MSSetDefaultForURL(savedURL);
    MSDefaultForURL(savedURL);
    XCTAssertEqualObjects(savedURL, expectedResult, @"savedURL and expectedResult not equal.");
}



//----------------------------------
#pragma mark - removeObjectForKey...

- (void)testRemoveDefaultForObjectAndExists {
    
    BOOL expectedResult;
    BOOL actualResult;
    
    NSString *testString = @"testString";
    
    MSSetDefaultForObject(testString);
    
    expectedResult = NO;
    actualResult = MSDefaultDoesNotExistForObject(testString);
    XCTAssertEqual(actualResult, expectedResult, @"default exists, actualResult should be NO.");
    
    expectedResult = YES;
    actualResult = MSDefaultExistsForObject(testString);
    XCTAssertEqual(actualResult, expectedResult, @"default exists, actualResult should be YES.");
    
    MSRemoveDefaultForObject(testString);
    MSDefaultForObject(testString);
    XCTAssertNil(testString, @"testString removed from defaults, testString should be nil.");
    
    expectedResult = YES;
    actualResult = MSDefaultDoesNotExistForObject(testString);
    XCTAssertEqual(actualResult, expectedResult, @"default does not exist, actualResult should be YES.");
    
    expectedResult = NO;
    actualResult = MSDefaultExistsForObject(testString);
    XCTAssertEqual(actualResult, expectedResult, @"default does not exist, actualResult should be NO.");
}

@end

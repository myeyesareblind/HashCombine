//
//  HashingLookupTest.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 09.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Hashing.h"
#import "TestObject.h"
#import "FindPrime.h"
#import "HashCalcDefines.h"

@interface BuildDictTest : XCTestCase
@end

@implementation BuildDictTest

- (void)testHashBuildTime {
    
    @autoreleasepool {
        NSArray* samples = [HashingIntObject randomIntAndIntObjectsWithCount:SampleCount];
        NSLog(@"sum     duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:SumIntHashBlock()]));
        NSLog(@"xor     duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:XORIntHashBlock()]));
        NSLog(@"mikeash duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:MikeAshIntHashBlock()]));
        NSLog(@"boost   duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:BoostIntHashBlock()]));
        NSLog(@"prime   duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:PrimeMultIntHashBlock()]));
        NSLog(@"fnv     duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:FNVIntHashBlock()]));
        NSLog(@"oat     duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:OATIntHashBlock()]));
        NSLog(@"elf     duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:ElfIntHashBlock()]));
        NSLog(@"jenkins duration: %@", @([self testDictionaryBuildTimeWithKeys:samples hashFunction:JenkinsIntHashBlock()]));
    }
    
}

- (CFTimeInterval)testDictionaryBuildTimeWithKeys:(NSArray*)randomObjects hashFunction:(id)calcHashBlock {
    [randomObjects makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:calcHashBlock];
    
    __block NSUInteger isEqualCalledCount = 0;
    [randomObjects makeObjectsPerformSelector:@selector(setOnIsEqual:) withObject:^(NSObject* o1, NSObject* o2) {
        isEqualCalledCount++;
    }];
    
    CFTimeInterval ti = CFAbsoluteTimeGetCurrent();
    [NSDictionary dictionaryWithObjects:randomObjects forKeys:randomObjects];
    NSLog(@"eqCount: %@", @(isEqualCalledCount));
    return CFAbsoluteTimeGetCurrent() - ti;
}

@end

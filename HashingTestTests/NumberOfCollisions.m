//
//  NumberOfCollisions.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 18.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Hashing.h"
#import "TestObject.h"
#import "FindPrime.h"
#import "HashCalcDefines.h"
#import "Bucket.h"
#import "NSDictionaryBuildSimulator.h"

NSString* stringCSVofBucketList(NSArray<Bucket*>*);
NSString* stringCSVofBucketList(NSArray<Bucket*>* bucketList) {
    
    NSMutableArray* bucketsAsStrings = [NSMutableArray new];
    [bucketList enumerateObjectsUsingBlock:^(Bucket * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [bucketsAsStrings addObject:@(obj.numOfElements).stringValue];
    }];
    
    return [bucketsAsStrings componentsJoinedByString:@","];
}

@interface NumberOfCollisions : XCTestCase
@end

@implementation NumberOfCollisions

- (void)testNumberOfCollisionsOnDictionaryPrime {
    @autoreleasepool {
        /// used for plot
        NSArray* samples = [HashingIntObject randomIntAndIntObjectsWithCount:SampleCount];
        @autoreleasepool {
            NSLog(@"sum");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:SumIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"xor");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:XORIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"mikeash");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:MikeAshIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"boost");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:BoostIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"prime");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:PrimeMultIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"fnv");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:FNVIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"oat");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:OATIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"elf");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:ElfIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
        @autoreleasepool {
            NSLog(@"jenkins");
            [samples makeObjectsPerformSelector:@selector(setCalcHashBlock:) withObject:JenkinsIntHashBlock()];
            NSLog(@"%@", stringCSVofBucketList([NSDictionaryBuildSimulator filledBucketsWithKeys:samples]));
        }
    }
}

@end

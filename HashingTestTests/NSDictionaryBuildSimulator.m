//
//  NSDictionaryBuildSimulator.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 27.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "NSDictionaryBuildSimulator.h"
#import "FindPrime.h"
#import "Bucket.h"

@implementation NSDictionaryBuildSimulator

+ (NSArray<Bucket*>*)filledBucketsWithKeys:(NSArray<NSObject*>*)keys {
    NSUInteger bucketCount = dictionaryModuloPrime(keys.count);
    
    NSMutableArray* bucketList = [NSMutableArray new];
    for (int i = 0; i < bucketCount; i++) {
        [bucketList addObject:[Bucket new]];
    }
    
    for (NSObject* o in keys) {
        NSUInteger hashModulo = o.hash % bucketCount;
        [self iterateWhileEmptyBucketFoundWithHash:hashModulo inBuckets:bucketList];
    }
    
    return bucketList;
}

+ (void)iterateWhileEmptyBucketFoundWithHash:(NSUInteger)hash inBuckets:(NSArray*)buckets {
    NSUInteger i = hash;
    while (YES) {
        if ((i + 1) == buckets.count) {
            i = 0;
        }
        Bucket* ithBucket = buckets[i];
        ithBucket.numOfElements = ithBucket.numOfElements + 1;
        if (ithBucket.numOfElements == 1) {
            break;
        }
        i++;
    }
}

@end

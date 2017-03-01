//
//  NSDictionaryBuildSimulator.h
//  HashingTest
//
//  Created by Maksym Stobetskyi on 27.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bucket;
@interface NSDictionaryBuildSimulator : NSObject

+ (NSArray<Bucket*>*)filledBucketsWithKeys:(NSArray<NSObject*>*)keys;

@end

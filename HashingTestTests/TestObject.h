//
//  TestObject.h
//  HashingTest
//
//  Created by Maksym Stobetskyi on 11.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSUInteger SampleCount;

@class HashingIntObject;

typedef NSUInteger (^CalcIntHashBlock)(HashingIntObject*);

typedef void (^OnIsEqual)(NSObject*, NSObject*);

@interface HashingIntObject : NSObject <NSCopying>
@property (readwrite) NSUInteger prop1;
@property (readwrite) NSUInteger prop2;
@property (readwrite) CalcIntHashBlock calcHashBlock;
@property (readwrite) OnIsEqual onIsEqual;

+ (NSArray*)randomIntAndIntObjectsWithCount:(NSUInteger)count;

@end

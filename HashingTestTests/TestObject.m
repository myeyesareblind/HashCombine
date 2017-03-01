//
//  TestObject.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 11.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "TestObject.h"

const NSUInteger SampleCount = 500;

@implementation HashingIntObject

- (BOOL)isEqual:(id)object {
    HashingIntObject* other = object;
    self.onIsEqual(self, object);
    return other.prop1 == self.prop1 && other.prop2 == self.prop2;
}

- (NSUInteger)hash {
    return _calcHashBlock(self);
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@-%@, hash(%@)", @(self.prop1), @(self.prop2), @(self.hash)];
}

- (id)copyWithZone:(NSZone *)zone {
    HashingIntObject* other = [HashingIntObject new];
    other.calcHashBlock = self.calcHashBlock;
    other.onIsEqual = self.onIsEqual;
    other.prop1 = self.prop1;
    other.prop1 = self.prop2;
    return other;
}

+ (NSArray*)randomIntAndIntObjectsWithCount:(NSUInteger)count {
    NSMutableArray* hashingObjects = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        HashingIntObject* hashObj = [HashingIntObject new];
        hashObj.prop1 = arc4random() % count;
        hashObj.prop2 = arc4random() % count;
        [hashingObjects addObject:hashObj];
    }
    return hashingObjects;
}
@end

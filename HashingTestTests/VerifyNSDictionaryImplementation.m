//
//  VerifyNSDictionaryImplementation.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 18.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Hashing.h"
#import "TestObject.h"
#import "FindPrime.h"

@interface TestHash : NSObject <NSCopying>
@property (readwrite) NSUInteger mHash;
@property (readwrite) OnIsEqual onEqual;
@end

@implementation TestHash
- (NSUInteger)hash {
    return _mHash;
}
- (BOOL)isEqual:(id)object {
    TestHash* other = object;
    self.onEqual(self, other);
    return other.hash == self.hash;
}
- (id)copyWithZone:(NSZone *)zone {
    TestHash* other = [TestHash new];
    other.mHash = self.mHash;
    other.onEqual = self.onEqual;
    return other;
}
@end


@interface VerifyNSDictionaryImplementation : XCTestCase
@end

@implementation VerifyNSDictionaryImplementation

- (void)testVerifyNSDictionaryImpl {
    /// test to verify assumptions about dictionary implementation
    ///
    
    NSMutableArray* keys = [NSMutableArray new];
    NSUInteger prime = dictionaryModuloPrime(50);
    __block NSUInteger onCompare = 0;
    for (int i = 0; i < 50; i++) {
        TestHash* th = [TestHash new];
        th.onEqual = ^(NSObject* _, NSObject* __) {
            onCompare++;
        };
        th.mHash = 1 + i * prime;
        [keys addObject:th];
    }
    [NSDictionary dictionaryWithObjects:keys forKeys:keys];
    XCTAssertEqual(onCompare, (1 + 49) / 2 * 49);
}

@end

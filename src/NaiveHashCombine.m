//
//  PrimitiveHash.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 27.02.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "NaiveHashCombine.h"

void SumHashCombine(NSUInteger* hashCombine, NSUInteger value) {
    *hashCombine = *hashCombine + value;
}

void XORHashCombine(NSUInteger* hashCombine, NSUInteger value) {
    *hashCombine = *hashCombine ^ value;
}

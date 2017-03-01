//
//  BoostHashCombine.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 27.02.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "BoostHashCombine.h"

const NSUInteger BoostHashMagicNumber = 0x9e3779b9;

void BoostHashCombine(NSUInteger* hashCombine, NSUInteger value) {
    NSUInteger seed = *hashCombine;
    seed ^= value + BoostHashMagicNumber + (seed << 6) + (seed >> 2);
    *hashCombine = seed;
}

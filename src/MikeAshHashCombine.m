//
//  MikeAshHashCombine.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 11.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "MikeAshHashCombine.h"

void MikeAshHashCombine(NSUInteger* hashCombine, NSUInteger value) {
#define NSUINT_BIT (CHAR_BIT * sizeof(NSUInteger))
#define NSUINTROTATE(val, howmuch) ((((NSUInteger)val) << howmuch) | (((NSUInteger)val) >> (NSUINT_BIT - howmuch)))
    *hashCombine = NSUINTROTATE(*hashCombine, NSUINT_BIT / 2) ^ value;
}

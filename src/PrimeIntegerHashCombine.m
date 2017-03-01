//
//  AdvancedHashCombine.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 27.02.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "PrimeIntegerHashCombine.h"

void PrimeIntegerHashCombine(NSUInteger* hashCombine, NSUInteger value) {
    *hashCombine = *hashCombine * 37 + value;
}

NSUInteger PrimeIntegerInitialValue() {
    return 17;
}

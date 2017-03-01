//
//  OATHashCombine.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 07.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "OATHashCombine.h"

NSUInteger OATHashInitialValue() {
    return 0;
}

void OATHashUpdate(NSUInteger* h, NSUInteger value) {
    unsigned char *p = (unsigned char*)&value;
    NSUInteger hash = *h;

    for (int i = 0; i < sizeof(NSUInteger); i++) {
        hash += p[i];
        hash += (hash << 10);
        hash ^= (hash >> 6);
    }
    *h = hash;
}

void OATHashFinalize(NSUInteger* h) {
    NSUInteger hash = *h;
    hash += (hash << 3);
    hash ^= (hash >> 11);
    hash += (hash << 15);
    *h = hash;
}


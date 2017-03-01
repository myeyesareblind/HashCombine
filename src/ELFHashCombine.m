//
//  ELFHashCombine.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 18.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "ELFHashCombine.h"

#define ELF_STEP(B) T1 = (H << 4) + B; T2 = T1 & 0xF0000000; if (T2) T1 ^= (T2 >> 24); T1 &= (~T2); H = T1;

CFHashCode CFHashBytes(uint8_t *bytes, CFIndex length) {
    /* The ELF hash algorithm, used in the ELF object file format */
    UInt32 H = 0, T1, T2;
    SInt32 rem = length;
    while (3 < rem) {
        ELF_STEP(bytes[length - rem]);
        ELF_STEP(bytes[length - rem + 1]);
        ELF_STEP(bytes[length - rem + 2]);
        ELF_STEP(bytes[length - rem + 3]);
        rem -= 4;
    }
    switch (rem) {
        case 3:  ELF_STEP(bytes[length - 3]);
        case 2:  ELF_STEP(bytes[length - 2]);
        case 1:  ELF_STEP(bytes[length - 1]);
        case 0:  ;
    }
    return H;
}

#undef ELF_STEP


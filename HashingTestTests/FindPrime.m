//
//  FindPrime.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 18.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "FindPrime.h"

static const unsigned long __CFBasicHashTableSizes[64] = {
    0, 3, 7, 13, 23, 41, 71, 127, 191, 251, 383, 631, 1087, 1723,
    2803, 4523, 7351, 11959, 19447, 31231, 50683, 81919, 132607,
    214519, 346607, 561109, 907759, 1468927, 2376191, 3845119,
    6221311, 10066421, 16287743, 26354171, 42641881, 68996069,
    111638519, 180634607, 292272623, 472907251,
#if __LP64__
    765180413UL, 1238087663UL, 2003267557UL, 3241355263UL, 5244622819UL,
#if 0
    8485977589UL, 13730600407UL, 22216578047UL, 35947178479UL,
    58163756537UL, 94110934997UL, 152274691561UL, 246385626107UL,
    398660317687UL, 645045943807UL, 1043706260983UL, 1688752204787UL,
    2732458465769UL, 4421210670577UL, 7153669136377UL,
    11574879807461UL, 18728548943849UL, 30303428750843UL
#endif
#endif
};

static const unsigned long __CFBasicHashTableCapacities[64] = {
    0, 3, 6, 11, 19, 32, 52, 85, 118, 155, 237, 390, 672, 1065,
    1732, 2795, 4543, 7391, 12019, 19302, 31324, 50629, 81956,
    132580, 214215, 346784, 561026, 907847, 1468567, 2376414,
    3844982, 6221390, 10066379, 16287773, 26354132, 42641916,
    68996399, 111638327, 180634415, 292272755,
#if __LP64__
    472907503UL, 765180257UL, 1238087439UL, 2003267722UL, 3241355160UL,
#if 0
    5244622578UL, 8485977737UL, 13730600347UL, 22216578100UL,
    35947178453UL, 58163756541UL, 94110935011UL, 152274691274UL,
    246385626296UL, 398660317578UL, 645045943559UL, 1043706261135UL,
    1688752204693UL, 2732458465840UL, 4421210670552UL,
    7153669136706UL, 11574879807265UL, 18728548943682UL
#endif
#endif
};

const NSUInteger PrimeCount = 64;
NSUInteger dictionaryModuloPrime(NSUInteger dictionarySize) {
    for (int i = 0; i < PrimeCount; i++) {
        NSUInteger hashSize = __CFBasicHashTableCapacities[i];
        if (hashSize > dictionarySize) {
            return __CFBasicHashTableSizes[i];
        }
    }
    return 0;
}

NSUInteger findModuloPrime(NSUInteger i1, NSUInteger i2) {
    for (int i = PrimeCount - 1; i >= 1; i--) {
        NSUInteger prime = __CFBasicHashTableSizes[i];
        if ((i1 % prime) == (i2 % prime)) {
            return prime;
        }
    }
    return 0;
}

//
//  HashCalcDefines.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 18.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "HashCalcDefines.h"
#import "ELFHashCombine.h"
#import "spooky-c.h"

CalcIntHashBlock SumIntHashBlock() {
    return ^NSUInteger(HashingIntObject* o) {
        return o.prop1 + o.prop2;
    };
}

CalcIntHashBlock XORIntHashBlock() {
    return ^NSUInteger(HashingIntObject* o) {
        return o.prop1 ^ o.prop2;
    };
}

CalcIntHashBlock makeIntHashBlock(HashFuncInitialValue initValueFunc,
                                  HashFuncUpdate updateFunc,
                                  HashFuncFinalize finalizeFunc) {
    return ^NSUInteger(HashingIntObject* o) {
        NSUInteger combine = initValueFunc ? initValueFunc() : 0;
        updateFunc(&combine, o.prop1);
        updateFunc(&combine, o.prop2);
        if (finalizeFunc) {
            finalizeFunc(&combine);
        }
        return combine;
    };
}

CalcIntHashBlock MikeAshIntHashBlock() {
    return makeIntHashBlock(nil, MikeAshHashCombine, nil);
}

CalcIntHashBlock BoostIntHashBlock() {
    return makeIntHashBlock(nil, BoostHashCombine, nil);
}

CalcIntHashBlock PrimeMultIntHashBlock() {
    return makeIntHashBlock(PrimeIntegerInitialValue, PrimeIntegerHashCombine, nil);
};

CalcIntHashBlock FNVIntHashBlock() {
    return makeIntHashBlock(FNVHashInitialValue, FNVHashUpdate, FNVHashFinalize);
}

CalcIntHashBlock OATIntHashBlock() {
    return makeIntHashBlock(OATHashInitialValue, OATHashUpdate, OATHashFinalize);
}

CalcIntHashBlock ElfIntHashBlock() {
    return ^NSUInteger(HashingIntObject* o) {
        NSUInteger integers[2] = {(NSUInteger)o.prop1, (NSUInteger)o.prop2};
        return CFHashBytes((uint8_t*)integers, 2 * sizeof(NSUInteger));
    };   
}

CalcIntHashBlock JenkinsIntHashBlock() {
    return ^NSUInteger(HashingIntObject* o) {
        NSUInteger integers[2] = {(NSUInteger)o.prop1, (NSUInteger)o.prop2};
        return spooky_hash64((uint8_t*)integers, 2 * sizeof(NSUInteger), 0);
    };
}

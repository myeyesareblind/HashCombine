//
//  FNVHashCombine.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 07.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "FNVHashCombine.h"

NSUInteger FNVHashInitialValue() {
#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    return 14695981039346656037ul;
#else
    return 2166136261u;
#endif
}

void FNVHashUpdate(NSUInteger* h, NSUInteger value) {
#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    NSUInteger magic = 1099511628211lu;
#else
    NSUInteger magic = 16777619u;
#endif
    NSUInteger hash = *h;
    unsigned char *p = (unsigned char*)&value;
    for (int i = 0; i < sizeof(NSUInteger); i++) {
        hash = (hash ^ p[i]) * magic;
    }
    *h = hash;
}

void FNVHashFinalize(NSUInteger* h){}

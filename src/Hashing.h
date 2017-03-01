//
//  Hashing.h
//  HashingTest
//
//  Created by Maksym Stobetskyi on 24/02/2017.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NaiveHashCombine.h"
#import "BoostHashCombine.h"
#import "FNVHashCombine.h"
#import "OATHashCombine.h"
#import "PrimeIntegerHashCombine.h"
#import "MikeAshHashCombine.h"

typedef NSUInteger HashFuncInitialValue();
typedef void HashFuncUpdate(NSUInteger* hashCombine, NSUInteger rhs);
typedef void HashFuncFinalize(NSUInteger* hashCombine);


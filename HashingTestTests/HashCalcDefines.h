//
//  HashCalcDefines.h
//  HashingTest
//
//  Created by Maksym Stobetskyi on 18.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"
#import "Hashing.h"

extern CalcIntHashBlock SumIntHashBlock();
extern CalcIntHashBlock XORIntHashBlock();
extern CalcIntHashBlock MikeAshIntHashBlock();
extern CalcIntHashBlock BoostIntHashBlock();
extern CalcIntHashBlock PrimeMultIntHashBlock();
extern CalcIntHashBlock FNVIntHashBlock();
extern CalcIntHashBlock OATIntHashBlock();
extern CalcIntHashBlock ElfIntHashBlock();
extern CalcIntHashBlock JenkinsIntHashBlock();


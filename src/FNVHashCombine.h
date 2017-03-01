//
//  FNVHashCombine.h
//  HashingTest
//
//  Created by Maksym Stobetskyi on 07.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>

NSUInteger FNVHashInitialValue();
void FNVHashUpdate(NSUInteger* h, NSUInteger value);
void FNVHashFinalize(NSUInteger* h);


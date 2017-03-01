//
//  OATHashCombine.h
//  HashingTest
//
//  Created by Maksym Stobetskyi on 07.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>

NSUInteger OATHashInitialValue();
void OATHashUpdate(NSUInteger* hashCombine, NSUInteger value);
void OATHashFinalize(NSUInteger* hashCombine);

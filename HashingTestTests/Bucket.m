//
//  Bucket.m
//  HashingTest
//
//  Created by Maksym Stobetskyi on 27.03.17.
//  Copyright © 2017 Readdle. All rights reserved.
//

#import "Bucket.h"

@implementation Bucket

- (instancetype)init {
    self = [super init];
    if (self) {
        self.numOfElements = 0;
    }
    return self;
}
@end

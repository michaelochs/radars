//
//  AppDelegate.m
//  TernaryOperatorNullableWarning
//
//  Created by Michael Ochs on 3/15/16.
//  Copyright © 2016 bitecode. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate () <UISplitViewControllerDelegate>

@property (nullable, nonatomic) NSString *nullableValue;

@end

@implementation AppDelegate

- (nullable instancetype)init {
    self = [super init];
    if (self) {
        /*
         The next line triggers the warning
             "Implicit conversion from nullable pointer 'NSString * _Nullable' to non-nullable pointer type 'NSString * _Nonnull'"
         which is incorrect as with the short version of the ternary operator the expression in question is only evaluated once.
         Therefore this is a valid check for the return value of `nullableValue` to be nonnull.
         
         Also this warning can be prevented when writing the following:

             NSString *nullableValue = self.nullableValue;
             [self doSomething:(nullableValue ?: @"nonnullValue")];
         
         This should do the same as the version below, as long as the second parameter of the ternary operator is empty.
         */
        [self doSomething:(self.nullableValue ?: @"nonnullValue")];
    }
    return self;
}

- (void)doSomething:(NSString *)nonnullValue {
    // empty
}

@end

NS_ASSUME_NONNULL_END

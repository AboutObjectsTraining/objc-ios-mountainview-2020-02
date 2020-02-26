// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase
@end

@implementation ClassClusterTests

- (void)testArrayClassCluster {
    NSArray *a1 = [NSArray alloc];
    NSArray *a2 = [NSArray alloc];
    
    a1 = [a1 initWithObjects:@"One", @"Two", nil];
    a2 = [a2 initWithArray:@[@"Foo"]];
    
    NSLog(@"%@", a1);
    NSLog(@"%@", a2);
}

- (void)testStringClassCluster {
    NSString *s1 = [NSString alloc];
    NSMutableString *s2 = [NSMutableString alloc];
    
    s1 = [s1 initWithFormat:@"first: %@, second: %@", @(1), @(2)];
    s2 = [s2 initWithString:s1];
    
    NSLog(@"%@", s1);
    NSLog(@"%@", s2);
}

@end

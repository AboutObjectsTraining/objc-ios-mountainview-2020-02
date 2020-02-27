// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface BlockLiteralTests : XCTestCase
@property (copy, nonatomic) NSString *text;
@end


void sayHello(void) {
    printf("Hello!\n");
}

void saySomething(void (*thingToSay)(void)) {
    for (int i = 0; i < 3; i++) {
        thingToSay();
    }
}

void saySomethingBlockish(void (^blockToExecute)(void)) {
    for (int i = 0; i < 3; i++) {
        blockToExecute();
    }
    
    void (^cloneOfMyBlock)(void) = [blockToExecute copy];
    cloneOfMyBlock();
}

@implementation BlockLiteralTests

- (void)setUp {
    self.text = @"Woohoo!";
}

- (void)testFunctionPointers {
    void (*myPtr)(void);
    myPtr = sayHello;
    
    myPtr();
}

- (void)testFunctionPointerAsArgument {
    saySomething(sayHello);
}

- (void)testBlockLiteral {
    NSString *foo = self.text;
    saySomethingBlockish(^{ NSLog(@"Blockish Hello! %@\n", foo); });
    saySomethingBlockish(^{ NSLog(@"Blockish Hello! %@\n", self.text); });
}


@end

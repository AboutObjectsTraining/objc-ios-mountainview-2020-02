// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import "XYZPerson.h"
#import "Person.h"
#import "Dog.h"

@interface UnitTests : XCTestCase
@end

@implementation UnitTests

- (void)testCreatePerson {
    NSLog(@"In %s", __func__);
    
    Person *myPerson = [[Person alloc] init];
    [myPerson setFirstName:@"Fred"];
    
    NSLog(@"%@", [myPerson firstName]);
    XCTAssertEqual([myPerson firstName], @"Fred");
}

- (void)testFullNameWithoutIntrospection {
    Person *myPerson = [[Person alloc] init];
    [myPerson setFirstName:@"Fred"];
    [myPerson setLastName:@"Smith"];
    
    NSLog(@"%@", [myPerson fullName]);
}

- (void)testFullNameWithIntrospection {
    id myPerson = [Person personWithFirstName:@"Fred" lastName:@"Smith"];
    [myPerson setFirstName:@"Fred"];
    [myPerson setLastName:@"Smith"];
        
    NSLog(@"%@", [myPerson performSelector:@selector(fullName)]);
}

- (void)testDescription {
    Person *myPerson = [[Person alloc] init];
    [myPerson setFirstName:@"Fred"];
    [myPerson setLastName:@"Smith"];
    [myPerson setAge:27];
    
    NSLog(@"%@", myPerson);
}

- (void)testXYZDescription {
    XYZPerson *myPerson = [[XYZPerson alloc] init];
    
    myPerson.firstName = @"Fred";
    myPerson.lastName = @"Smith";
    myPerson.age = 27;
    
//    [myPerson setFirstName:@"Fred"];
//    [myPerson setLastName:@"Smith"];
//    [myPerson setAge:27];
    
    NSLog(@"%@", myPerson);
}

- (void)testBarking {
    id myPerson = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:27];
    Dog *rover = [[Dog alloc] init];
    [rover setName:@"Rover"];
    
    [myPerson setDog:rover];
    
    NSLog(@"%@", myPerson);
    
    [myPerson bark];
//    [myPerson stringValue];
}

- (void)testCopying {
    Person *myPerson = [Person personWithFirstName:@"Fred" lastName:@"Smith" age:27];
    NSLog(@"%@", myPerson);
    
    Person *newPerson = [myPerson copy];
    NSLog(@"%@", newPerson);
}

@end

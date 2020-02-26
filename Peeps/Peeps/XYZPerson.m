// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "XYZPerson.h"
#import "Dog.h"

@implementation XYZPerson

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName {
    return [self personWithFirstName:aFirstName lastName:aLastName age:0];
}

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName
                                age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName
                              age:(NSInteger)anAge {
    self = [super init];
    if (self == nil) return nil;
    
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    _age = anAge;
    
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"In %s", __func__);
    
    if ([self.dog respondsToSelector:aSelector]) {
        return self.dog;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

- (NSString *)fullName {
    return [[NSString alloc] initWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, age: %@", self.fullName, @(self.age)];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    XYZPerson *newPerson = [[self.class allocWithZone:zone] init];
    newPerson->_firstName = self.firstName;
    newPerson->_lastName = self.lastName;
    newPerson->_age = self.age;
    return newPerson;
}

@end

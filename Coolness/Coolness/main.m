// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>
#import "CLNAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString *appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass(CLNAppDelegate.class);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

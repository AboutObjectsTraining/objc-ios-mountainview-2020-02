// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end

@implementation CLNCoolController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    newCell.text = self.textField.text;
    newCell.backgroundColor = UIColor.systemBlueColor;
    [self.contentView addSubview:newCell];
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
//    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 200, 40)];
//
//    subview1.text = @"Hello World! 🌍🌎🌏🪐";
//    subview2.text = @"Cool View Cells Rock! 🎉🍾";
//
//    [self.contentView addSubview:subview1];
//    [self.contentView addSubview:subview2];
//
//    subview1.backgroundColor = UIColor.systemPurpleColor;
//    subview2.backgroundColor = UIColor.orangeColor;
//}

- (void)loadView1 {
    [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:self options:nil];
}

- (void)loadView2 {
    NSArray *topLevelObjs = [NSBundle.mainBundle loadNibNamed:@"CoolStuff" owner:nil options:nil];
    self.view = topLevelObjs.firstObject;
}

- (void)loadView_old {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect screenRect = UIScreen.mainScreen.bounds;
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(screenRect, &accessoryRect, &contentRect, 100, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    self.contentView = [[UIView alloc] initWithFrame:contentRect];
    self.contentView.clipsToBounds = YES;
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:self.contentView];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    self.contentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 50, 240, 35)];
    [accessoryView addSubview:self.textField];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter a label";
    
    self.textField.delegate = self;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectOffset(button.frame, 270, 50);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Cells
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 200, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(50, 120, 200, 40)];
    
    subview1.text = @"Hello World! 🌍🌎🌏🪐";
    subview2.text = @"Cool View Cells Rock! 🎉🍾";
    
    [self.contentView addSubview:subview1];
    [self.contentView addSubview:subview2];
    
    subview1.backgroundColor = UIColor.systemPurpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
}

@end

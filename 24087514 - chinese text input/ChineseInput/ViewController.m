//
//  ViewController.m
//  ChineseInput
//
//  Created by Michael Ochs on 07/01/16.
//  Copyright © 2016 HRS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.view.backgroundColor = [UIColor greenColor];
    [UIView animateWithDuration:1.0 animations:^{
        self.view.backgroundColor = [UIColor whiteColor];
    }];
    return YES;
}

@end

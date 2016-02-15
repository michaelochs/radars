//
//  ViewController.m
//  TintColorWithAlertViewBroken
//
//  Created by Michael Ochs on 15/02/16.
//  Copyright © 2016 HRS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)showAlert:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tint Color Error" message:@"After showing this alert, pushing the next screen will show a different tint color than the one that is set on the segmented controls on the current and the next screen." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:NULL]];
    [self presentViewController:alert animated:YES completion:NULL];
}

@end

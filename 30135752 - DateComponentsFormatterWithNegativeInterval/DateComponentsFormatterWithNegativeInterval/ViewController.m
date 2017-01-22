//
//  ViewController.m
//  DateComponentsFormatterWithNegativeInterval
//
//  Created by Michael Ochs on 1/22/17.
//  Copyright © 2017 PSPDFKit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDateComponentsFormatter *formatter = [NSDateComponentsFormatter new];
    formatter.allowedUnits = (NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    formatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorNone;

    NSMutableString *string = [NSMutableString new];

    for (NSTimeInterval interval = -3600.0; interval <= 3600.0; interval += 1800.0) {
        [string appendFormat:@"Interval: %g, Formatter: %@\n", interval, [formatter stringFromTimeInterval:interval]];
    }

    self.textView.text = string;
}


@end

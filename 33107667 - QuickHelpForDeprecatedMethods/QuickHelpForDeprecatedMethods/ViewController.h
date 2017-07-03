//
//  ViewController.h
//  QuickHelpForDeprecatedMethods
//
//  Created by Michael Ochs on 7/3/17.
//  Copyright © 2017 bitecode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/**
 Some documentation.

 @param arg Some argument documentation.
 */
- (void)doSomething:(id)arg __attribute__((deprecated("Foo")));

@end


//
//  ViewController.m
//  PageViewControllerCrash
//
//  Created by Michael Ochs on 11/02/16.
//  Copyright © 2016 HRS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, strong, readwrite) UIPageViewController *pageViewController;

@end


@implementation ViewController

- (IBAction)nextPage:(id)sender
{
    [self.pageViewController setViewControllers:@[ [self createViewController] ] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    return nil;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return [self createViewController];
}



#pragma mark - unrelated / helper

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self nextPage:nil];
}

- (UIViewController *)createViewController
{
    UIViewController *viewController = [UIViewController new];
    CGFloat hue = ((float)rand()/(float)RAND_MAX);
    viewController.view.backgroundColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
    return viewController;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embed"]) {
        self.pageViewController = segue.destinationViewController;
        self.pageViewController.delegate = self;
        self.pageViewController.dataSource = self;
    }
}

@end

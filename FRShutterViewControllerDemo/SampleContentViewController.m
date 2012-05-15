/*     This file is part of FRShutterViewController.
 *
 * FRShutterViewController is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FRShutterViewController is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FRShutterViewController.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  Copyright (c) 2012, Johannes Weiß <weiss@tux4u.de> for factis research GmbH.
 */

#import "SampleContentViewController.h"

#import <FRLayeredNavigationController/FRLayeredNavigation.h>

@interface SampleContentViewController ()

@property (nonatomic, readwrite, strong) UIImageView *imageView;
@property (nonatomic, readwrite, strong) UIScrollView *scrollView;

@end

@implementation SampleContentViewController

- (void)hooray
{
    NSLog(@"hooray");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)inScroll {
    return self.imageView;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"mandel" ofType:@"jpg"];
    UIImage *img = [UIImage imageWithContentsOfFile:path];
    self.imageView = [[UIImageView alloc] initWithImage:img];

    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.maximumZoomScale = 10;
    self.scrollView.minimumZoomScale = 1;
    self.scrollView.backgroundColor = [UIColor blueColor];
    self.scrollView.clipsToBounds = YES;
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.imageView];
    self.scrollView.zoomScale = .37;

    [self.view addSubview:self.scrollView];

    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 10, 400, 40)];
    [self.view addSubview:slider];
}

- (void)viewWillLayoutSubviews {
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)viewWillAppear:(BOOL)animated
{
    self.layeredNavigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                    initWithImage:[UIImage imageNamed:@"back.png"]
                                                    style:UIBarButtonItemStylePlain
                                                    target:self
                                                    action:@selector(hooray)];
    self.layeredNavigationItem.leftBarButtonItem.style = UIBarButtonItemStyleBordered;
    self.layeredNavigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                     initWithImage:[UIImage imageNamed:@"back.png"]
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:@selector(hooray)];
    self.layeredNavigationItem.rightBarButtonItem.style = UIBarButtonItemStyleBordered;
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    if (parent == nil) {
        self.scrollView.delegate = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    self.scrollView.delegate = nil;
    self.scrollView = nil;
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)sc
{
    NSLog(@"SC changed");
}

@synthesize imageView;
@synthesize scrollView;

@end

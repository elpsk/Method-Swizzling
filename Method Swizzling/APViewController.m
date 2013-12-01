//
//  APViewController.m
//  Method Swizzling
//
//  Created by alberto pasca on 29/05/13.
//  Copyright (c) 2013 albertopasca.it. All rights reserved.
//

#import "APViewController.h"


@implementation APViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
  v.backgroundColor = [UIColor redColor];
  [self.view addSubview:v];
  
  NSString *str = [NSString alloc];
  str = [str init];

  NSObject *obj = [[NSObject alloc] init];
  NSLog(@"%@", obj);
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end

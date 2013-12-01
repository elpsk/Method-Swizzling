//
//  UIViewController+Custom.m
//  Method Swizzling
//
//  Created by alberto pasca on 29/05/13.
//  Copyright (c) 2013 albertopasca.it. All rights reserved.
//

#import "UIViewController+Custom.h"


@implementation UIViewController (Custom)

+ (void)load
{
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    SEL viewWillAppearSelector      = @selector(viewWillAppear:);
    SEL tourGuideWillAppearSelector = @selector(tourGuideWillAppear:);
    
    Method originalMethod = class_getInstanceMethod(self, viewWillAppearSelector);
    Method newMethod      = class_getInstanceMethod(self, tourGuideWillAppearSelector);
    
    BOOL methodAdded = class_addMethod([self class],
                                       viewWillAppearSelector,
                                       method_getImplementation(newMethod),
                                       method_getTypeEncoding(newMethod));
    
    if (methodAdded) {
      class_replaceMethod([self class],
                          tourGuideWillAppearSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod));
    } else {
      method_exchangeImplementations(originalMethod, newMethod);
    }
  });
}


- (void)tourGuideWillAppear:(BOOL)animated
{
  NSLog(@"%s", __FUNCTION__);
}



@end



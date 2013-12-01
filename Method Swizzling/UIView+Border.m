//
//  UIView+Border.m
//  Method Swizzling
//
//  Created by alberto pasca on 29/05/13.
//  Copyright (c) 2013 albertopasca.it. All rights reserved.
//

#import "UIView+Border.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>


@implementation UIView (Border)

- (id)swizzled_initWithFrame:(CGRect)frame
{
  id result = [self swizzled_initWithFrame:frame];
  
  if ([result respondsToSelector:@selector(layer)])
  {
    CALayer *layer = [result layer];
    layer.borderWidth = 2;
    layer.borderColor = [[UIColor redColor] CGColor];
  }
  
  return result;
}

- (id)swizzled_initWithCoder:(NSCoder *)aDecoder
{
  id result = [self swizzled_initWithCoder:aDecoder];
  
  if ([result respondsToSelector:@selector(layer)])
  {
    CALayer *layer = [result layer];
    layer.borderWidth = 2;
    layer.borderColor = [[UIColor blueColor] CGColor];
  }
  
  return result;
}

+ (void)load
{
  Method original, swizzle;
  
  original = class_getInstanceMethod(self, @selector(initWithFrame:));
  swizzle  = class_getInstanceMethod(self, @selector(swizzled_initWithFrame:));
  method_exchangeImplementations(original, swizzle);
  
  original = class_getInstanceMethod(self, @selector(initWithCoder:));
  swizzle  = class_getInstanceMethod(self, @selector(swizzled_initWithCoder:));
  method_exchangeImplementations(original, swizzle);
}

@end

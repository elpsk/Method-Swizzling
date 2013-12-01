//
//  NSObject+Custom.m
//  Method Swizzling
//
//  Created by alberto pasca on 29/05/13.
//  Copyright (c) 2013 albertopasca.it. All rights reserved.
//

#import "NSObject+Custom.h"

@implementation NSObject (Custom)

+ (void)load
{
  Method original = class_getClassMethod(self, @selector(alloc));
  Method swizzle  = class_getClassMethod(self, @selector(allocCustom));

  method_exchangeImplementations(original, swizzle);
}

+ (id)allocCustom
{
  NSLog(@"%s - %@", __FUNCTION__, self);
  return [self allocCustom];
}

@end

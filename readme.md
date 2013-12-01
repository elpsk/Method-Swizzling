## Method Swizzling - Examples


Collection of method swizzling in objectivec.


- Custom ALLOC
- UIView border color
- Custom ViewWillAppear


```
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
```

More example on www.albertopasca.it/whiletrue/




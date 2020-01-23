#import "GfxIOS.h"
#include "core/core.h"

@implementation GfxIOS

- (NSString*)getHelloWorld
{
  NSString *text = @"addd";//[NSString stringWithUTF8String: helloWorld().c_str()];
  return text;
}
- (void *)clearColor
{
  
}

- (void *)showLibRender
{
  showRender();
}

@end

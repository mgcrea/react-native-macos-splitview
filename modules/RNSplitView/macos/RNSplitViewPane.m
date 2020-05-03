
#import "RNSplitViewPane.h"
#import <React/RCTView.h>

@implementation RNSplitViewPane {
  __weak RCTBridge *_bridge;
  // RCTTouchHandler *_touchHandler;
//  NSSplitView *_splitView;
}

- (instancetype)initWithBridge:(RCTBridge *)bridge {
  NSLog(@"initWithBridge");
  if (self = [super init]) {
    _bridge = bridge;
    // _touchHandler = [[RCTTouchHandler alloc] initWithBridge:bridge];
    // _splitView = [[NSSplitView alloc] initWithFrame:CGRectZero];
    // _splitView.delegate = self;
    // [self addSubview:_splitView];
  }
  return self;
}

- (id)initWithFrame:(NSRect)frameRect {
  NSLog(@"initWithFrame");
  self = [super initWithFrame:frameRect];
  //  self.delegate = self;
  return self;
}

// - (NSView *)hitTest:(NSPoint)aPoint {

//   for (NSView *subview in self.subviews) {
//     if (!subview.isHidden && [subview hitTest:aPoint])
//       return subview;
//   }
//   return [super hitTest:aPoint];
// }
;

@end

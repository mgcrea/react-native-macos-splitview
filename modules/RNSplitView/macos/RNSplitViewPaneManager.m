
#import <React/RCTLog.h>
#import <React/RCTViewManager.h>

#import "RNSplitViewPane.h"

@interface RNSplitViewPaneManager : RCTViewManager
@end

@implementation RNSplitViewPaneManager

RCT_EXPORT_MODULE(RNSplitViewPane)

// RCT_EXPORT_VIEW_PROPERTY(dividerStyle, NSUInteger)
// RCT_EXPORT_VIEW_PROPERTY(vertical, BOOL)

- (RCTPlatformView *)view {
  RNSplitViewPane *view = [[RNSplitViewPane alloc] initWithBridge:self.bridge];
  return view;
}

@end


#import <React/RCTLog.h>
#import <React/RCTViewManager.h>

#import "RNSplitView.h"

@interface RNSplitViewManager : RCTViewManager
@end

@implementation RNSplitViewManager

RCT_EXPORT_MODULE(RNSplitView)

RCT_EXPORT_VIEW_PROPERTY(dividerStyle, NSUInteger)
RCT_EXPORT_VIEW_PROPERTY(vertical, BOOL)

- (RCTPlatformView *)view {
  RNSplitView *splitView = [RNSplitView new];
  return splitView;
}

@end

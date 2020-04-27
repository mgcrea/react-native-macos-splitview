
#import <React/RCTLog.h>
#import <React/RCTViewManager.h>

#import "RNSplitView.h"

@interface RNSplitViewManager : RCTViewManager <NSSplitViewDelegate>
@end

@implementation RNSplitViewManager

RCT_EXPORT_MODULE(RNSplitView)

RCT_EXPORT_VIEW_PROPERTY(dividerStyle, NSUInteger)
RCT_EXPORT_VIEW_PROPERTY(vertical, BOOL)

- (RCTPlatformView *)view {
  RNSplitView *splitView = [RNSplitView new];
  splitView.delegate = self;
  return splitView;
}

#pragma mark NSSplitViewDelegate

- (void)splitViewDidResizeSubviews:(NSNotification *)notification {
  NSLog(@"splitViewDidResizeSubviews");
  [self setNeedsLayout];
}

- (CGFloat)splitView:(NSSplitView *)splitView
    constrainSplitPosition:(CGFloat)proposedPosition
               ofSubviewAt:(NSInteger)dividerIndex {
  NSLog(@"constrainSplitPosition %f/%ld", proposedPosition, (long)dividerIndex);
  return proposedPosition;
}

@end

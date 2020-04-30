
#import "RNSplitView.h"

@implementation RNSplitView

- (id)initWithFrame:(NSRect)frameRect {
  NSLog(@"initWithFrame");
  self = [super initWithFrame:frameRect];
  self.delegate = self;
  return self;
}

- (NSView *)hitTest:(NSPoint)aPoint {
  for (NSView *subview in self.subviews) {
    if (!subview.isHidden && [subview hitTest:aPoint])
      return subview;
  }
  return nil;
}

- (void)reactSetFrame:(CGRect)frame {
  NSLog(@"reactSetFrame");
  [self setFrame:frame];
  //  [self adjustSubviews];
}

#pragma mark - WIP

- (void)setSubviewsSizes:(CGFloat *)subviewsSizes {
  [self.subviews enumerateObjectsUsingBlock:^(NSView *subview, NSUInteger subviewIndex, BOOL *stop) {
    CGSize targetSize = NSMakeSize(100, 100);
    [subview setFrameSize:targetSize];
  }];
  //  [self layoutSubviews];
}

#pragma mark <NSSplitViewDelegate> Managing Subviews

- (void)splitView:(NSSplitView *)splitView resizeSubviewsWithOldSize:(NSSize)oldSize {
  NSLog(@"oldSize %@", oldSize)
  //  [self setNeedsDisplay:YES];
  //  [self setSubviewsSizes];
}

- (void)splitViewDidResizeSubviews:(NSNotification *)notification {
  NSLog(@"splitViewDidResizeSubviews");
}

- (void)splitViewWillResizeSubviews:(NSNotification *)notification {
  NSLog(@"splitViewWillResizeSubviews");
}

- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview {
  return NO;
}

#pragma mark <NSSplitView> Constraining Split Position

//- (CGFloat)minPossiblePositionOfDividerAtIndex:(NSInteger)dividerIndex {
//  return 0.0f;
//}

//- (CGFloat)maxPossiblePositionOfDividerAtIndex:(NSInteger)dividerIndex {
//  return 250.0f;
//}

#pragma mark <NSSplitViewDelegate> Constraining Split Position

- (CGFloat)splitView:(NSSplitView *)splitView
    constrainMinCoordinate:(CGFloat)proposedMin
               ofSubviewAt:(NSInteger)viewIndex {
  NSLog(@"constrainMinCoordinate %f/%ld", proposedMin, (long)viewIndex);
  return proposedMin;
  //  return 100.0f;
}

- (CGFloat)splitView:(NSSplitView *)splitView
    constrainMaxCoordinate:(CGFloat)proposedMax
               ofSubviewAt:(NSInteger)viewIndex {
  NSLog(@"constrainMaxCoordinate %f/%ld", proposedMax, (long)viewIndex);
  return proposedMax;
  //  return 200.0f;
}

- (CGFloat)splitView:(NSSplitView *)splitView
    constrainSplitPosition:(CGFloat)proposedPosition
               ofSubviewAt:(NSInteger)dividerIndex {
  NSLog(@"constrainSplitPosition %f/%ld", proposedPosition, (long)dividerIndex);
  return proposedPosition;
  //  return 200.0f;
}

@end


#import "RNSplitView.h"
#import <React/RCTView.h>

@implementation RNSplitView

- (id)initWithFrame:(NSRect)frameRect {
  NSLog(@"initWithFrame");
  self = [super initWithFrame:frameRect];
  self.delegate = self;
  //  self.autoresizesSubviews = YES;
  return self;
}

- (NSView *)hitTest:(NSPoint)point {
  for (NSView *subview in self.subviews) {
    if (!subview.isHidden && [subview hitTest:point])
      return subview;
  }
  return [super hitTest:point];
}

- (void)addSubview:(NSView *)view {
  NSLog(@"RNSplitView.addSubview");
  if ([view isKindOfClass:[RCTView class]]) {
    NSLog(@"RCTView!");
  }

  // [self adjustSubviews];

  // NSView *wrapper = [NSView new];
  // [wrapper addSubview:view];
  // [super addSubview:wrapper];

  [super addSubview:view];
}

#pragma mark <NSSplitViewDelegate> Managing Subviews

//- (void)splitView:(NSSplitView *)splitView resizeSubviewsWithOldSize:(NSSize)oldSize {
//  NSLog(@"oldSize width=%f,height=%f", oldSize.width, oldSize.height);
//  //  [self setNeedsDisplay:YES];
//  //  [self setSubviewsSizes];
//}

- (void)splitViewDidResizeSubviews:(NSNotification *)notification {
  NSLog(@"splitViewDidResizeSubviews");
  NSInteger i = 0;
  for (RCTView *subview in self.subviews) {
    CGPoint origin = subview.frame.origin;
    CGSize size = subview.frame.size;
    NSLog(@"frame index=%ld origin={%f,%f} size={%f, %f}", (long)i, origin.x, origin.y, size.width, size.height);
    // [subview performSelector:@selector(reactSetFrame:) withObject:[NSValue valueWithRect:subview.frame]];

    for (RCTView *grandSubview in subview.subviews) {
      // CGPoint origin = grandSubview.frame.origin;
      // CGSize size = grandSubview.frame.size;
      // NSLog(@"grandSubview frame index=%ld origin={%f,%f} size={%f, %f}", (long)i, origin.x, origin.y, size.width,
      //       size.height);
      [grandSubview setFrame:NSMakeRect(0, 0, size.width, size.height)];
      [grandSubview layoutSubviews];
      [grandSubview setNeedsDisplay];
    }
    // [subview updateLayer];
    // [subview.layer setNeedsDisplay];
    //    [subview.layer setNeedsDisplay];
    //    [subview reactSetFrame:subview.frame];
    //    NSRect nextFrame = NSMakeRect(origin.x, origin.y, size.width-100, size.height);
    //        subview.frame = nextFrame;
    //    [subview performSelector:@selector(reactSetFrame:) withObject:@(nextFrame)];
    //    [subview layoutSubviews];
    // [subview setNeedsDisplay];
    //    [subview.layer setNeedsDisplay];
    //    [subview.layer displayIfNeeded];
    //    [subview setFrame:NSMakeRect(0, 0, 800.0f, 600.0f)];
    //    if (!subview.isHidden) {
    //      [subview setFrame:NSMakeRect(0, 0, <#CGFloat w#>, <#CGFloat h#>)];
    //    }
    i++;
  }
}

- (void)splitViewWillResizeSubviews:(NSNotification *)notification {
  NSLog(@"splitViewWillResizeSubviews");
  // NSInteger i = 0;
  // for (RCTView *subview in self.subviews) {
  //   i++;
  // }
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

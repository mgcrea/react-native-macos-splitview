//
//  RNSplitViewPane.h
//  MacFileDrop
//
//  Created by Olivier Louvignes on 14/04/2020.
//

#ifndef RNSplitViewPane_h
#define RNSplitViewPane_h

#import <Cocoa/Cocoa.h>
#import <React/RCTComponent.h>
#import <React/RCTRootView.h>
#import <React/RCTView.h>

@interface RNSplitViewPane : RCTView {
  //  NSImage *image;
}

- (id)initWithFrame:(NSRect)frameRect;
- (instancetype)initWithBridge:(RCTBridge *)bridge;

//@property (retain) NSImage *image;

// @property(nonatomic, copy) RCTBubblingEventBlock onDropEntered;
// @property(nonatomic, copy) RCTBubblingEventBlock onDropExited;
// @property(nonatomic, copy) RCTBubblingEventBlock onDropPerformed;

@end

#endif /* RNSplitViewPane_h */

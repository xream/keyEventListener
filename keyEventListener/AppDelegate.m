//
//  AppDelegate.m
//  keyEventListener
//
//  Created by xream on 16/8/19.
//  Copyright © 2016年 xream. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSDictionary* opts = @{(__bridge id)kAXTrustedCheckOptionPrompt: @YES};
    if (!AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)opts)) {
        NSString *urlString = @"x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility";
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urlString]];
    }

    [NSEvent addGlobalMonitorForEventsMatchingMask:(NSKeyDownMask | NSKeyUpMask | NSFlagsChangedMask) handler:^(NSEvent *e) {
        NSLog(@"%@", e);
    }];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

@end
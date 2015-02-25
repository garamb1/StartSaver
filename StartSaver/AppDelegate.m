//
//  AppDelegate.m
//  StartSaver
//
//  Created by Vincenzo Garambone on 23/07/14.
//  Copyright (c) 2014 Vincenzo Garambone. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

    NSStatusItem *statusItem;
    NSMenu *theMenu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSMenuItem *tItem = nil;
    
    theMenu = [[NSMenu alloc] initWithTitle:@""];
    [theMenu setAutoenablesItems:NO];

    [theMenu addItemWithTitle:@"Screen Saver" action:@selector(startScreenSaver) keyEquivalent:@""];
    [theMenu addItemWithTitle:@"Lock Screen" action:@selector(lockScreen) keyEquivalent:@""];
    
    [theMenu addItem:[NSMenuItem separatorItem]];
    
    tItem = [theMenu addItemWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
    [tItem setKeyEquivalentModifierMask:NSCommandKeyMask];
    
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    statusItem = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setImage:[NSImage imageNamed:@"Icon.png"]];
    [statusItem setToolTip:@"Start Saver"];
    [statusItem setHighlightMode:YES];
    [statusItem setMenu:theMenu];


}


-(void)startScreenSaver{
    NSError *error = nil;
    NSURL *resourceURL = [[NSBundle mainBundle] resourceURL];
    NSURL *urlOfScript = [resourceURL URLByAppendingPathComponent: @"saver.scpt"];
    NSAppleScript *script = [[NSAppleScript alloc] initWithContentsOfURL: urlOfScript error: nil];
    
    if(script == nil)
    {
        NSLog( @"Non ho trovato lo script a %@ - %@", [urlOfScript absoluteURL], [error localizedDescription] );
    }
    
    [script executeAndReturnError:nil];
}

-(void)lockScreen {
    NSError *error = nil;
    NSURL *resourceURL = [[NSBundle mainBundle] resourceURL];
    NSURL *urlOfScript = [resourceURL URLByAppendingPathComponent: @"lock.scpt"];
    NSAppleScript *script = [[NSAppleScript alloc] initWithContentsOfURL: urlOfScript error: nil];
    
    if(script == nil)
    {
        NSLog( @"Non ho trovato lo script a %@ - %@", [urlOfScript absoluteURL], [error localizedDescription] );
    }
    
    [script executeAndReturnError:nil];
    
}



@end

/*
 * Media Play/Pause Control
 * 
 * This is a standalone command-line tool based on Hammerspoon's implementation
 * Language: Objective-C with Core Graphics C API
 * 
 * Simulates pressing the Play/Pause media key
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <ApplicationServices/ApplicationServices.h>

// Media key codes from IOKit/hidsystem/ev_keymap.h
#define NX_KEYTYPE_PLAY 16

/*
 * Posts a system key event (media key)
 * 
 * Uses the same approach as Hammerspoon's newSystemKeyEvent
 */
void postMediaKey(int keyCode, BOOL isKeyDown) {
    // Create NSEvent for system-defined media key
    // Subtype 8 = media keys
    // data1 encodes: ((keyCode << 16) | (isKeyDown ? 0xa00 : 0xb00))
    NSEvent* event = [NSEvent otherEventWithType:NSEventTypeSystemDefined
                                        location:NSZeroPoint
                                   modifierFlags:0
                                       timestamp:0
                                    windowNumber:0
                                         context:nil
                                         subtype:8
                                           data1:((keyCode << 16) | (isKeyDown ? 0xa00 : 0xb00))
                                           data2:-1];
    
    if (event) {
        // Convert to CGEvent and post to system
        CGEventRef cgEvent = [event CGEvent];
        if (cgEvent) {
            CGEventPost(kCGHIDEventTap, cgEvent);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Send play/pause key press (down then up)
        postMediaKey(NX_KEYTYPE_PLAY, YES);  // Key down
        postMediaKey(NX_KEYTYPE_PLAY, NO);   // Key up
        
        // Small delay to ensure both events are processed
        usleep(10000); // 10ms
    }
    return 0;
}


/*
 * Media Volume Down Control
 * Based on Hammerspoon's implementation
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <ApplicationServices/ApplicationServices.h>

#define NX_KEYTYPE_SOUND_DOWN 1

void postMediaKey(int keyCode, BOOL isKeyDown) {
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
        CGEventRef cgEvent = [event CGEvent];
        if (cgEvent) {
            CGEventPost(kCGHIDEventTap, cgEvent);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        postMediaKey(NX_KEYTYPE_SOUND_DOWN, YES);
        postMediaKey(NX_KEYTYPE_SOUND_DOWN, NO);
        usleep(10000);
    }
    return 0;
}


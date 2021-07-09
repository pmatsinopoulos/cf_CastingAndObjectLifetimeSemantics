//
//  main.m
//  CastingAndObjectLifetimeSemantics
//
//  Created by Panayotis Matsinopoulos on 9/7/21.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLocale *pGbNSLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    CFLocaleRef rfGbCFLocale = (__bridge CFLocaleRef)pGbNSLocale; // transfers a pointer from Objective-C to CF without transfer of ownership
    
    CFStringRef cfIdentifier = CFLocaleGetIdentifier(rfGbCFLocale);
    NSLog(@"cfIdentifier: %@", (__bridge NSString *)cfIdentifier);
    
    CFLocaleRef myLocaleRef = CFLocaleCopyCurrent();
    NSLocale *myNSLocale = (NSLocale *)CFBridgingRelease(myLocaleRef);
    
    NSString *pnsIdentifier = [myNSLocale localeIdentifier];
    CFShow((CFStringRef)[@"nsIdentifier: " stringByAppendingString:pnsIdentifier]);
  }
  return 0;
}

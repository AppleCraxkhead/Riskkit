#import <UIKit/UIKit.h>

%hook RDKLink
-(bool)isNSFW {
    return NO;
}
%end

%hook RDKLink
-(bool)isSpoiler {
    return NO;
}
%end


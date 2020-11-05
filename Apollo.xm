#import <UIKit/UIKit.h>

%hook RDKLink
-(bool)isNSFW {
    return 0;
}
%end

%hook RDKLink
-(void)setNSFW:(bool)arg1 {
    return %orig;
}
%end

%hook RDKLink
-(bool)isSpoiler {
    return 0;
}
%end

%hook RDKClient
-(id)unmarkNSFW:(id)arg1 completion:(id)arg2 {
    return %orig;
}
%end
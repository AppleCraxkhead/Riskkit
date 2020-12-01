#import <UIKit/UIKit.h>

%hook ParallaxHeaderView
-(void)setShowNSFWPlaceholders:(bool)arg1 {
    arg1 = NO;
    return %orig;
}
%end

%hook ParallaxHeaderView
-(bool)showNSFWPlaceholders {
    return NO;
}
%end

%hook AccountSettings
-(bool)hasSeenChatNSFWPrompt {
    return YES;
}
%end

%hook AccountSettings
-(void)setHasSeenChatNSFWPrompt:(bool)arg1 {
    return %orig;
}
%end

%hook ChatSubredditCollectionViewCell
-(bool)shouldHideNSFWThumbnail {
    return YES;
}
%end

%hook TheatreMediaItem
-(bool)isNSFW {
    return NO;
}
%end

%hook TheatreMediaItem
-(void)setIsNSFW:(bool)arg1 {
    arg1 = NO;
    return %orig;
}
%end

%hook TheatreMediaItem
-(bool)isSpoiler {
    return NO;
}
%end

%hook FeedPostOptions
-(bool)shouldAlwaysShowSpoilerContent {
    return YES;
}
%end

%hook FeedPostOptions
-(void)setShouldAlwaysShowSpoilerContent:(bool)arg1 {
    arg1 = YES;
    return %orig;
}
%end

%hook ContentVideoView
-(id)blurEffectView {
    return NULL;
}
%end

%hook ContentVideoView
-(bool)shouldBlurPreview {
    return NO;
}
%end

%hook FeedPostThumbnailNode
-(bool)blurImage {
    return NO;
}
%end

%hook FeedPostThumbnailNode
-(void)setBlurImage:(bool)arg1 {
    arg1 = YES;
    return %orig;
}
%end

%hook FeedPostOptions
-(bool)hasManuallyUnblurred {
    return %orig;
}
%end


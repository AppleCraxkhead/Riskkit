#import <UIKit/UIKit.h>

%hook ParallaxHeaderView
-(id)nsfwLogoLabel {
    return %orig;
}
%end

%hook ParallaxHeaderView
-(void)setShowNSFWPlaceholders:(bool)arg1 {
    arg1 = 0;
    return %orig;
}
%end

%hook ParallaxHeaderView
-(bool)showNSFWPlaceholders {
    return 0;
}
%end

%hook AccountSettings
-(bool)hasSeenChatNSFWPrompt {
    return 1;
}
%end

%hook AccountSettings
-(bool)hasUserAcceptedNSFWFor:(id)arg1 {
    return 1;
}
%end

%hook AccountSettings
-(void)setHasSeenChatNSFWPrompt:(bool)arg1 {
    arg1 = 1;
    return %orig;
}
%end

%hook ChatSubredditCollectionViewCell
-(bool)shouldHideNSFWThumbnail {
    return 1;
}
%end

%hook TheatreMediaItem
-(bool)isNSFW {
    return 0;
}
%end

%hook TheatreMediaItem
-(void)setIsNSFW:(bool)arg1 {
    arg1 = 0;
    return %orig;
}
%end

%hook TheatreMediaItem
-(bool)isSpoiler {
    return 0;
}
%end

%hook TheatreMediaItem
-(void)setIsSpoiler:(bool)arg1 {
}
%end

%hook FeedPostOptions
-(bool)shouldAlwaysShowSpoilerContent {
    return 1;
}
%end

%hook FeedPostOptions
-(void)setShouldAlwaysShowSpoilerContent:(bool)arg1 {
    arg1 = 1;
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
    return 0;
}
%end

%hook ContentVideoView
-(void)setShouldBlurPreview:(bool)arg1 {
    return %orig;
}
%end

%hook TheatreFeedPostView
-(void)setShouldBlurImage:(bool)arg1 {
}
%end

%hook TheatreFeedPostView
-(bool)shouldBlurImage {
    return %orig;
}
%end

%hook FeedPostThumbnailNode
-(bool)blurImage {
    return 0;
}
%end

%hook FeedPostThumbnailNode
-(void)setBlurImage:(bool)arg1 {
    arg1 = 0;
    return %orig;
}
%end

%hook FeedPostOptions
-(bool)hasManuallyUnblurred {
    return 1;
}
%end


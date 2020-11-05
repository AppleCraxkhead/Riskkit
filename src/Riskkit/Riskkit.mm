#import "Riskkit.h"

#pragma mark Statics

static BOOL isEnabled;
static NSString *nsNotificationString = @"com.applecraxkhead.riskkit/prefs.changed";
static NSString *nsDomainString = @"com.applecraxkhead.riskkit";

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
    NSNumber *e = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"isEnabled" inDomain:nsDomainString];
    isEnabled = (e)? [e boolValue]:YES;
}

#pragma mark Hooks

%group Apollo

%hook RDKLink

-(BOOL)isNSFW
{
    return 0;
}

%end

%hook RDKLink

-(void)setNSFW:(BOOL)arg1
{
    return %orig;
}

%end

%hook RDKLink

-(BOOL)isSpoiler
{
    return 0;
}

%end

%hook RDKClient

-(id)unmarkNSFW:(id)arg1 completion:(id)arg2
{
    return %orig;
}

%end

%end

%group Reddit

%hook ParallaxHeaderView

-(void)setShowNSFWPlaceholders:(BOOL)arg1
{
    arg1 = 0;
    return %orig;
}

%end

%hook ParallaxHeaderView

-(BOOL)showNSFWPlaceholders
{
    return 0;
}

%end

%hook AccountSettings

-(BOOL)hasSeenChatNSFWPrompt
{
    return 1;
}

%end

%hook AccountSettings

-(BOOL)hasUserAcceptedNSFWFor:(id)arg1
{
    return 1;
}

%end

%hook AccountSettings

-(void)setHasSeenChatNSFWPrompt:(BOOL)arg1
{
    arg1 = 1;
    return %orig;
}

%end

%hook ChatSubredditCollectionViewCell

-(BOOL)shouldHideNSFWThumbnail
{
    return 1;
}

%end

%hook TheatreMediaItem

-(BOOL)isNSFW
{
    return 0;
}

%end

%hook TheatreMediaItem

-(void)setIsNSFW:(BOOL)arg1
{
    arg1 = 0;
    return %orig;
}

%end

%hook TheatreMediaItem

-(BOOL)isSpoiler
{
    return 0;
}

%end

%hook FeedPostOptions

-(BOOL)shouldAlwaysShowSpoilerContent
{
    return 1;
}

%end

%hook FeedPostOptions

-(void)setShouldAlwaysShowSpoilerContent:(BOOL)arg1
{
    arg1 = 1;
    return %orig;
}

%end

%hook ContentVideoView

-(id)blurEffectView
{
    return NULL;
}

%end

%hook ContentVideoView

-(BOOL)shouldBlurPreview
{
    return 0;
}

%end

%hook TheatreFeedPostView

-(BOOL)shouldBlurImage
{
    return %orig;
}

%end

%hook FeedPostThumbnailNode

-(BOOL)blurImage
{
    return 0;
}

%end

%hook FeedPostThumbnailNode

-(void)setBlurImage:(BOOL)arg1
{
    arg1 = 0;
    return %orig;
}

%end

%hook FeedPostOptions

-(BOOL)hasManuallyUnblurred
{
    return 1;
}

%end

%end

#pragma mark Constructor/Initialization

%ctor
{
    if([NSBundle.mainBundle.bundleIdentifier isEqualToString:@"com.christianselig.Apollo"])
    {
        NSLog(@"Riskkit: Injected into Apollo, initializing Apollo hooks...");
        %init(Apollo)
        NSLog(@"Riskkit: Done initializing Apollo hooks!");
    }
    if([NSBundle.mainBundle.bundleIdentifier isEqualToString:@"com.reddit.Reddit"])
    {
        NSLog(@"Riskkit: Injected into Reddit, initializing Reddit hooks...");
        %init(Reddit)
        NSLog(@"Riskkit: Done initializing Reddit hooks!");
    }
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
}
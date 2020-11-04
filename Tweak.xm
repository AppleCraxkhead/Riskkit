%hook TheatreMediaItem
-(bool)isNSFW {
  return NO;
}
-(bool)isSpoiler {
  return NO;
}
%end


%hook FeedPostOptions
-(bool)shouldAlwaysShowSpoilerContent {
  return YES;
}
-(bool)hasManuallyUnblurred {
  return YES;
}
%end
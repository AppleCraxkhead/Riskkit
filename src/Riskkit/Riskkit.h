#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else 
#define NSLog(...) (void)0
#endif

@interface NSUserDefaults (Riskkit)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end
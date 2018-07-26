/// ABBYY® Real-Time Recognition SDK 1 © 2016 ABBYY Production LLC.
/// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

#import <Foundation/Foundation.h>

/// Extended service configuration settings. Settings for advanced using. Not used in typical scenarios.
@interface RTRExtendedSettings : NSObject

/// The number of threads, zero if the number should be determined automatically (default is zero).
@property (nonatomic, assign) NSInteger processingThreadsCount;

@end

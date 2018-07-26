/// ABBYY® Real-Time Recognition SDK 1 © 2016 ABBYY Production LLC.
/// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

#import <Foundation/Foundation.h>

@protocol RTRCoreAPI;

#pragma mark - RTREngine

/**
 * The main ABBYY Real-Time Recognition SDK class which serves to initialize the library
 * and create a background recognition service.
 */
@interface RTREngine : NSObject

/**
 * Creates (or returns) the RTREngine object. Repeated calls to this method will result in the same object instance.
 *
 * @param licenseData The license data to initialize ABBYY RTR SDK.
 *
 * @return The RTREngine object or nil on failure.
 */
+ (instancetype)sharedEngineWithLicenseData:(NSData*)licenseData;

- (instancetype)init __unavailable;

/**
 * Creates a core API object, which provides access to low-level single image processing functions for the current thread.
 *
 * @return An object that conforms to RTRCoreAPI protocol.
 */
- (id<RTRCoreAPI>)createCoreAPI;

@end

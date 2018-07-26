/// ABBYY® Mobile Imaging SDK II © 2018 ABBYY Production LLC.
/// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

#pragma mark -

#import <Foundation/Foundation.h>

/**
 * Output stream protocol.
 */
@protocol RTROutputStream
@required

/** Write the provided 'data' to the receiver. */
- (BOOL)writeData:(NSData*)data;

@end

#pragma mark -

/** An initialized output stream that will write stream data to memory. */
@interface RTRMemoryOutputStream : NSObject <RTROutputStream>

/** Access to the contents of the memory stream. */
@property (nonatomic, strong, readonly) NSData* data;

@end

#pragma mark -

/** An initialized output stream for writing to a specified file. */
@interface RTRFileOutputStream : NSObject <RTROutputStream>

/** The path to the file the output stream will write to. */
@property (nonatomic, copy, readonly) NSString* filePath;

/** Error occured, equals to nil on success. */
@property (nonatomic, copy, readonly) NSError* error;

/** Returns an initialized output stream for writing to a specified 'filePath'. */
- (instancetype)initWithFilePath:(NSString*)filePath;

@end

#pragma mark -

/** An initialized output stream for writing to a specified 'stream'. */
@interface RTROutputStream : NSObject <RTROutputStream>

/** The outputStream the receiver will write to. */
@property (nonatomic, strong, readonly) NSOutputStream* outputStream;

/** Error occured, equals to nil on success. */
@property (nonatomic, copy, readonly) NSError* error;

/**
 * Returns an initialized output stream for writing to a specified 'outputStream'.
 * The 'outputStream' must be opened before using.
 */
- (instancetype)initWithOutputStream:(NSOutputStream*)outputStream;

@end

/// ABBYY® Mobile Imaging SDK II © 2018 ABBYY Production LLC.
/// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

#import "RTREngine.h"
#import "RTRRecognitionService.h"
#import "RTRRecognitionServiceDelegate.h"

@class RTRExtendedSettings;
@class RTRImageCaptureStatus;
@class RTRImageCaptureResult;
@class RTRQualityAssessmentForOCRBlock;

@protocol RTRImageCaptureService;
@protocol RTRImageCaptureServiceDelegate;

#pragma mark -

@interface RTREngine (MobileImaging)

/**
 * Creates a background image capture service configured with default settings.
 *
 * @param delegate The delegate object used to interact with the service.
 *
 * @return Image capture service that conforms to RTRImageCaptureService protocol.
 */
- (id<RTRImageCaptureService>)createImageCaptureServiceWithDelegate:(id<RTRImageCaptureServiceDelegate>)delegate;

/**
 * Creates a background image capture service.
 *
 * @param delegate The delegate object used to interact with the service.
 * @param settings The settings used to configure the service.
 *
 * @return Image capture service that conforms to RTRImageCaptureService protocol.
 */
- (id<RTRImageCaptureService>)createImageCaptureServiceWithDelegate:(id<RTRImageCaptureServiceDelegate>)delegate settings:(RTRExtendedSettings*)settings;

@end

#pragma mark -

/**
 * An image capture service protocol.
 */
@protocol RTRImageCaptureService <RTRRecognitionService>
@required

/**
 * Sets the physical size of the document to be captured.
 * If the physical size of the document being captured is known, setting this parameter will
 * help to improve document boundary detection accuracy. Will allow to detect document orientation during capture.
 * Will preserve aspect ratio after crop. Will allow to automatically calculate image resolution before export.
 *
 * @param size The size of the document in millimeters.
 */
- (void)setDocumentSize:(CGSize)size;

@end

/**
 * A callback interface to interact with the image capture service: input the data and obtain the results.
 */
@protocol RTRImageCaptureServiceDelegate <RTRRecognitionServiceDelegate>
@required

/**
 * Delivers the feedback and result of image capture.
 *
 * @param status
 * 		The current status of capture (for UI feedback).
 *
 * @param result
 * 		Result of the capture - status of the best buffer (nullable).
 */
- (void)onBufferProcessedWithStatus:(RTRImageCaptureStatus*)status result:(RTRImageCaptureResult*)result;

@end

#pragma mark -

/** The current status of the capture, for UI feedback. */
@interface RTRImageCaptureStatus : NSObject

/** The motion vector. */
@property (nonatomic, assign, readonly) CGVector motionVector;
/** The relative buffer quality. */
@property (nonatomic, assign, readonly) NSInteger relativeQuality;
/** The document boundary. The array of CGPoint-based values. */
@property (nonatomic, strong, readonly) NSArray<NSValue*>* documentBoundary;
/** The quality assesment blocks. */
@property (nonatomic, strong, readonly) NSArray<RTRQualityAssessmentForOCRBlock*>* qualityAssessmentForOCRBlocks;

- (instancetype)init __unavailable;

@end

#pragma mark -

/** The result of the capture. */
@interface RTRImageCaptureResult : NSObject

/** The captured image. */
@property (nonatomic, strong, readonly) UIImage* image;

/** The document boundary. The array of CGPoint-based values. */
@property (nonatomic, strong, readonly) NSArray<NSValue*>* documentBoundary;
/** The document size (as specified in setDocumentSize:). */
@property (nonatomic, assign, readonly) CGSize documentSize;
/** The quality assesment blocks. */
@property (nonatomic, strong, readonly) NSArray<RTRQualityAssessmentForOCRBlock*>* qualityAssessmentForOCRBlocks;

- (instancetype)init __unavailable;

@end

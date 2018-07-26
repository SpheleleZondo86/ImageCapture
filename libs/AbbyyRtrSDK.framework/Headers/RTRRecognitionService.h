/// ABBYY® Real-Time Recognition SDK 1 © 2016 ABBYY Production LLC.
/// ABBYY is either a registered trademark or a trademark of ABBYY Software Ltd.

#import <AVFoundation/AVFoundation.h>

#pragma mark - RTRRecognitionService

/**
 * A background recognition service.
 */
@protocol RTRRecognitionService
@required

/**
 * Adds sample buffer for processing.
 *
 * @param sampleBuffer
 *      The buffer received from the camera in -captureOutput:didOutputSampleBuffer:fromConnection: callback method
 *      of AVCaptureVideoDataOutputSampleBufferDelegate object.
 *      Only kCVPixelFormatType_32BGRA pixel format is currently supported.
 *      Preferred session preset is AVCaptureSessionPreset1280x720.
 */
- (void)addSampleBuffer:(CMSampleBufferRef)sampleBuffer;

/**
 * Stops processing tasks, clears internal buffer container.
 */
- (void)stopTasks;

/**
 * Sets the area on the frame where the text is to be found.
 *
 * By default, no area of interest is selected.
 * The size of the area of interest affects performance and the speed of
 * convergence of the result. The best result is achieved when the area of interest does not
 * touch the boundaries of the frame but has a margin of at least half the size of a typical
 * printed character.
 *
 * @param areaOfInterest The rectangle specifying the area of interest in image coordinates. Pass CGRectZero for default value.
 */
- (void)setAreaOfInterest:(CGRect)areaOfInterest;

@end

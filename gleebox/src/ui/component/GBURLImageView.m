//
//  GBURLImageView.m
//  gleebox
//
//  Created by tom on 12/23/12.
//  Copyright (c) 2012 tom. All rights reserved.
//

#import "GBURLImageView.h"
@interface GBURLImageView () <NSURLConnectionDelegate>
@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) NSURLConnection *imageConnection;
@end

@implementation GBURLImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame url:(NSString *)url {
    self = [super initWithFrame:frame];
    if (self) {
        self.activeDownload = [NSMutableData data];
        // alloc+init and start an NSURLConnection; release on completion/failure
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:
                                 [NSURLRequest requestWithURL:
                                  [NSURL URLWithString:url]] delegate:self];
        self.imageConnection = conn;
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.activeDownload appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Clear the activeDownload property to allow later attempts
    self.activeDownload = nil;
    
    // Release the connection now that it's finished
    self.imageConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Set appIcon and clear temporary data/image
    UIImage *image = [[UIImage alloc] initWithData:self.activeDownload];
    
    if (image.size.width != self.frame.size.width || image.size.height != self.frame.size.height)
    {
        CGSize itemSize = self.frame.size;
        float cropW = image.size.width;
        float cropH = image.size.height;
        if (cropW > cropH) {
            cropW = cropH;
        } else {
            cropH = cropW;
        }
        CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, 0, cropW, cropH));

        UIGraphicsBeginImageContext(itemSize);
        UIImage *cropped = [UIImage imageWithCGImage:imageRef];
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [cropped drawInRect:imageRect];
        self.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    else
    {
        self.image = image;
    }
    
    self.activeDownload = nil;
    
    // Release the connection now that it's finished
    self.imageConnection = nil;
    
    // call our delegate and tell it that our icon is ready for display
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

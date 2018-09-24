//
//  FlickrAPIClient.h
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Photo.h"

@interface FlickrAPIClient : NSObject

+ (void)getPhotos:(void(^)(NSError *error, NSArray <Photo *> *photos))completion;
+ (void)fetchImage:(Photo*)photo completionHandler:(void(^)(NSError *error, UIImage *image))completion;

@end

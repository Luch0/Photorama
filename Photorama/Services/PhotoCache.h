//
//  PhotoCache.h
//  Photorama
//
//  Created by Luis Calle on 9/3/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoCache : NSObject

@property (nonatomic) NSCache *sharedPhotoCache;

+ (instancetype)sharedManager;

- (void)setPhoto:(UIImage*)image forKey:(NSString*)key;
- (UIImage*)photoForKey:(NSString*)key;

@end

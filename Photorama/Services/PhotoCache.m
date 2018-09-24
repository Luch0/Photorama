//
//  PhotoCache.m
//  Photorama
//
//  Created by Luis Calle on 9/3/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "PhotoCache.h"

@implementation PhotoCache

+ (instancetype)sharedManager {
    static PhotoCache *photoCache;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        photoCache = [[PhotoCache alloc] init];
    });
    return photoCache;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _sharedPhotoCache = [[NSCache alloc] init];
    }
    return self;
}

- (void)setPhoto:(UIImage*)image forKey:(NSString*)key {
    [_sharedPhotoCache setObject:image forKey:key];
}

- (UIImage*)photoForKey:(NSString*)key {
    UIImage *cachedImage = [_sharedPhotoCache objectForKey:key];
    return cachedImage;
}

@end

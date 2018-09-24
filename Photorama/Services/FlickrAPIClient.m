//
//  FlickrAPIClient.m
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "FlickrAPIClient.h"
#import "NetworkService.h"

@implementation FlickrAPIClient

+ (void)getPhotos:(void(^)(NSError *error, NSArray <Photo *> *photos))completion {
    //NSString *endpoint = @"https://api.flickr.com/services/rest/?method=flickr.interestingness.getlist&api_key=a6d819499131071f158fd740860a5a88&extras=url_h,date_taken&format=json&nojsoncallback=1";
    NSString *endpoint = @"https://api.flickr.com/services/rest/?method=flickr.interestingness.getlist&api_key=a6d819499131071f158fd740860a5a88&extras=url_h,date_taken&format=json&nojsoncallback=1&per_page=50";
    NSURL *url = [NSURL URLWithString:endpoint];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NetworkService sharedManager] performRequestWith:request completionHandler:^(NSError *error, NSData *data) {
        if (error) {
            completion(error, nil);
        } else {
            if (data) {
                NSMutableArray <Photo *> *photos = [[NSMutableArray alloc] init];
                NSDictionary *jsonObjects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                //NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                //NSLog(@"%@", jsonString);
                NSDictionary *jsonPhotos = jsonObjects[@"photos"];
                NSDictionary *jsonPhoto = jsonPhotos[@"photo"];
                if (error) {
                    completion(error, nil);
                } else {
                    for (NSDictionary *dict in jsonPhoto) {
                        Photo *photo = [[Photo alloc] initWithDict:dict];
                        [photos addObject:photo];
                    }
                    completion(nil, photos);
                }
            } else {
                completion(error, nil);
            }
        }
    }];
}

+ (void)fetchImage:(Photo*)photo completionHandler:(void(^)(NSError *error, UIImage *image))completion {
    NSURL *url = [[NSURL alloc] initWithString:photo.remoteURL];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [[NetworkService sharedManager] performRequestWith:urlRequest completionHandler:^(NSError *error, NSData *data) {
        if (error) {
            completion(error, nil);
        } else {
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                completion(nil, image);
            }
        }
    }];
}

@end

//
//  NetworkService.m
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "NetworkService.h"

@interface NetworkService ()

@property (nonatomic) NSURLSession *urlSession;

@end


@implementation NetworkService

+ (instancetype)sharedManager {
    static NetworkService *networkService;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        networkService = [[NetworkService alloc] init];
    });
    return networkService;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _urlSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    }
    return self;
}

- (void)performRequestWith:(NSURLRequest *)request completionHandler:(void (^)(NSError *, NSData *))completion {
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                completion(error, nil);
            } else {
                completion(nil, data);
            }
        });
    }];
    [dataTask resume];
}


@end

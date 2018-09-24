//
//  NetworkService.h
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkService : NSObject

+ (instancetype)sharedManager;

- (void)performRequestWith:(NSURLRequest *)request completionHandler:(void(^)(NSError *error, NSData *data))completion;

@end

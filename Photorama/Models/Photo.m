//
//  Photo.m
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        if (dict[@"id"])
            _photoID = dict[@"id"];
        if (dict[@"title"])
            _title = dict[@"title"];
        if (dict[@"datetaken"])
            _dateTaken = dict[@"datetaken"];
        if (dict[@"url_h"])
            _remoteURL = dict[@"url_h"];
    }
    return self;
}

@end

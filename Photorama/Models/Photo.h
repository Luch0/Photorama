//
//  Photo.h
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property NSString *title;
@property NSString *remoteURL;
@property NSString *photoID;
@property NSDate *dateTaken;

- (instancetype)initWithDict:(NSDictionary*) dict;

@end

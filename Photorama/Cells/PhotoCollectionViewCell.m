//
//  PhotoCollectionViewCell.m
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "FlickrAPIClient.h"
#import "PhotoCache.h"

@implementation PhotoCollectionViewCell
/*
// with fixed flickering
- (void) configureCell:(Photo*)photo {
    _theID = photo.photoID; //used for flickering fix
    _photoImageView.image = nil;
    [self showAndStartSpinnerAnimation];
    
    UIImage *cachedImage = [[PhotoCache sharedManager] photoForKey:photo.photoID];
    if (cachedImage) {
        [self hideAndStopSpinnerAnimation];
        _photoImageView.image = cachedImage;
    } else {
        if (photo.remoteURL) {
            [FlickrAPIClient fetchImage:photo completionHandler:^(NSError *error, UIImage *image) {
                if (error) {
                    NSLog(@"Error fetching image");
                } else {
                    if (photo.photoID == self->_theID) {
                        [self hideAndStopSpinnerAnimation];
                        self->_photoImageView.image = image;
                        [self setNeedsLayout];
                        [[PhotoCache sharedManager] setPhoto:image forKey:photo.photoID];
                    }
                }
            }];
        } else {
            [self hideAndStopSpinnerAnimation];
            _photoImageView.image = [UIImage imageNamed:@"noImageFound"];
        }
    }
}
*/

- (void) configureCell:(Photo*)photo {
    _photoImageView.image = nil;
    [self showAndStartSpinnerAnimation];
    
    UIImage *cachedImage = [[PhotoCache sharedManager] photoForKey:photo.photoID];
    if (cachedImage) {
        [self hideAndStopSpinnerAnimation];
        _photoImageView.image = cachedImage;
    } else {
        if (photo.remoteURL) {
            [FlickrAPIClient fetchImage:photo completionHandler:^(NSError *error, UIImage *image) {
                if (error) {
                    NSLog(@"Error fetching image");
                } else {
                    [self hideAndStopSpinnerAnimation];
                    self->_photoImageView.image = image;
                    [self setNeedsLayout];
                    [[PhotoCache sharedManager] setPhoto:image forKey:photo.photoID];
                }
            }];
        } else {
            [self hideAndStopSpinnerAnimation];
            _photoImageView.image = [UIImage imageNamed:@"noImageFound"];
        }
    }
}

- (void)hideAndStopSpinnerAnimation {
    _photoSpinner.hidden = YES;
    [ _photoSpinner stopAnimating];
}

- (void)showAndStartSpinnerAnimation {
    _photoSpinner.hidden = NO;
    [ _photoSpinner startAnimating];
}

@end

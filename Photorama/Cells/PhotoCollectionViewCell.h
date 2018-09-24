//
//  PhotoCollectionViewCell.h
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *photoSpinner;

//@property NSString *theID; //used for flickering fix

- (void) configureCell:(Photo*)photo;

@end

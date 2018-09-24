//
//  PhotosViewController.m
//  Photorama
//
//  Created by Luis Calle on 9/2/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotoCollectionViewCell.h"
#import "FlickrAPIClient.h"

@interface PhotosViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property NSArray *photos;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _photosCollectionView.delegate = self;
    _photosCollectionView.dataSource = self;
    [FlickrAPIClient getPhotos:^(NSError *error, NSArray<Photo *> *photos) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            self->_photos = photos;
            [self->_photosCollectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDataSource methods
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PhotoCollectionViewCell *photoCell = (PhotoCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo cell" forIndexPath:indexPath];
    Photo *photo = _photos[indexPath.row];
//    NSLog(@"title %@", photo.title);
//    NSLog(@"photoID %@", photo.photoID);
//    NSLog(@"remoteURL %@", photo.remoteURL);
//    NSLog(@"date %@", photo.dateTaken);
//    NSLog(@"");
    [photoCell configureCell:photo];
    return photoCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _photos.count;
}

#pragma mark - UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat numOfColumns = 4;
    CGFloat numOfSpaces = numOfColumns - 1;
    CGFloat cellSpacing = 0.3;
    CGFloat cellWidth = (screenWidth/numOfColumns) - (cellSpacing*numOfSpaces);
    return CGSizeMake(cellWidth, cellWidth);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

@end

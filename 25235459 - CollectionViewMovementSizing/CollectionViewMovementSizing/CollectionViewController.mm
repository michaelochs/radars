//
//  CollectionViewController.m
//  CollectionViewMovementSizing
//
//  Created by Michael Ochs on 3/18/16.
//  Copyright © 2016 bitecode. All rights reserved.
//

#import "CollectionViewController.h"

#import <vector>


@interface CollectionViewController () <UICollectionViewDelegateFlowLayout> {
    std::vector<CGSize> *_cellSizes;
}

@end


@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)dealloc {
    if (_cellSizes) {
        delete _cellSizes;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _cellSizes = new std::vector<CGSize>;
    _cellSizes->reserve(20);
    for (int i = 0; i < 20; i++) {
        CGSize size;
        if (i % 3 == 0) {
            size = CGSizeMake(100.0, 75.0);
        } else {
            size = CGSizeMake(75.0, 100.0);
        }
        _cellSizes->push_back(size);
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // It seems that inside this method we need to do our own mapping. Which means we need to monitore the movement via `collectionView:targetIndexPathForMoveFromItemAtIndexPath:toProposedIndexPath:`.
    return _cellSizes->at(indexPath.item);
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    CGSize size = _cellSizes->at(sourceIndexPath.item);
    _cellSizes->erase(_cellSizes->begin() + sourceIndexPath.item);
    _cellSizes->insert(_cellSizes->begin() + destinationIndexPath.item, size);

    // This fixes the layout issue at least for after the movement:
//    [collectionView.collectionViewLayout invalidateLayout];
}

@end

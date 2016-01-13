//
//  MyCollectionViewController.m
//  CollectionViewSelection
//
//  Created by Michael Ochs on 13/01/16.
//  Copyright © 2016 HRS. All rights reserved.
//

#import "MyCollectionViewController.h"

#import "MyCollectionViewCell.h"


@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImage *image;
    switch (indexPath.row) {
        case 0:
            image = [UIImage imageNamed:@"Soy"];
            break;
        case 1:
            image = [UIImage imageNamed:@"Nuts"];
            break;
        case 2:
            image = [UIImage imageNamed:@"Shellfish"];
            break;
    }
    cell.imageView.image = image;
    
    return cell;
}

@end

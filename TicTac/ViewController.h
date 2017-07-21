//
//  ViewController.h
//  TicTac
//
//  Created by Tharzeez on 7/19/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong,nonatomic) NSMutableArray * xMutArray;
@property (strong,nonatomic) NSMutableArray * oMutArray;



@end


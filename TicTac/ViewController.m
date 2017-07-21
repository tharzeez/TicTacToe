//
//  ViewController.m
//  TicTac
//
//  Created by Tharzeez on 7/19/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static  NSString  * cid=@"Cell";
int xarray[5];
int oarray[5];
UIImageView * imgView[9];
static NSInteger xo=0;
NSInteger iCount=0;
NSMutableArray *arr1,*arr2,*arr3,*arr4,*arr5,*arr6,*arr7,*arr8;
NSMutableArray *arr;


-(void)declareArray{
    
    arr=[[NSMutableArray alloc]init];

arr1=[[NSMutableArray alloc]initWithObjects:@0,@1,@2, nil];
arr2=[[NSMutableArray alloc]initWithObjects:@3,@4,@5, nil];
arr3=[[NSMutableArray alloc]initWithObjects:@6,@7,@8, nil];
arr4=[[NSMutableArray alloc]initWithObjects:@0,@3,@6, nil];
arr5=[[NSMutableArray alloc]initWithObjects:@1,@4,@7, nil];
arr6=[[NSMutableArray alloc]initWithObjects:@2,@5,@8, nil];
arr7=[[NSMutableArray alloc]initWithObjects:@0,@4,@8, nil];
arr8=[[NSMutableArray alloc]initWithObjects:@2,@4,@6, nil];
    
}



-(void)checkForX:(NSMutableArray *)xMut{
    
        for(int i= 0; i<[xMut count];i++){
        for(int j=0; j<[xMut count];j++){
            for(int k =0;k <[xMut count];k++){
                
                
                [arr addObjectsFromArray:@[ [xMut objectAtIndex:i] , [xMut objectAtIndex:j] , [xMut objectAtIndex:k]    ]];
                if( [arr isEqualToArray:arr1] ||  [arr isEqualToArray:arr2] ||  [arr isEqualToArray:arr3] ||  [arr isEqualToArray:arr4] ||  [arr isEqualToArray:arr5] ||  [arr isEqualToArray:arr6] ||  [arr isEqualToArray:arr7] ||  [arr isEqualToArray:arr8] ){
                    NSLog(@"lol found");
                    
                    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Player X Wins" message:@"Well Played" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        [self performSelector:@selector(collectionRes)];
                    }];
                    [alert addAction:ok];
                    [self presentViewController:alert animated:YES completion:nil];
                    [xMut removeAllObjects];
                    
                }
                
                
                [arr removeAllObjects];
                
            }
        }
        
    }
    
    for(NSNumber *num in xMut){
        NSLog(@"xmut %@",num);
    }
    
    
    
    
}




-(void)checkForO:(NSMutableArray*)oMut{
    
    for(int i= 0; i<[oMut count];i++){
        for(int j=0; j<[oMut count];j++){
            for(int k =0;k <[oMut count];k++){
                
                
                [arr addObjectsFromArray:@[ [oMut objectAtIndex:i] , [oMut objectAtIndex:j] , [oMut objectAtIndex:k]    ]];
                if( [arr isEqualToArray:arr1] ||  [arr isEqualToArray:arr2] ||  [arr isEqualToArray:arr3] ||  [arr isEqualToArray:arr4] ||  [arr isEqualToArray:arr5] ||  [arr isEqualToArray:arr6] ||  [arr isEqualToArray:arr7] ||  [arr isEqualToArray:arr8] ){
                    NSLog(@"lol found");
                    
                    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Player O Wins" message:@"Well Played" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        [self performSelector:@selector(collectionRes)];
                    }];
                    [alert addAction:ok];
                    [self presentViewController:alert animated:YES completion:nil];
                    [oMut removeAllObjects];
                    
                }
                
                
                [arr removeAllObjects];
                
            }
        }
        
    }

}






-(void)xarray:(NSInteger)xvalue{
    NSLog(@"%ld",(long)xvalue);
    [_xMutArray addObject:[NSNumber numberWithInteger: xvalue]];
   // NSLog(@"x count %d",[_xMutArray count]);
    for(int i =0;i<[_xMutArray count];i++){
        NSLog(@"object at xmut %@",[_xMutArray objectAtIndex:i]);
    }
    
//    [self performSelector:@selector(checkForX:)];
      [self checkForX:_xMutArray];
}

-(void)oarray:(NSInteger)ovalue{
    [_oMutArray addObject:[NSNumber numberWithInteger:ovalue]];
    [self checkForO:_oMutArray];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    _xMutArray =[[NSMutableArray alloc]init];
    _oMutArray=[[NSMutableArray alloc]init];
    
    [self declareArray];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    collectionView.allowsMultipleSelection=NO;
    
    NSInteger size=collectionView.frame.size.height;
    NSInteger width=collectionView.frame.size.width;

    NSLog(@"%ld___%ld",(long)size,(long)width);
    return 1;
    
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"clicked at %ld",(long)indexPath.row);
    UICollectionViewCell *cell =[collectionView cellForItemAtIndexPath:indexPath];
    
    
    NSInteger width= cell.frame.size.width;

    if(xo%2==0){
        
        UIImage *img1=[UIImage imageNamed:@"img2"];
        imgView[iCount]=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, width, width)];
         [imgView[iCount] setImage:img1];
        imgView[iCount].contentMode=UIViewContentModeScaleAspectFit;
        [cell addSubview:imgView[iCount]];
         
        
        [self xarray:indexPath.row];
        iCount++;
        xo++;
    }else{
        UIImage *image=[UIImage imageNamed:@"img1"];
        imgView[iCount]=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, width, width)];
        [imgView[iCount] setImage:image];
        [cell insertSubview:imgView[iCount] aboveSubview:cell];
        [self oarray:indexPath.row];
        iCount++;
        xo++;
        NSLog(@"%ld",(long)iCount);
    }
    
    //cell.backgroundColor=[UIColor redColor];
    
    
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Agaain Clicked");
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger width= collectionView.frame.size.width;
  //  NSLog(@"%d",(width-30)/3);
    
    width=(width-30)/3;
  //  NSLog(@"%d",(width-30)/3);

    return CGSizeMake(width, width);
}


-( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
    
    UICollectionViewCell *cell ;
   // [cell removeFromSuperview:imgView
    
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:cid forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor blackColor];
   
    
    
    return cell;
    
    
}



#pragma mark Collection reset


- (IBAction)collectionReset:(id)sender {
    
    NSLog(@"%ld",(long)iCount);
    for(NSInteger i=0;i<iCount;i++){
        [imgView[i] removeFromSuperview];
    }
    iCount=0;
    [_xMutArray removeAllObjects];
    [_oMutArray removeAllObjects];
    
    [self.myCollectionView reloadData];
    
}

-(void)collectionRes{
    NSLog(@"%ld",(long)iCount);
    for(NSInteger i=0;i<iCount;i++){
        [imgView[i] removeFromSuperview];
    }
    iCount=0;
    [_xMutArray removeAllObjects];
    [_oMutArray removeAllObjects];
    [self.myCollectionView reloadData];
}









@end

//
//  ViewController.m
//  QTCS
//
//  Created by Tuan EM on 4/22/13.
//  Copyright (c) 2013 Tuan EM. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    NSMutableArray* _photoArray;
    NSMutableArray* _soundArray;
    int index;
}
@end

@implementation ViewController
@synthesize scrollView,player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _photoArray = [[NSMutableArray alloc] init];
    _soundArray = [[NSMutableArray alloc] init];
    [self loadData];
    scrollView.pagingEnabled =YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*_photoArray.count, self.view.frame.size.height - 40);
    for (int i=0; i<_photoArray.count; i++) {
        UIImage* image = _photoArray[i];
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10 + i*self.view.frame.size.width, 15,self.view.frame.size.width - 20, self.view.frame.size.height - 20)];
        imageView.image = image;
        [scrollView addSubview:imageView];
    }
    [self scrollViewDidScroll:scrollView];
    player = [[AVAudioPlayer alloc] initWithData:_soundArray[0] error:nil];
    [player play];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollViews {
    static NSInteger previousPage = 0;
    CGFloat pageWidth = scrollViews.frame.size.width;
    float fractionalPage = scrollViews.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    if (previousPage != page) {
        player = [[AVAudioPlayer alloc] initWithData:_soundArray[page] error:nil];
        [player play];
        previousPage = page;
    }
}

-(void) loadData{
    for (int i=1; i<22; i++) {
        [_photoArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
        NSString* path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i] ofType:@"mp3"];
        NSData* data = [NSData dataWithContentsOfFile:path];
        [_soundArray addObject:data];
    }
    
}
-(void) playAudio{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end

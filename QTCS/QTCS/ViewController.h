//
//  ViewController.h
//  QTCS
//
//  Created by Tuan EM on 4/22/13.
//  Copyright (c) 2013 Tuan EM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) AVAudioPlayer* player;
@end

//
//  ViewController.m
//  MasonryDemo1
//
//  Created by iwind on 15/3/13.
//  Copyright (c) 2015年 MUGH. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "MMPlaceHolder.h"
#import <Masonry/Masonry.h>



#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    UIView * sv = [UIView new];
//    [sv showPlaceHolder];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
//    UIView *sv1 = [UIView new];
//    [sv1 showPlaceHolder];
//    sv1.backgroundColor = [UIColor redColor];
//    [sv addSubview: sv1];
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
//    int padding1 = 10;
//    
//    UIView * sv2 = [UIView new];
//    sv2.backgroundColor = [UIColor blueColor];
//    [sv2 showPlaceHolder];
//    [sv addSubview:sv2];
//    UIView * sv3 = [UIView new];
//    sv3.backgroundColor = [UIColor greenColor];
//    [sv3 showPlaceHolder];
//    [sv addSubview: sv3];
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(padding1);
//        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    
//    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv2.mas_right).with.offset(padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv2);
//    }];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    for (int i = 0; i <= count ; ++i) {
        UIView * subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:(arc4random()% 256 / 256.0 )saturation:(arc4random() % 128 / 256.0) + 0.5 brightness:(arc4random() % 128 /256.0) + 0.5 alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if (lastView)
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView = subv;
        
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

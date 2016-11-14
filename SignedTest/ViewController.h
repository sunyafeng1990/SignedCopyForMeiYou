//
//  ViewController.h
//  SignedTest
//
//  Created by 孙亚锋 on 16/11/14.
//  Copyright © 2016年 孙亚锋. All rights reserved.
//  联系 交流qq:781080582

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic,retain)UIImageView *headImg;
@property(nonatomic,retain)UILabel *nickLab;
@property(nonatomic,retain)UILabel *moneyLab;
@property(nonatomic,retain)UIImageView *moneyIcon;


@property(nonatomic,retain)UILabel *titleLab;
@property(nonatomic,copy) NSString *nowTime;
@property(nonatomic,copy) NSString *yesterdayTime;
@property(nonatomic,retain) NSMutableArray *totlaArr;

@property(nonatomic,retain)UILabel *dayLab;// 天数
@property(nonatomic,retain)UIImageView *img;// 三角
@end


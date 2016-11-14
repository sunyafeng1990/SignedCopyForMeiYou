//
//  ViewController.m
//  SignedTest
//
//  Created by 孙亚锋 on 16/11/14.
//  Copyright © 2016年 孙亚锋. All rights reserved.
//  联系 交流qq:781080582
//  屏幕 —— 宽度
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
//  屏幕 —— 高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"

@interface ViewController ()
{
    NSInteger _index;
}
@property(nonatomic,strong)UILabel *titleLab2;
@property(nonatomic,strong)UIImageView *huiImg;
@end

@implementation ViewController
-(UILabel*)titleLab2{
    if (!_titleLab2) {
        _titleLab2  = [[UILabel alloc]init];
        _titleLab2.font = [UIFont systemFontOfSize:14.0f];
        _titleLab2.textAlignment = NSTextAlignmentCenter;
        _titleLab2.text = [NSString stringWithFormat:@"7天"];
        [self.view addSubview:_titleLab2];
    }
    return _titleLab2;
    
}
-(UIImageView *)huiImg{
    if (!_huiImg) {
        _huiImg = [[UIImageView alloc]init];
        _huiImg.image = [UIImage imageNamed:@"灰三角"];
        [self.view addSubview:_huiImg];
    }
    return _huiImg;
}



-(UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 66, 66)];
        
        _headImg.layer.cornerRadius = 33;
        _headImg.clipsToBounds = YES;
    }
    return _headImg;
}
-(UILabel *)nickLab{
    if (!_nickLab) {
        _nickLab = [[UILabel alloc]initWithFrame:CGRectMake(86,40,150, 20)];
        _nickLab.text =@"差一点是帅哥";
       _nickLab.textAlignment = NSTextAlignmentLeft;
    }
    return _nickLab;
}
-(UIImageView *)moneyIcon{
    if (!_moneyIcon) {
        _moneyIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"签到金币"]];
        _moneyIcon.frame = CGRectMake(86, 73,14,14);
    }
    return _moneyIcon;
}
-(UILabel *)moneyLab{
    if (!_moneyLab) {
        _moneyLab = [[UILabel alloc]initWithFrame:CGRectMake(105, 70, 150, 20)];
        _moneyLab.text = @"10086金币";
        _moneyLab.textColor = [UIColor orangeColor];
        _moneyLab.textAlignment = NSTextAlignmentLeft;
        
    }
    return _moneyLab;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.title = @"签到";
    
    
    [self.view addSubview:self.headImg];
    self.headImg.image = [UIImage imageNamed:@"22222"];
    [self.view addSubview:self.nickLab];
    [self.view addSubview:self.moneyIcon];
    [self.view addSubview:self.moneyLab];
    
    
    _totlaArr = [NSMutableArray array];
    
    
    
    UIButton *singBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    singBtn.frame = CGRectMake(kScreenWidth-100, 50, 72,30);
    singBtn.layer.borderColor = [UIColor redColor].CGColor;
    singBtn.layer.borderWidth = 1;
    singBtn.layer.cornerRadius = 14;
    singBtn.clipsToBounds = YES;
    
    
    [singBtn setTitle:@"签到+1" forState:UIControlStateNormal];
    [singBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [singBtn addTarget:self action:@selector(singClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:singBtn];
    
    // 已签到天数
    _index = 0;
            
// 这里调用
   [self show];

    
}
-(void)show{
    
    // 小圆圈的直径  自适应屏幕
    CGFloat width = 33;
    // lab之间的间距 的线的宽
    CGFloat LineWidth = ((kScreenWidth - 20) - 33 *7)/6;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(10,120 + 33/2 ,kScreenWidth - 20,1.5);
    layer.backgroundColor = [[UIColor lightGrayColor] CGColor];
    [self.view.layer addSublayer:layer];

    NSInteger index;
    
    if (_index%7 == 0 && _index != 0) {
        index = 7;
    }else{
        index = _index%7;
    }
    
    NSLog(@"index   %ld",(long)index);
    
    for (int i=0; i<7; i++) {
        
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.frame =  CGRectMake(10+(width+LineWidth)*i, 120, width, width);
        
        BOOL isN = i<6 ;
        imgV.image = isN?[UIImage imageNamed:@"小圈圈+1-灰"]:[UIImage imageNamed:@"小圈圈+4--灰"];
        // 三目运算
        BOOL isR = i < index;
        if (isR) {
            if (index == 7 && i == 6) {
                imgV.image = [UIImage imageNamed:@"小圈圈+4"];
            }else{
            imgV.image = isR?[UIImage imageNamed:@"小圈圈+1"]:[UIImage imageNamed:@"小圈圈+4"];
            }
        }
       
            
        
        
        [self.view addSubview:imgV];
        [_totlaArr addObject:imgV];
     }
    [self imageShow:index];
    [self labShow:index];
    
}
//下边的小三角
-(void)imageShow:(NSInteger)index
{
    //    如果存在 做移除操作  不让其显示
    if (_img) {
        [_img removeFromSuperview];
    }
    
    BOOL isR = index > 0;
    UIImageView *imgView = isR? _totlaArr[index-1]:_totlaArr[0];
   // 三角图片
    
    CGFloat x =  imgView.frame.origin.x + imgView.frame.size.width /2 - 7.5;
    CGFloat y =  imgView.frame.origin.y + imgView.frame.size.height + 7;
    _img = [[UIImageView alloc]init];
    _img.frame = CGRectMake(x,y , 15, 8);
    
//    NSLog(@"图片三角  index  %ld",(long)index);
    
    if (index != 0) {
        _img.image = [UIImage imageNamed:@"橙三角"];
    }else{
        _img.image = [UIImage imageNamed:@"灰三角"];
    }
    
    [self.view addSubview:_img];
    
    //        最后面的小三角（如果index＝7就不让他显示  因为他是灰的）
    
    
    if (index!=7) {
        UIImageView * imageView = _totlaArr[6];
        
        CGFloat labX =  imageView.frame.origin.x + imageView.frame.size.width /2 - 7.5;
        CGFloat labY =  imageView.frame.origin.y + imageView.frame.size.height + 7;
        self.huiImg.frame =CGRectMake(labX, labY,15, 8);
        self.huiImg.hidden = NO;
    }else{
        self.huiImg .hidden = YES;
    }
}

//下边的天数
-(void)labShow:(NSInteger)index
{
 //    如果存在 做移除操作  不让其显示
    if (_dayLab) {
        [_dayLab removeFromSuperview];
    }
    
    BOOL isR = index>0;
    UIImageView *imageView = isR? _totlaArr[index-1]:_totlaArr[0];
    _dayLab = [[UILabel alloc]init];
    _dayLab.font = [UIFont systemFontOfSize:14.0f];
    _dayLab.textAlignment = NSTextAlignmentCenter;
    
    
    _dayLab.frame = CGRectMake(imageView.frame.origin.x,_img.frame.origin.y+_img.frame.size.height + 6, imageView.frame.size.width, imageView.frame.size.width-9);
    
    
    if (index!=0 ) {
        
        _dayLab.text = [NSString stringWithFormat:@"%ld天",_index];
        _dayLab.textColor = [UIColor orangeColor];
    }else{
        _dayLab.text = [NSString stringWithFormat:@"1天"];
        _dayLab.textColor = [UIColor blackColor];
    }
    [self.view addSubview:_dayLab];
    
    //最后面的天数（如果index＝7就不让他显示  因为他是灰的）
    
    
    if (index!=7 ) {
        UIImageView *imgV = _totlaArr[6];

       
        self.titleLab2.frame = CGRectMake(imgV.frame.origin.x, _img.frame.origin.y+_img.frame.size.height + 6, imgV.frame.size.width,imageView.frame.size.width-9);
        self.titleLab2.hidden =NO;
        
    }else{
        self.titleLab2.hidden =YES;
    }
    
}
#pragma mark - －－－－－－－签到按钮－－－－－－－－
-(void)singClick:(UIButton *)button
{
    
    // 签到
    _index += 1;
    
    for (UIImageView *imgV in _totlaArr) {
        [imgV removeFromSuperview];
    }
    
    [self show];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

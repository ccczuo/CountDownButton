//
//  ViewController.m
//  CountDownButton
//
//  Created by 楚晨晨 on 16/3/21.
//  Copyright © 2016年 CCC. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+countDown.h"
@interface ViewController ()
@property (nonatomic,strong)UIButton *countDownButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.countDownButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 200, 40)];
    self.countDownButton.backgroundColor = [UIColor grayColor];
    [self.countDownButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.countDownButton setTitle: @"点击获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:self.countDownButton];
    
    
    
}
- (void)buttonClick{

    [self.countDownButton startWithTime:5];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

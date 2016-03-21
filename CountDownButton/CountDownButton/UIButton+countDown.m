//
//  UIButton+countDown.m
//  CountDownButton
//
//  Created by 楚晨晨 on 16/3/21.
//  Copyright © 2016年 CCC. All rights reserved.
//

#import "UIButton+countDown.h"

@implementation UIButton (countDown)
-(void)startWithTime:(NSInteger)time{
    
    __weak typeof(self) weakSelf = self;
    //倒计时时间
  __block NSInteger timeOut = time;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0); //每秒执行
    
    
    dispatch_source_set_event_handler(_timer, ^{
        
        //在这里执行
        
        if(timeOut<=0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.backgroundColor = [UIColor blueColor];
            [weakSelf setTitle:@"重新获取验证码" forState:UIControlStateNormal];
            weakSelf.userInteractionEnabled = YES;
        });
        
        
        
        }else{
        
            int allTime = (int)timeOut + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = [UIColor grayColor];
                [weakSelf setTitle:[NSString stringWithFormat:@"%@ s",timeStr] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
        
    });
    
    dispatch_resume(_timer);
    
    




}
@end

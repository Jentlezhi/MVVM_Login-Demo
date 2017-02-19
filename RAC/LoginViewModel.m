//
//  LoginViewModel.m
//  Login Demo
//
//  Created by Juniort on 2017/2/19.
//  Copyright © 2017年 Powonder. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

/**
 *  初始化方法
 *
 *  @return self
 */
- (instancetype)init{
    if (self = [super init]) {
        [self loginViewModeBasicConfig];
    }
    return self;
}

- (void)loginViewModeBasicConfig{
    _loginEnableSignal = [RACSignal combineLatest:@[RACObserve(self,accountString),RACObserve(self,pwdString)] reduce:^id(NSString *account, NSString *pwd){
        return @(account.length && pwd.length);
    }];
    
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"正在执行命令");
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
            });
            
            return nil;
        }];
    }];
    
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        if ([x boolValue]) {
            NSLog(@"登录成功");
        }else{
            NSLog(@"登录失败");
        }
        
    }];
    
    [_loginCommand.executing subscribeNext:^(id x) {
        if ([x boolValue]) {
            [MBProgressHUD showMessage:@"正在登录ing.."];
        }else{
            [MBProgressHUD hideHUD];
        }
    }];
    
}


@end

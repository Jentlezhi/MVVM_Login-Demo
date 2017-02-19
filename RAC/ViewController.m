//
//  ViewController.m
//  Login Demo
//
//  Created by Juniort on 2017/2/19.
//  Copyright © 2017年 Powonder. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewModel.h"

@interface ViewController ()
@property (strong,nonatomic) LoginViewModel *loginViewModel;
@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewController

- (LoginViewModel *)loginViewModel{
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc] init];
    }
    return _loginViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewControllerBasicConfig];
}

- (void)viewControllerBasicConfig{
    RAC(self.loginViewModel,accountString) = _accountTF.rac_textSignal;
    RAC(self.loginViewModel,pwdString) = _pwdTF.rac_textSignal;
    RAC(_loginBtn,enabled) = self.loginViewModel.loginEnableSignal;
    
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.loginViewModel.loginCommand execute:nil];
    }];
    
    
}

@end

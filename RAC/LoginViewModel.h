//
//  LoginViewModel.h
//  Login Demo
//
//  Created by Juniort on 2017/2/19.
//  Copyright © 2017年 Powonder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (strong, nonatomic) RACSignal *loginEnableSignal;
@property (copy, nonatomic) NSString *accountString;
@property (copy, nonatomic) NSString *pwdString;
@property (strong, nonatomic) RACCommand *loginCommand;


@end

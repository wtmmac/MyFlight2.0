//
//  LoginBusiness.m
//  MyFirstApp
//
//  Created by Davidsph on 12/18/12.
//  Copyright (c) 2012 LIAN YOU. All rights reserved.
//

#import "LoginBusiness.h"
#import "LoginInNetworkHelper.h"
#import "AppConfigure.h"
@implementation LoginBusiness

//登陆
- (void) loginWithName:(NSString *)name password:(NSString *)passwd andDelegate:(id)delegate{
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc] init];
    [dic setObject:name forKey:KEY_Login_Account];
    [dic setObject:passwd forKey:KEY_Login_Pwd];
    
    [LoginInNetworkHelper requestWithUrl:dic delegate:delegate];
    
    [dic release];
    
   
    
}

//注册 密码可能要求输入确认密码
- (void) registerWithAccount:(NSString *)name password:(NSArray *)passwd andDelegate:(id<ServiceDelegate>)delegate{
    
    
    [LoginInNetworkHelper registerWithUrl:nil delegate:delegate];
    
    
}


//查询账号信息
- (void) getAccountInfo:(NSString *) info andDelegate:(id<ServiceDelegate>) delegate{
    //此处拼接URL 
    
    
    [LoginInNetworkHelper getAccountInfo:nil delegate:delegate];
    
    
    
    
}

@end

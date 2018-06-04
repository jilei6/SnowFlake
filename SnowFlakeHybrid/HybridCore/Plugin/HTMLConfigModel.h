//
//  HTMLConfigModel.h
//  TheOnePlus
//
//  Created by Jaren on 2017/12/7.
//  Copyright © 2017年 Jaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHYModel.h"
#import "DRHYModel.h"
@interface HTMLConfigModel : DRHYModel

@property (nonatomic,copy)NSString *is_update;
@property (nonatomic,copy)NSString *force_update;//是否强制更新
@property (nonatomic,copy)NSString *version; //zip版本号

@property (nonatomic,copy)NSString *current_host;//当前使用的域
@property (nonatomic,copy)NSString *zip_url;//zip包的下载链接
@property (nonatomic,copy)NSString *platform; //iOS =1 。Android=2；

@property (nonatomic,copy)NSString *appType;//平台类型
@property (nonatomic,copy)NSString *User_base_url;//当前使用的域
@property (nonatomic,copy)NSString *Bet_base_url;//当前使用的域
@property (nonatomic,copy)NSString *socketBaseUrl;//
@property (nonatomic,copy)NSString *agentUrl;//
@property (nonatomic,copy)NSString *jms_host;//
@end

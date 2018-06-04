//
//  HTMLConfigModel.m
//  TheOnePlus
//
//  Created by Jaren on 2017/12/7.
//  Copyright © 2017年 Jaren. All rights reserved. 
//

#import "HTMLConfigModel.h"
@implementation HTMLConfigModel
- (NSString *)getUrl{
    return APPVERSION_SCH;
}

- (void)parse:(id)obj{
    [super parse:obj];
    NSDictionary *dict = obj[@"data"];
    [self parData:dict];
    
    
}

- (void)parData:(NSDictionary*)dict{
    if(dict!=nil&&[dict isKindOfClass:[NSDictionary class]])
    {
        
        self.current_host = [dict[@"current_host"] description] ;
        self.zip_url = [dict[@"zip_url"] description] ;
        self.platform = [dict[@"platform"] description];
        self.appType = [dict[@"app_type"] description];
        self.is_update = [dict[@"is_update"] description] ;
        self.version = [dict[@"version"] description] ;
        self.force_update = [dict[@"force_update"] description] ;
         self.User_base_url = [dict[@"user_base_url"] description] ;
         self.Bet_base_url = [dict[@"bet_base_url"] description] ;
         self.socketBaseUrl = [dict[@"socketBaseUrl"] description] ;
         self.agentUrl = [dict[@"agent_host"] description] ;
        self.jms_host = [dict[@"jms_host"] description] ;
    }
    
}
@end

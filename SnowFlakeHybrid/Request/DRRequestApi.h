//
//  DRRequestApi.h
//  DeepCubeRobotControls
//
//  Created by zoff on 2017/6/9.
//  Copyright © 2017年 zoff. All rights reserved.
//

#ifndef DRRequestApi_h
#define DRRequestApi_h

#import "DRDeepCubeMFound.h"

#define drbaseurl2(r) [NSString stringWithFormat:@"%@/%@",@"",r]
#define api_match_ongoing_list @"api/match/ongoing_list"
#define api_app_init           @"api/app/init"   //初始化接口
#define api_match_event_list           @"api/match/event_list"   //比赛事件
#define api_barrage           @"api/barrage"   //弹幕
#define api_notice_rolling_subtitles        @"api/notice/rolling_subtitles"
#define api_team_info         @"api/team/info"                 //球队信息接口
#define api_team_squad_list   @"api/team/squad_list"           //球队球员列表
#define api_team_match_list   @"api/team/match_list"           //球队比赛列表
#define api_team_rank_leagues @"api/team/rank_leagues"         //有积分榜的赛事
#define api_squad_info        @"api/squad/info"                //球员基本信息
#define api_team_rank         @"api/team/rank"                 //联赛积分榜
#define api_user_login        @"api/user/login"                //用户登录
#define api_squad_data        @"api/squad/data"                //球员数据
#define api_feedback_insert   @"api/feedback/insert"          //用户反馈
#define api_app_welcome       @"api/app/welcome"               //欢迎接口
#define api_match_has_ongoing @"api/match/has_ongoing"         //是否有进行中的比赛
#define api_match_wonderful   @"api/match/wonderful"           //精选比赛

#define api_app_version       @"api/app/update"               //版本更新


#define api_match_live_url    @"api/match/live_url"            //BR动画地址接口
#define api_hall_hint         @"api/hall/hint"
#define api_match_event_msg  @"api/match/event_msg"

#pragma mark ---比分
#define api_match_channel_list @"api/match/channel_list"      // 频道
#define api_match_access_channel @"api/match/access_channel"  
#define api_match_date_list    @"api/match/date_list"         // 日期列表
#define api_match_list         @"api/match/list"              // 比赛列表
#define api_new_match_list     @"api/match/score"              // 新业务的比赛列表
#define api_match_league_list  @"api/match/league_list"       // 联赛列表
#define api_match_care_list    @"api/match/care_list"         // 关注列表
#define api_match_care         @"api/match/care"              // 关注操作 一键清空 取消关注
#define api_app_activate       @"api/app/activate"

#
#endif /* DRRequestApi_h */

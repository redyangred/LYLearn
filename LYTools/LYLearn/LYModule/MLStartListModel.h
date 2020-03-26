//
//  MLStartListModel.h
//  MangoInteraction
//
//  Created by YangChang on 2019/4/15.
//  Copyright © 2019年 Changsha Zhiguan Information Technology Co.,Ltd. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface MLStartListModel : NSObject
//明星名字
@property (nonatomic, copy) NSString * starName;
//日热度
@property (nonatomic, copy) NSString * voteCount;
//明星头像路径
@property (nonatomic, copy) NSString * starImg;
//明星id
@property (nonatomic, copy) NSString * start_id;

//当前名字颜色
@property (nonatomic, strong) UIColor * nameColor;

//当前voteCount的颜色
@property (nonatomic, strong) UIColor * numColor;

//rank的颜色
@property (nonatomic, strong) UIColor * rankColor;


//当前勋章的选择
@property (nonatomic, strong) NSString * medalImage;

//当前位置
@property (nonatomic, strong) NSIndexPath * currentIndexPath;


//当前头盔
@property (nonatomic, strong) NSString * helmetImage;


@property (nonatomic, copy) NSString * coinCount;
@property (nonatomic, copy) NSString * integralCount;
@property (nonatomic, copy) NSString * gettingLoveCount;
@property (nonatomic, copy) NSString * currentRank;
@property (nonatomic, copy) NSString * lastRank;
@property (nonatomic, assign) BOOL  isBackWith;

//是否活动榜单
@property (nonatomic, assign) BOOL isActivety;

@property (nonatomic, copy) NSString * activityId;
@end


@interface MLStartListDateSelectModel : NSObject

//显示时间
@property (nonatomic, copy) NSString * countDate;

//时间戳 每周的星期一或者每月的第一天
@property (nonatomic, copy) NSString * timeInterval;


@property (nonatomic, assign) BOOL isRealTime;


@end


@interface MLStartListMyLoveModel : NSObject

@property (nonatomic, copy) NSString * name;

//勋章数
@property (nonatomic, copy) NSString * voteCount;

//累积多少天
@property (nonatomic, copy) NSString * continueVoteDay;

//明星id
@property (nonatomic, copy) NSString * start_id;

//贡献
@property (nonatomic, copy) NSString * expressCount;

//头像
@property (nonatomic, copy) NSString * headUrl;

@property (nonatomic, strong) NSIndexPath * indexPath;

@end

NS_ASSUME_NONNULL_END

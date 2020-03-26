//
//  MLStartListModel.m
//  MangoInteraction
//
//  Created by YangChang on 2019/4/15.
//  Copyright © 2019年 Changsha Zhiguan Information Technology Co.,Ltd. All rights reserved.
//

#import "MLStartListModel.h"

@implementation MLStartListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"start_id" : @"starId"};
}

@end

@implementation MLStartListDateSelectModel



@end

@implementation MLStartListMyLoveModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"start_id" : @"id"};
}
@end



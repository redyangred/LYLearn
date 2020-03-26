//
//  NSNumber+LYAdapter.h
//  LYLearn
//
//  Created by YangChang on 2020/1/7.
//  Copyright © 2020 liuyang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 布局 height top  bottom 时用
#define LYW(Num) [NSNumber LY_ScreenWidthAdaptationWithNumber:(Num)]

// 布局 width left right leading trailing时用
#define LYH(Num) [NSNumber LY_screenHeightAdaptaionWithNumber:(Num)]

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (LYAdapter)

+ (CGFloat)LY_screenHeightAdaptaionWithNumber:(CGFloat)num;

+ (CGFloat)LY_ScreenWidthAdaptationWithNumber:(CGFloat)num;


@end

NS_ASSUME_NONNULL_END

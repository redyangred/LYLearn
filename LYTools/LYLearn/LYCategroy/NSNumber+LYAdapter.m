//
//  NSNumber+LYAdapter.m
//  LYLearn
//
//  Created by YangChang on 2020/1/7.
//  Copyright © 2020 liuyang. All rights reserved.
//

#import "NSNumber+LYAdapter.h"
//11 {{0, 0}, {414, 896}}
//11 pro {{0, 0}, {375, 812}}
//11 pro max {{0, 0}, {414, 896}}
// 8P   {{0, 0}, {414, 736}}
// 8 {{0, 0}, {375, 667}}
// 5SE {{0, 0}, {320, 568}} 跟5一样
// X {{0, 0}, {375, 812}}
// XS {{0, 0}, {375, 812}}
// XR {{0, 0}, {414, 896}}
// XS MAX {{0, 0}, {414, 896}}

static CGFloat const iPhone5W = 320.0;
static CGFloat const iPhone6W = 375.0;
static CGFloat const iPhone6PW = 414.0;
//static CGFloat const iPhoneXW = 375.0;


static CGFloat const iPhone5H = 568.0;
static CGFloat const iPhone6H = 667.0;
static CGFloat const iPhone4H = 480.0;
static CGFloat const iPhone6PH = 736.0;
static CGFloat const iPhoneXH = 812.0;
static CGFloat const iPhoneXRH = 896.0;




#define iPhone4  ([UIScreen mainScreen].bounds.size.height==480 ? YES : NO)
#define iPhone5  ([UIScreen mainScreen].bounds.size.height==568 ? YES : NO)
#define iPhone6  ([UIScreen mainScreen].bounds.size.height==667 ? YES : NO)
#define iPhone6P ([UIScreen mainScreen].bounds.size.height==736 ? YES : NO)
#define iPhoneX  ([UIScreen mainScreen].bounds.size.height==812 ? YES : NO)
#define iPhoneXS  ([UIScreen mainScreen].bounds.size.height==812 ? YES : NO)
#define iPhonePro  ([UIScreen mainScreen].bounds.size.height==812 ? YES : NO)

#define iPhone11  ([UIScreen mainScreen].bounds.size.height==896 ? YES : NO)
#define iPhoneXR  ([UIScreen mainScreen].bounds.size.height==896 ? YES : NO)
#define iPhoneXRMax  ([UIScreen mainScreen].bounds.size.height==896 ? YES : NO)
#define iPhoneProMax  ([UIScreen mainScreen].bounds.size.height==896 ? YES : NO)



// 默认以iPhone6 为参照比例  据体根据UI 设计图来修改
static CGFloat const referenceW = iPhone6W;
static CGFloat const referenceH = iPhone6H;

@implementation NSNumber (LYAdapter)

// 以高度进行适配
+ (CGFloat)LY_screenHeightAdaptaionWithNumber:(CGFloat)num {
    NSNumber *orgNum = [NSNumber numberWithDouble:num];
    CGFloat AdaNum = [orgNum doubleValue];
    if (iPhone4) {
        AdaNum = iPhone4H / referenceH * AdaNum;
    }else if (iPhone5){
        AdaNum = iPhone5H / referenceH * AdaNum;
    }else if (iPhone6){
        AdaNum = iPhone6H / referenceH * AdaNum;
    }else if (iPhone6P){
        AdaNum = iPhone6PH / referenceH * AdaNum;
    }else if (iPhoneX){
        AdaNum = iPhoneXH / referenceH * AdaNum;
    }else if (iPhoneProMax){
        AdaNum = iPhoneXRH / referenceH * AdaNum;
    }
    return AdaNum;
}

// 以宽度进行适配
+ (CGFloat)LY_ScreenWidthAdaptationWithNumber:(CGFloat)num {
    NSNumber *orgNum = [NSNumber numberWithDouble:num];
     CGFloat AdaNum = [orgNum doubleValue];
     if (iPhone5 || iPhone4) {
         AdaNum = iPhone5W / referenceW * AdaNum;
     }else if (iPhone6 || iPhoneX){
         AdaNum = iPhone6W / referenceW * AdaNum;
     }else if (iPhone6P || iPhoneProMax){
         AdaNum = iPhone6PW / referenceW * AdaNum;
     }
     return AdaNum;
}
@end

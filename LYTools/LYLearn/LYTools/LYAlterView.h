//
//  LYAlterView.h
//  LYLearn
//
//  Created by YangChang on 2020/3/26.
//  Copyright © 2020 liuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
///弹窗模式
typedef enum{
    ///默认 从窗口正中 弹出
    LYAlterViewStyleAlert = 0,
    ///下
    LYAlterViewStyleActionSheetDown,
    ///上
    LYAlterViewStyleActionSheetTop,
    ///左
    LYAlterViewStyleActiAlertLeft,
    ///右边
    LYAlterViewStyleActiAlertRight,
    
}LYAlterViewStyle;
///关闭模式
typedef enum{
    ///触摸整个窗口 关闭 【默认】
    CloseStyleTapClose = 0,
    /// 点击关闭按钮关闭  自带【右上角 需要自己设置图片】
    CloseStyleButtonClose,
}CloseStyle;
typedef void(^showBlock)(void);;
typedef void(^dismissBlock)(void);
NS_ASSUME_NONNULL_BEGIN

@interface LYAlterView : NSObject
///弹出动画完成后的 回调
@property (nonatomic, copy) showBlock showBlock;
///关闭回调
@property (nonatomic, copy) dismissBlock dismissBlock;
///关闭模式
@property (nonatomic, assign) CloseStyle closeStyle;
/// 开启或关闭 自带的 移除弹窗事件 如果关闭需要自己调用 dismiss
@property (nonatomic, assign) BOOL on;
/// 关闭按钮 图片 30*30
@property (nonatomic, strong) UIImage *closeImage;

//保存弹出视图
@property (nonatomic, strong) UIView *contentView;

/**  创建弹出试图 */
+ (LYAlterView *)sharedMask;
/**
 * show:withType:     弹出视图
 * @param contentView 需要弹出的视图
 * @param style       弹出模式
 */
- (void)show:(UIView *)contentView withType:(LYAlterViewStyle)style;



- (void)show:(UIView *)contentView withType:(LYAlterViewStyle)style withTime:(CGFloat)time;
/**
 *  show:withType:animationFinish:dismissHandle: 弹出视图
 *  @param contentView 需要弹出的视图
 *  @param style       弹出模式
 *  @param show        弹出回调
 *  @param dismiss     消失回调
 *
 */
- (void)show:(UIView *)contentView withType:(LYAlterViewStyle)style animationFinish:(showBlock)show dismissHandle:(dismissBlock)dismiss;
/**  移除弹出视图 */
- (void)dismiss;


- (void)show:(UIView *)contentView inView:(UIView *)superView withType:(LYAlterViewStyle)style;


- (void)showTop:(UIView *)contentView withType:(LYAlterViewStyle)style;
@end

NS_ASSUME_NONNULL_END

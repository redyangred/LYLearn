//
//  LYAlterView.m
//  LYLearn
//
//  Created by YangChang on 2020/3/26.
//  Copyright © 2020 liuyang. All rights reserved.
//

#import "LYAlterView.h"
///屏幕宽度
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
///屏幕高度
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define KEYWINDOW     [[UIApplication sharedApplication] keyWindow]
#define ANIMATION_TIME 0.5

@interface LYAlterView()
///遮罩层
@property (nonatomic, strong) CALayer *maskLayer;
//响应事件的控件
@property (nonatomic, strong) UIControl *control;

///弹出模式
@property (nonatomic, assign) LYAlterViewStyle alertStyle;
///动画前的位置
@property (nonatomic, assign) CGAffineTransform starTransForm;
///关闭按钮
@property (nonatomic, strong) UIButton *closeBtn;

@property (nonatomic, strong) UIView *superView;
@end

@implementation LYAlterView
+ (LYAlterView *)sharedMask{
    static LYAlterView *alertView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!alertView) {
            alertView = [[LYAlterView alloc] init];
        }
    });
    return alertView;
}

- (UIControl *)control{
    
    if(!_control){
        
        _control = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        [_control addTarget:self action:@selector(dismissControl) forControlEvents:UIControlEventTouchUpInside];
        _control.enabled = YES;
    }
    return _control;
}
- (UIButton *)closeBtn{
    return nil;
}

- (void)show:(UIView *)contentView inView:(UIView *)superView withType:(LYAlterViewStyle)style{
    _superView = superView;
    //判断是否赋于大小
    CGFloat contentViewHeight =  contentView.frame.size.height;
    CGFloat contentViewWidth  =  contentView.frame.size.width;
    if(contentViewHeight == 0.00||contentViewWidth == 0.00){
        NSLog(@"弹出视图 必须 赋予宽高");
        return;
    }
    _contentView = contentView;
    _contentView.center = superView.center;
    _alertStyle = style;
    _on = YES;
    if (!_maskLayer) {
        [self addMaskLayerSuperView:superView];
        // 根据弹出模式 添加动画
        switch (_alertStyle) {
            case LYAlterViewStyleAlert:
                _starTransForm = CGAffineTransformMakeScale(0.01, 0.01);
                break;
            case LYAlterViewStyleActiAlertLeft:
                _starTransForm = CGAffineTransformMakeTranslation(-SCREEN_W, 0);
                break;
            case LYAlterViewStyleActiAlertRight:
                _starTransForm = CGAffineTransformMakeTranslation(SCREEN_W, 0);
                break;
            case LYAlterViewStyleActionSheetTop:
                
                _starTransForm = CGAffineTransformMakeTranslation(0, -_contentView.frame.size.height);
                break;
            case LYAlterViewStyleActionSheetDown:
                
                _starTransForm = CGAffineTransformMakeTranslation(0, SCREEN_H);
                break;
            default:
                break;
        }
        [self alertAnimatedPrensentSuperView:superView];
        
    }else {
        
        //
        _maskLayer = nil;
    }
    
}

- (void)show:(UIView *)contentView withType:(LYAlterViewStyle)style withTime:(CGFloat)time {
    if([KEYWINDOW viewWithTag:80001]){
         return;
     }
     
     //判断是否赋于大小
     CGFloat contentViewHeight =  contentView.frame.size.height;
     CGFloat contentViewWidth  =  contentView.frame.size.width;
     if(contentViewHeight == 0.00||contentViewWidth == 0.00){
         NSLog(@"弹出视图 必须 赋予宽高");
         return;
     }
     _contentView = contentView;
     _contentView.tag = 80001;
     _contentView.center = KEYWINDOW.center;
     _alertStyle = style;
     _on = YES;
     if (!_maskLayer) {
         [self addMaskLayer];
         // 根据弹出模式 添加动画
         switch (_alertStyle) {
             case LYAlterViewStyleAlert:
                 _starTransForm = CGAffineTransformMakeScale(0.01, 0.01);
                 break;
             case LYAlterViewStyleActiAlertLeft:
                 _starTransForm = CGAffineTransformMakeTranslation(-SCREEN_W, 0);
                 break;
             case LYAlterViewStyleActiAlertRight:
                 _starTransForm = CGAffineTransformMakeTranslation(SCREEN_W, 0);
                 break;
             case LYAlterViewStyleActionSheetTop:
               
                 _starTransForm = CGAffineTransformMakeTranslation(0, -_contentView.frame.size.height);
                 break;
             case LYAlterViewStyleActionSheetDown:
              
                 _starTransForm = CGAffineTransformMakeTranslation(0, SCREEN_H);
                 _contentView.bottom = KEYWINDOW.bottom;
                 break;
             default:
                 break;
         }
         [self alertAnimatedPrensentTime:time];
         
     }else {
         
         //
         _maskLayer = nil;
     }
}

- (void)show:(UIView *)contentView withType:(LYAlterViewStyle)style{
//
    if([KEYWINDOW viewWithTag:80001]){
        return;
    }
    
    //判断是否赋于大小
    CGFloat contentViewHeight =  contentView.frame.size.height;
    CGFloat contentViewWidth  =  contentView.frame.size.width;
    if(contentViewHeight == 0.00||contentViewWidth == 0.00){
        NSLog(@"弹出视图 必须 赋予宽高");
        return;
    }
    _contentView = contentView;
    _contentView.tag = 80001;
    _contentView.center = KEYWINDOW.center;
    _alertStyle = style;
    _on = YES;
    if (!_maskLayer) {
        [self addMaskLayer];
        // 根据弹出模式 添加动画
        switch (_alertStyle) {
            case LYAlterViewStyleAlert:
                _starTransForm = CGAffineTransformMakeScale(0.01, 0.01);
                break;
            case LYAlterViewStyleActiAlertLeft:
                _starTransForm = CGAffineTransformMakeTranslation(-SCREEN_W, 0);
                break;
            case LYAlterViewStyleActiAlertRight:
                _starTransForm = CGAffineTransformMakeTranslation(SCREEN_W, 0);
                break;
            case LYAlterViewStyleActionSheetTop:
              
                _starTransForm = CGAffineTransformMakeTranslation(0, -_contentView.frame.size.height);
                break;
            case LYAlterViewStyleActionSheetDown:
             
                _starTransForm = CGAffineTransformMakeTranslation(0, SCREEN_H);
                _contentView.bottom = KEYWINDOW.bottom;
                break;
            default:
                break;
        }
        [self alertAnimatedPrensent];
        
    }else {
        
        //
        _maskLayer = nil;
    }
    
    
}

- (void)showTop:(UIView *)contentView withType:(LYAlterViewStyle)style {
    //
    if([KEYWINDOW viewWithTag:80001]){
        return;
    }
    
    //判断是否赋于大小
    CGFloat contentViewHeight =  contentView.frame.size.height;
    CGFloat contentViewWidth  =  contentView.frame.size.width;
    if(contentViewHeight == 0.00||contentViewWidth == 0.00){
        NSLog(@"弹出视图 必须 赋予宽高");
        return;
    }
    _contentView = contentView;
    _contentView.tag = 80001;
    _contentView.center = KEYWINDOW.center;
    _contentView.y = 100;
    _alertStyle = style;
    _on = YES;
    if (!_maskLayer) {
        [self addMaskLayer];
        // 根据弹出模式 添加动画
        switch (_alertStyle) {
            case LYAlterViewStyleAlert:
                _starTransForm = CGAffineTransformMakeScale(0.01, 0.01);
                break;
            case LYAlterViewStyleActiAlertLeft:
                _starTransForm = CGAffineTransformMakeTranslation(-SCREEN_W, 0);
                break;
            case LYAlterViewStyleActiAlertRight:
                _starTransForm = CGAffineTransformMakeTranslation(SCREEN_W, 0);
                break;
            case LYAlterViewStyleActionSheetTop:
                
                _starTransForm = CGAffineTransformMakeTranslation(0, -_contentView.frame.size.height);
                break;
            case LYAlterViewStyleActionSheetDown:
                
                _starTransForm = CGAffineTransformMakeTranslation(0, SCREEN_H);
                _contentView.bottom = KEYWINDOW.bottom;
                break;
            default:
                break;
        }
        [self alertAnimatedPrensent];
        
    }else {
        
        //
        _maskLayer = nil;
    }
    
    
}

//  自定义的alert或actionSheet内容view必须初始化大小
- (void)show:(UIView *)contentView withType:(LYAlterViewStyle)style animationFinish:(showBlock)show dismissHandle:(dismissBlock)dismiss {
    //保存 回调
    if (show) {
        _showBlock = [show copy];
    }
    if(dismiss){
        _dismissBlock = [dismiss copy];
    }
    [self show:contentView withType:style];
}


///添加遮罩
- (void)addMaskLayer{
    _maskLayer = [CALayer layer];
    [_maskLayer setFrame:[[UIScreen mainScreen] bounds]];
    [_maskLayer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.30].CGColor];
    [[KEYWINDOW layer] addSublayer:_maskLayer];
    //判断关闭方式
    [self setCloseStyle:_closeStyle];
    [KEYWINDOW addSubview:self.control];
    
}


- (void)addMaskLayerSuperView:(UIView *)superView {
    
    _maskLayer = [CALayer layer];
    [_maskLayer setFrame:[[UIScreen mainScreen] bounds]];
    [_maskLayer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.30].CGColor];
    [[superView layer] addSublayer:_maskLayer];
    //判断关闭方式
    [self setCloseStyle:_closeStyle];
    [superView addSubview:self.control];
}


//关闭 自带事件 由用户自己写事件关闭弹窗
- (void)setOn:(BOOL)on{
    _on = on;
}

- (void)setCloseImage:(UIImage *)closeImage{
    
    [_closeBtn setImage:closeImage forState:UIControlStateNormal];
}

- (void)setCloseStyle:(CloseStyle)closeStyle{
    _closeStyle = closeStyle;
//    //判断关闭方式
//    if (_closeStyle == CloseStyleTapClose)
//    {
//        self.control.enabled = YES;
//        self.closeBtn.hidden = YES;
//    }else{
//        self.control.enabled = NO;
//        self.closeBtn.hidden = NO;
//    }
}

- (void)dismissControl{
    NSLog(@"_on = %d",_on);
    
    if(_on == NO){
        
    }else{
        [self dismiss];
    }
}

- (void)dismiss{
    //设置初始值
    // 移除遮罩

    [_maskLayer removeFromSuperlayer];
    [_control removeFromSuperview];
    [_closeBtn removeFromSuperview];
    _maskLayer = nil;
    _control = nil;
    _closeBtn = nil;
    
    //移除弹出框
    [self alertAnimatedOut];
    
}

- (void)alertAnimatedPrensent{
    _contentView.transform = _starTransForm;
    [KEYWINDOW addSubview:_contentView];
    [UIView animateWithDuration:ANIMATION_TIME delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _contentView.transform = CGAffineTransformIdentity;
        KEYWINDOW.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        KEYWINDOW.userInteractionEnabled = YES;
        if (_showBlock) {
            //动画完成后回调
            _showBlock();
        }
    }];
}


- (void)alertAnimatedPrensentTime:(CGFloat)time{
    _contentView.transform = _starTransForm;
    [KEYWINDOW addSubview:_contentView];
    [UIView animateWithDuration:ANIMATION_TIME delay:0.0 usingSpringWithDamping:time initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _contentView.transform = CGAffineTransformIdentity;
        KEYWINDOW.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        KEYWINDOW.userInteractionEnabled = YES;
        if (_showBlock) {
            //动画完成后回调
            _showBlock();
        }
    }];
}

- (void)alertAnimatedPrensentSuperView:(UIView *)superView {
    
    _contentView.transform = _starTransForm;
    [superView addSubview:_contentView];
    [UIView animateWithDuration:ANIMATION_TIME delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _contentView.transform = CGAffineTransformIdentity;
        superView.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        superView.userInteractionEnabled = YES;
        if (_showBlock) {
            //动画完成后回调
            _showBlock();
        }
    }];
}

- (void)addCoreAnimation{
    
    CATransition *animation = [CATransition animation];
    animation.type = @"rippleEffect";
    animation.duration = ANIMATION_TIME;
    [_contentView.layer addAnimation:animation forKey:@""];
    
}

- (void)alertAnimatedOut{
    [UIView animateWithDuration:0.2 animations:^{
        //_contentView.transform = _starTransForm;
        KEYWINDOW.userInteractionEnabled = NO;
        
        _contentView.alpha = 0;
        
    } completion:^(BOOL finished) {
        KEYWINDOW.userInteractionEnabled = YES;
        [_contentView removeFromSuperview];
        _contentView = nil;
        //回调动画完成回调
        if (_dismissBlock) {
            
            _dismissBlock();
        }
    }];
}
@end

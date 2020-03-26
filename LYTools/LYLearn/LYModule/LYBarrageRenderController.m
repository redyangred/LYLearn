//
//  LYBarrageRenderController.m
//  LYLearn
//
//  Created by YangChang on 2020/1/7.
//  Copyright © 2020 liuyang. All rights reserved.
//

#import "LYBarrageRenderController.h"
#import<BarrageRenderer/BarrageRenderer.h>
#import "NSSafeObject.h"
#import "BarrageWalkSprite.h"

@interface LYBarrageRenderController ()<BarrageRendererDelegate>
@property (nonatomic, strong) BarrageRenderer *render ;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) NSArray * array;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIView * contantView;
@end

@implementation LYBarrageRenderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contantView = [UIView new];
      [self.view addSubview:self.contantView];
      self.contantView.frame = CGRectMake(20, 100, kScreenW - 40, 40);
      
      BarrageRenderer *render = [[BarrageRenderer alloc] init];
      _render = render;
      [self.contantView addSubview:render.view];
      _render.smoothness = .2f;
      _render.delegate = self;
      render.view.backgroundColor = kRedColor;
      self.array = @[@"asdasdasd",@"奥术大师大",@"啥打法和是的",@"asdasdasd",@"奥术大师大",@"啥打法和是的",@"asdasdasd",@"奥术大师大",@"啥打法和是的",@"asdasdasd",@"奥术大师大",@"啥打法和是的",@"asdasdasd",@"奥术大师大",@"啥打法和是的",@"asdasdasd",@"奥术大师大",@"啥打法和是的"];
      [self.render start];
      [self startMockingBarrageMessage];
      [_render receive:[self walkTextSpriteDescriptorWithDirection:BarrageWalkDirectionR2L side:BarrageWalkSideLeft]];
}

- (void)startMockingBarrageMessage
{
    [_timer invalidate];
    NSSafeObject * safeObj = [[NSSafeObject alloc]initWithObject:self withSelector:@selector(autoSendBarrage)];
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:safeObj selector:@selector(excute) userInfo:nil repeats:YES];
}

//- (void)autoSendBarrage
//{
//    NSInteger spriteNumber = [_render spritesNumberWithName:nil];
//  [_render receive:[self walkTextSpriteDescriptorWithDirection:BarrageWalkDirectionR2L side:BarrageWalkSideLeft]];
//}

/// 演示如何拿到弹幕的生命周期
- (void)barrageRenderer:(BarrageRenderer *)renderer spriteStage:(BarrageSpriteStage)stage spriteParams:(NSDictionary *)params
{
    NSString *subid = [params[@"identifier"] substringToIndex:8];
    if (stage == BarrageSpriteStageBegin) {
        NSLog(@"%@",params);
        NSLog(@"id:%@,bizMsgId:%@ =>进入",subid,params[@"bizMsgId"]);
    } else if (stage == BarrageSpriteStageEnd) {
        
        NSLog(@"id:%@,bizMsgId:%@ =>离开",subid,params[@"bizMsgId"]);
        
        BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
        descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
        [descriptor.params addEntriesFromDictionary:params];
        descriptor.params[@"delay"] = @(0);
        descriptor.params[@"text"] = @"asdasd";
        [renderer receive:descriptor];
        
    }
}

/// 生成精灵描述 - 过场文字弹幕
- (BarrageDescriptor *)walkTextSpriteDescriptorWithDirection:(BarrageWalkDirection)direction side:(BarrageWalkSide)side
{
    BarrageDescriptor * descriptor = [[BarrageDescriptor alloc]init];
    descriptor.spriteName = NSStringFromClass([BarrageWalkTextSprite class]);
    descriptor.params[@"bizMsgId"] = [NSString stringWithFormat:@"%ld",(long)_index];
    descriptor.params[@"text"] = [NSString stringWithFormat:@"过场文字弹幕:%ld",(long)_index++];
    descriptor.params[@"textColor"] = [UIColor blueColor];
    descriptor.params[@"speed"] = @(70);
    descriptor.params[@"duration"] = @(10);
    descriptor.params[@"direction"] = @(direction);
    descriptor.params[@"side"] = @(side);
    descriptor.params[@"trackNumber"] = @1; // 轨道数量
    descriptor.params[@"fadeInTime"] = @(1);  // 隐入时间
    descriptor.params[@"fadeOutTime"] = @(1); // 隐出时间
    descriptor.params[@"clickAction"] = ^(NSDictionary *params){
        NSString *msg = [NSString stringWithFormat:@"弹幕 %@ 被点击",params[@"bizMsgId"]];
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertView show];
    };
    return descriptor;
}

@end

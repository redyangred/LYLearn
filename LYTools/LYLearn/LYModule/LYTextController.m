//
//  LYTextController.m
//  LYLearn
//
//  Created by YangChang on 2020/1/7.
//  Copyright © 2020 liuyang. All rights reserved.
//

#import "LYTextController.h"

@interface LYTextController ()
@property (nonatomic, strong) YYTextContainer *container ;
@property (nonatomic, strong) YYLabel *label;
@property (nonatomic, strong) YYTextLayout *layout ;
@property (nonatomic, strong) NSMutableAttributedString *text ;

@end

@implementation LYTextController

- (void)viewDidLoad {
    [super viewDidLoad];
    //        YYLabel *label = [YYLabel new];
    //        self.label = label;
    //        label.frame = CGRectMake(10, 100, self.view.frame.size.width - 20, 10);
    //    //    label.font = [UIFont systemFontOfSize:20];
    //    //    label.textColor = kBlackColor;
    //    //    label.textAlignment = NSTextAlignmentCenter;
    //    //    label.numberOfLines = 0;
    //        NSString *content = @"1、一人难如百人愿 ， 不是所有的人， 都会欣赏和喜欢自己。所以， 我们不必曲意逢迎他人的目光， 不用祈求得到所有人的温柔以待。生命匆匆，放下了执念负累，心才能风情日朗；淡看世asdasdasdasdsad事沧桑，心自安然无恙。2、有一种期待，叫做你能行；有一种信任，叫做你可以；有一种祝愿，叫做你最棒！给自己一个机会，让自己重新开始。自己的命运自己做主，自己的Asdsdjsad人生自己刻画。只要相信自己，就没有什么不可以；只要信任自己，就没有什么不可能！给自己一点信心，勇敢地跨出第一步，你的人生将因此而不同 。";
    //    //    label.preferredMaxLayoutWidth = label.frame.size.width;
    //        [self.view addSubview:label];
    //
    //
    //        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:content];
    //        self.text = text;
    //        text.yy_font = [UIFont systemFontOfSize:20];
    //        text.yy_lineSpacing = 10;
    //        text.yy_color = kRedColor;
    //        [text yy_setColor:kBlueColor range:NSMakeRange(0, 100)];
    //        [text yy_setFont:[UIFont boldSystemFontOfSize:30] range:NSMakeRange(0, 100)];
    //        CGSize size = CGSizeMake(kScreenW - 20, MAXFLOAT);
    //         [text yy_setTextHighlightRange:NSMakeRange(0, 100) color:kGreenColor backgroundColor:kPurpleColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
    //             NSLog(@"text = %@",text);
    //            NSLog(@"containerView = %@",containerView);
    //            NSLog(@"range = %@",NSStringFromRange(range));
    //            NSLog(@"rect = %@",NSStringFromCGRect(rect));
    //        }];
    //
    //
    //        YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    //        modifier.fixedLineHeight = 24;
    //        label.linePositionModifier = modifier;
    //
    //        YYTextContainer *container = [YYTextContainer new];
    //        self.container = container;
    //        container.size = size;
    //        container.maximumNumberOfRows = 2;
    //    //    container.linePositionModifier = modifier;
    //
    //        YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:text];
    //        self.layout = layout;
    //        NSLog(@"textBoundingRect=%@",NSStringFromCGRect(layout.textBoundingRect));
    //         NSLog(@"textBoundingSize=%@",NSStringFromCGSize(layout.textBoundingSize));
    //        label.size = layout.textBoundingSize;
    //        label.textLayout = layout;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    self.container.maximumNumberOfRows = 5;
//    self.layout = [YYTextLayout layoutWithContainer:self.container text:self.text];
//    self.label.size = self.layout.textBoundingSize;
//    self.label.textLayout = self.layout;
}

@end

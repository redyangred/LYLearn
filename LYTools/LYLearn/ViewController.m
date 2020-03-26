//
//  ViewController.m
//  LYLearn
//
//  Created by YangChang on 2019/12/17.
//  Copyright © 2019 liuyang. All rights reserved.
//

#import "ViewController.h"
#import "MLStartListModel.h"

@interface ViewController ()
@property (nonatomic, assign) BOOL isOpen;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl *contr = [[UISegmentedControl alloc] initWithItems:@[@"周",@"月"]];
    [self.view addSubview:contr];
    [contr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
        make.centerX.mas_equalTo(self.view);
    }];
    contr.layer.cornerRadius = 15;
    contr.layer.masksToBounds = YES;
    
    [contr setBackgroundImage:[UIImage imageWithColor:kRedColor] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    
    UIImageView *im = [[UIImageView alloc] init];
    im.frame = CGRectMake(30, 200, 55, 25);
    [self.view addSubview:im];
    im.backgroundColor = kWhiteColor;
    im.layer.cornerRadius = 12.5;
    im.layer.masksToBounds = YES;
    im.layer.borderColor = RGBColor(253, 100, 209).CGColor;
    im.layer.borderWidth = 0.5;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context,color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)setCornerWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:cornerRadius];
    
    UIGraphicsBeginImageContext(image.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextClip(ctx);
    
    [image drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)test1 {
    UILabel *labe = [UILabel new];
       [self.view addSubview:labe];
       labe.tag = 100;
       [labe mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(10);
           make.right.mas_equalTo(-10);
           make.top.mas_equalTo(100);
       }];
       labe.preferredMaxLayoutWidth = kScreenW - 20;
       labe.numberOfLines = 3;
       labe.text = @"name 配置名称; 显示在启动配置的下拉列表。Wing 内置播放器调试 、使用本机 Chrome 调试 。type EgretWing配置类型，chrome、node、extensionHost。request 配置的Request类型。 有效值为  或者。file debug 入口文件,在浏览器打开的html文件。runtimeExecutable 可执行文件的绝对路径。默认值是 PATH 上的运行时可执行文件。改成您的 Chrome 安装路径 例如 C:\Program Files (x86)\Google\Chrome\Application\chrome.exe 或 /Applications/Google Chrome.app/Contents/MacOS/Google Chrome。useBuildInServer 当为true, EgretWing 将启动一个内建的web server。sourceMaps 是否使用 JavaScript 源映射(如果存在)。webRoot Web服务的根目录。preLaunchTask 执行任务之前运行的任务。port web服务器指定的端口号。";
       labe.backgroundColor = kRedColor;
       NSLog(@"%@",NSStringFromCGRect(labe.frame));
       [self.view layoutIfNeeded];
       NSLog(@"layoutIfNeeded=%@",NSStringFromCGRect(labe.frame));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    if (self.isOpen) {
//        UILabel *l =  [self.view viewWithTag:100];
//           l.numberOfLines = 0;
//          [self.view layoutIfNeeded];
//        self.isOpen = NO;
//
//    }else {
//        UILabel *l =  [self.view viewWithTag:100];
//        l.numberOfLines = 4;
//        [self.view layoutIfNeeded];
//        self.isOpen = YES;
//    }
}

- (NSString *)getWeekTime
{
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday  fromDate:nowDate];
    // 获取今天是周几
    NSInteger weekDay = [comp weekday];
    // 获取几天是几号
    NSInteger day = [comp day];
    NSLog(@"%ld----%ld",(long)weekDay,(long)day);

    // 计算当前日期和本周的星期一和星期天相差天数
    long firstDiff,lastDiff;
    //    weekDay = 1; weekDay == 1 == 周日
    if (weekDay == 1)
    {
        firstDiff = -6;
        lastDiff = 0;
    }
    else
    {
        NSLog(@"%ld-",(long)[calendar firstWeekday]);
         
        firstDiff = [calendar firstWeekday] - weekDay + 1;
        lastDiff = 8 - weekDay;
    }
    NSLog(@"firstDiff: %ld   lastDiff: %ld",firstDiff,lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上差的天数
    NSDateComponents *baseDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];

    //获取周一日期
    [baseDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:baseDayComp];
    
    //获取周末日期
    [baseDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:baseDayComp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *firstDay = [formatter stringFromDate:firstDayOfWeek];
    NSString *lastDay = [formatter stringFromDate:lastDayOfWeek];
    NSLog(@"%@=======%@",firstDay,lastDay);
    
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@",firstDay,lastDay];
    NSMutableArray *tem = @[].mutableCopy;
    for (int i = 0; i < 7; i++) {

    NSDate *startdate1 = [firstDayOfWeek dateByAddingTimeInterval:24*3600*7*(-i)];

    NSDate *enddate1 = [lastDayOfWeek dateByAddingTimeInterval:24*3600*7*(- i)];
    
    [tem addObject:@[startdate1,enddate1]];

    }
    
    return dateStr;
    
}



- (NSArray *)getAllWeekDate

{

NSDate *nowDate = [NSDate date];

NSCalendar *calendar = [NSCalendar currentCalendar];

NSDateComponents *comp = [calendar components: NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear fromDate:nowDate];

// 获取今天是周几 (周一是2，周日是1)

NSInteger weekDay = [comp weekday];

//这周是今年的第几周(注意：第一周编号为1不为0)

NSInteger weekOfYear = [comp weekOfYear];

NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

[formatter setDateFormat:@"yyyyMMdd"];

NSDate *date = [formatter dateFromString:[formatter stringFromDate:[NSDate date]]];

//这周的开始和结束时间 （注意：+1 -1 避开临界值）

NSDate *startdate = [date dateByAddingTimeInterval:24*3600*(2 - weekDay)+1];

NSDate *enddate = [date dateByAddingTimeInterval:24*3600*(9 - weekDay)-1];

NSMutableArray *dateArray = [[[NSMutableArray alloc] init] mutableCopy];

//一年52周  获取一年的所有周一和周日的日期(注意：第一周编号为1不为0)

for (int i = 1; i <= 7; i++) {

NSDate *startdate1 = [startdate dateByAddingTimeInterval:24*3600*7*(weekOfYear - i)];

NSDate *enddate1 = [enddate dateByAddingTimeInterval:24*3600*7*(weekOfYear - i)];

[dateArray addObject:@[startdate1,enddate1]];

}

return dateArray;

}


@end

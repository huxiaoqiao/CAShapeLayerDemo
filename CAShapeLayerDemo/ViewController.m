//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by 胡晓桥 on 15/3/8.
//  Copyright (c) 2015年 胡晓桥. All rights reserved.
//


#define SCREEN_WIDTH_H (([UIScreen mainScreen].bounds.size.width) / 2)
#define SCREEN_HIGHT_H (([UIScreen mainScreen].bounds.size.height) / 2)

#import "ViewController.h"
@interface ViewController ()
{
    CGPoint P_A;
    CGPoint P_B;
    CGPoint P_A_B;
    CGPoint P_C;
    CGPoint P_B_C;
    CGPoint P_D;
    CGPoint P_C_D;
    CGPoint P_D_A;
    CGPoint P_E;
    CGPoint P_F;
    CGPoint P_G;
    CGPoint P_H;
    CAShapeLayer *_shapeLayer;
    NSTimer *_timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self pointsInit];
    
    //创建shapeLayer
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.bounds = self.view.bounds;
    _shapeLayer.position = self.view.center;
    _shapeLayer.path = [self getBezierPath3].CGPath;
    _shapeLayer.fillColor = [UIColor yellowColor].CGColor;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    _shapeLayer.lineWidth = 3.0f;
    [self.view.layer addSublayer:_shapeLayer];
    
    //创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pathAnimation) userInfo:nil repeats:YES];
    
    
}

- (void)pointsInit{
    P_A = CGPointMake(SCREEN_WIDTH_H, SCREEN_HIGHT_H - 100);
    P_B = CGPointMake(SCREEN_WIDTH_H + 100, SCREEN_HIGHT_H);
    P_A_B = CGPointMake(SCREEN_WIDTH_H + 50, SCREEN_HIGHT_H -50);
    P_C = CGPointMake(SCREEN_WIDTH_H, SCREEN_HIGHT_H + 100);
    P_B_C = CGPointMake(SCREEN_WIDTH_H + 50, SCREEN_HIGHT_H + 50);
    P_D = CGPointMake(SCREEN_WIDTH_H - 100, SCREEN_HIGHT_H);
    P_C_D = CGPointMake(SCREEN_WIDTH_H - 50, SCREEN_HIGHT_H + 50);
    P_D_A = CGPointMake(SCREEN_WIDTH_H - 50, SCREEN_HIGHT_H - 50);
    P_E = CGPointMake(SCREEN_WIDTH_H + 100, SCREEN_HIGHT_H - 100);
    P_F = CGPointMake(SCREEN_WIDTH_H + 100, SCREEN_HIGHT_H + 100);
    P_G = CGPointMake(SCREEN_WIDTH_H - 100, SCREEN_HIGHT_H + 100);
    P_H = CGPointMake(SCREEN_WIDTH_H - 100, SCREEN_HIGHT_H - 100);

}


- (UIBezierPath *)getBezierPath1{
    UIBezierPath *shapePath = [UIBezierPath bezierPath];
    [shapePath moveToPoint:P_A];
    [shapePath addLineToPoint:P_A_B];
    [shapePath addLineToPoint:P_B];
    [shapePath addLineToPoint:P_B_C];
    [shapePath addLineToPoint:P_C];
    [shapePath addLineToPoint:P_C_D];
    [shapePath addLineToPoint:P_D];
    [shapePath addLineToPoint:P_D_A];
    
    [shapePath closePath];
    
    
    
    return shapePath;
}

- (UIBezierPath *)getBezierPath2{
    UIBezierPath *shapePath = [UIBezierPath bezierPath];
    [shapePath moveToPoint:P_A];
    [shapePath addLineToPoint:P_E];
    [shapePath addLineToPoint:P_B];
    [shapePath addLineToPoint:P_F];
    [shapePath addLineToPoint:P_C];
    [shapePath addLineToPoint:P_G];
    [shapePath addLineToPoint:P_D];
    [shapePath addLineToPoint:P_H];
    [shapePath closePath];
    return shapePath;
}

- (UIBezierPath *)getBezierPath3{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:50 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    return circlePath;
}


- (UIBezierPath *)getBezierPath4{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:100 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    return circlePath;
}

- (void)pathAnimation{
    static int i = 0;
    if (i++ % 2 == 0) {
        CABasicAnimation *circleAnim = [CABasicAnimation animationWithKeyPath:@"path"];
        //完成一次动画不移除
        circleAnim.removedOnCompletion = NO;
        circleAnim.duration = 1.0f;
        circleAnim.fromValue = (__bridge id)([self getBezierPath3].CGPath);
        circleAnim.toValue = (__bridge id)([self getBezierPath4].CGPath);
        _shapeLayer.path = [self getBezierPath4].CGPath;
        [_shapeLayer addAnimation:circleAnim forKey:@"animationCirclePath"];
    }else{
        CABasicAnimation *circleAnim = [CABasicAnimation animationWithKeyPath:@"path"];
        //完成一次动画不移除
        circleAnim.removedOnCompletion = NO;
        circleAnim.duration = 1.0f;
        circleAnim.fromValue = (__bridge id)([self getBezierPath4].CGPath);
        circleAnim.toValue = (__bridge id)([self getBezierPath3].CGPath);
        _shapeLayer.path = [self getBezierPath3].CGPath;
        [_shapeLayer addAnimation:circleAnim forKey:@"animationCirclePath"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

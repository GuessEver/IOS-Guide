//
//  Gesture.m
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "Gesture.h"

@implementation Gesture

UIImageView* imgView;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self gesture_tap]; // 点击
    [self gesture_pinch]; // 缩放
    [self gesture_pan]; // 拖动
    [self gesture_swipe]; // 滑动
    [self gesture_rotation]; // 旋转
    [self gesture_longPress]; // 长按
}

- (void) gesture_tap {
    // UITapGestureRecognizer 任意次数的点击
    UITapGestureRecognizer* oneFingerOneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerOneTapsHandler:)];
    [oneFingerOneTap setNumberOfTouchesRequired:1]; // 需要一个触点
    [oneFingerOneTap setNumberOfTapsRequired:1]; // 需要点1次
    [self.view addGestureRecognizer:oneFingerOneTap];
    
    UITapGestureRecognizer* oneFingerTwoTaps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTapsHandler:)];
    [oneFingerTwoTaps setNumberOfTouchesRequired:1];
    [oneFingerTwoTaps setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:oneFingerTwoTaps];
    
    UITapGestureRecognizer* oneFingerThreeTaps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerThreeTapsHandler:)];
    [oneFingerThreeTaps setNumberOfTouchesRequired:1];
    [oneFingerThreeTaps setNumberOfTapsRequired:3];
    [self.view addGestureRecognizer:oneFingerThreeTaps];
    
    UITapGestureRecognizer* twoFingerTwoTaps = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerTwoTapsHandler:)];
    [twoFingerTwoTaps setNumberOfTouchesRequired:2];
    [twoFingerTwoTaps setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:twoFingerTwoTaps];
}
- (void) oneFingerOneTapsHandler:(UITapGestureRecognizer*)sender {
    printf("Action: 1 Finger, 1 Tap\n");
}
- (void) oneFingerTwoTapsHandler:(UITapGestureRecognizer*)sender {
    printf("Action: 1 Finger, 2 Taps\n");
}
- (void) oneFingerThreeTapsHandler:(UITapGestureRecognizer*)sender {
    printf("Action: 1 Finger, 3 Taps\n");
}
- (void) twoFingerTwoTapsHandler:(UITapGestureRecognizer*)sender {
    printf("Action: 2 Fingers, 2 Taps\n");
}

- (void) gesture_pinch {
    // UIPinchGestureRecognizer 两指缩放
    UIPinchGestureRecognizer* twoFingerPinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerPinchHandler:)];
    [self.view addGestureRecognizer:twoFingerPinch];
}
- (void) twoFingerPinchHandler:(UIPinchGestureRecognizer*)sender {
    printf("Action: Two Finger Pinch, scale: %f\n", sender.scale);
}

- (void) gesture_pan {
    // UIPanGestureRecognizer 拖动
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 0, 0)];
    label.text = @"通过UIPanGestureRecognizer您可以拖动这张图片";
    [label sizeToFit];
    [self.view addSubview:label];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    UIImage* img = [UIImage imageNamed:@"gesture-ico"];
    [imgView setImage:img];
    [self.view addSubview:imgView];
    UIPanGestureRecognizer* oneFingerPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerPanHandler:)];
    // [oneFingerPan setMaximumNumberOfTouches:1];
    // [oneFingerPan setMinimumNumberOfTouches:1];
    [imgView setUserInteractionEnabled:YES];
    [imgView addGestureRecognizer:oneFingerPan];
}
- (void) oneFingerPanHandler:(UIPanGestureRecognizer*)sender {
    CGPoint point = [sender translationInView:self.view];
    printf("Action: Pan From (%f, %f)\n", point.x, point.y);
    sender.view.center = CGPointMake(sender.view.center.x + point.x, sender.view.center.y + point.y);
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
}

- (void) gesture_swipe {
    // UISwipeGestureRecognizer 滑动手势
    UISwipeGestureRecognizer* twoFingerSwipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerSwipeUpHandler:)];
    [twoFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionUp]; // 向上
    [twoFingerSwipeUp setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerSwipeUp];
    
}
- (void) twoFingerSwipeUpHandler:(UISwipeGestureRecognizer*)sender {
    CGPoint point = [sender locationInView:self.view];
    printf("Action: 2 Fingers Swipe [Up] From (%f, %f)\n", point.x, point.y);
}

- (void) gesture_rotation {
    // UIRotationGestureRecognizer 两指旋转
    UIRotationGestureRecognizer* twoFingersRotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersRotateHandler:)];
    [self.view addGestureRecognizer:twoFingersRotate];
}
- (void) twoFingersRotateHandler:(UIRotationGestureRecognizer*)sender {
    printf("Action: Rotate in degree %f\n", [sender rotation] * 180 / M_PI);
}

- (void) gesture_longPress {
    // UILongPressGestureRecognizer 长按
    UILongPressGestureRecognizer* twoFingersLongPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersLongPressHandler:)];
    [twoFingersLongPress setNumberOfTouchesRequired:2];
    [twoFingersLongPress setMinimumPressDuration:2.0]; // 至少按2s
    [self.view addGestureRecognizer:twoFingersLongPress];
}
- (void) twoFingersLongPressHandler:(UILongPressGestureRecognizer*)sender {
    printf("Action: 2 Fingers Press For at least 2 seconds!\n");
}

@end

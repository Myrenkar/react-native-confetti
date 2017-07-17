//
//  ConfettiView.m
//  RNConfetti
//
//  Created by Piotr Torczynski on 14/06/2017.
//  Copyright © 2017 Netguru. All rights reserved.
//

#import "ConfettiView.h"

@interface ConfettiView()

@property (strong, nonatomic) CAEmitterLayer *emmiter;
@property (strong, nonatomic) NSArray<UIColor *> *colors;
@property (nonatomic) float intensity;
@property (nonatomic) ConfettiType type;
@property (nonatomic) BOOL isActive;

@end

@implementation ConfettiView

#pragma mark Public

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setTypeValue:(ConfettiType)type {
    self.type = type;
}

- (void)start {
    [self startConfetti];
}

- (void)stop {
    self.emmiter.birthRate = 0;
    self.isActive = NO;
}

- (BOOL)isActive {
    return self.isActive;
}

- (void)setIntensityValue:(float)intensity {
    self.intensity = intensity;
}

#pragma mark Private

- (void)startConfetti {
    self.emmiter = [[CAEmitterLayer alloc] init];

    self.emmiter.emitterPosition = CGPointMake(self.frame.size.width / 2.0, 0);
    self.emmiter.emitterShape = kCAEmitterLayerLine;
    self.emmiter.emitterSize = CGSizeMake(self.frame.size.width, 1);

    NSArray<CAEmitterCell *> *cells = [[NSArray alloc] init];

    for (UIColor *color in self.colors) {
        [cells arrayByAddingObject:[self confettiWithColor:color]];
    }
    
    self.emmiter.emitterCells = cells;
    [self.layer addSublayer:self.emmiter];
    self.isActive = YES;
}

- (void)setup {
    self.colors = @[
        [UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0],
        [UIColor colorWithRed:1.0 green:0.78 blue:0.36 alpha:1.0],
        [UIColor colorWithRed:0.48 green:0.78 blue:0.64 alpha:1.0],
        [UIColor colorWithRed:0.30 green:0.76 blue:0.85 alpha:1.0],
        [UIColor colorWithRed:0.58 green:0.39 blue:0.55 alpha:1.0]
    ];

    self.intensity = 0.5;
    self.type = ConfettiTypeConfetti;
    self.isActive = NO;
}


- (CAEmitterCell *)confettiWithColor:(UIColor *)color {
    CAEmitterCell *confettiCell = [[CAEmitterCell alloc] init];
    confettiCell.birthRate = 6.0 * self.intensity;
    confettiCell.lifetime = 14.0 * self.intensity;
    confettiCell.lifetimeRange = 0;
    confettiCell.color = [color CGColor];
    confettiCell.velocity = (CGFloat)(350.0 * self.intensity);
    confettiCell.velocityRange = (CGFloat)(80.0 * self.intensity);
    confettiCell.emissionLongitude = (CGFloat)M_PI;
    confettiCell.emissionRange = (CGFloat)M_PI_4;
    confettiCell.spin = (CGFloat)(3.5 * self.intensity);
    confettiCell.spinRange = (CGFloat)(4.0 * self.intensity);
    confettiCell.scaleRange = (CGFloat)(self.intensity);
    confettiCell.scaleSpeed = (CGFloat)(-0.1 * self.intensity);
    confettiCell.contents = [self imageForType:self.type];
    return  confettiCell;
}

- (UIImage *)imageForType:(ConfettiType)type {
    return [UIImage imageNamed:[self getFilenameWithType:type]];
}

- (NSString *)getFilenameWithType:(ConfettiType)type {
    switch (type) {
        case ConfettiTypeConfetti:
            return @"confetti";
            break;
        case ConfettiTypeStar:
            return @"star";
        case ConfettiTypeDiamond:
            return @"diamond";
            break;
        case ConfettiTypeTriangle:
            return @"triangle";
            break;
    }
}

@end

//
//  UIActivity+Blocks.m
//  NiceClipper
//
//  Created by Ryu Iwasaki on 2013/10/04.
//  Copyright (c) 2013年 Ryu Iwasaki. All rights reserved.
//

#import "UIActivity+Blocks.h"
#import <objc/runtime.h>

@implementation UIActivity (Blocks)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

// Property Method
#pragma mark  - Property
- (void((^)()))actionBlock{
    id result = objc_getAssociatedObject(self, @"actionBlock");
    return [result copy];
}

- (void)setActionBlock:(void(^)())block
{
    objc_setAssociatedObject(self, @"actionBlock", block, OBJC_ASSOCIATION_COPY);
}

- (NSString *)activityType{
    NSString *type = objc_getAssociatedObject(self, @"activityType");
    return type;
}

- (void)setActivityType:(NSString *)type{
    objc_setAssociatedObject(self, @"activityType", type, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)activityTitle{
    NSString *title = objc_getAssociatedObject(self, @"activityTitle");
    return title;
}

- (void)setActivityTitle:(NSString *)title{
    objc_setAssociatedObject(self, @"activityTitle", title, OBJC_ASSOCIATION_ASSIGN);
}

- (UIImage *)activityImage{
    UIImage *image = objc_getAssociatedObject(self, @"activityImage");
    return image;
}

- (void)setActivityImage:(UIImage *)image{
    objc_setAssociatedObject(self, @"activityImage", image, OBJC_ASSOCIATION_ASSIGN);
}

// Action
#pragma mark  - Action
- (void)performActivity{
    
    self.actionBlock();
    
	[self activityDidFinish:YES];
}

#pragma clang diagnostic pop

#pragma mark  - Initialize

+ (id)activityWithType:(NSString *)type
                 title:(NSString *)title
                 image:(UIImage *)image
           actionBlock:(void (^)())actionBlock{
    
    UIActivity *activity = [[self alloc]init];
    
    if (activity) {
        
        activity.activityType = type;
        activity.activityTitle = title;
        activity.activityImage = image;
        activity.actionBlock = actionBlock;
        
    }
    
    return activity;
}

@end

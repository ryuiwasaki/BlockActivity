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
        if (image) {
            activity.activityImage = image;
        } else {
            activity.activityImage = createImageFromColor([UIColor blackColor],CGRectMake(0, 0, 1, 1));
        }
        
        activity.actionBlock = actionBlock;
        
    }
    
    return activity;
}

UIImage *(^createImageFromColor)(UIColor *,CGRect) = ^(UIColor *color,CGRect frame)
{
    CGRect rect = frame;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [color CGColor]);
    CGContextFillRect(contextRef, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
};

@end

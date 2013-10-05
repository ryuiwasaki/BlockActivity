//
//  BlockActivity.m
//  NiceClipper
//
//  Created by Ryu Iwasaki on 2013/10/04.
//  Copyright (c) 2013年 Ryu Iwasaki. All rights reserved.
//

#import "BlockActivity.h"

@implementation BlockActivity


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems{
    
	for (id activityItem in activityItems) {
        
        if ([activityItem isKindOfClass:[NSString class]]){
            return YES;
        }
    }
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems{
    
}



@end

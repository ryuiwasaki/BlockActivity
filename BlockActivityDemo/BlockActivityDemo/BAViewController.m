//
//  BAViewController.m
//  BlockActivityDemo
//
//  Created by Ryu Iwasaki on 2013/10/05.
//  Copyright (c) 2013年 Ryu Iwasaki. All rights reserved.
//

#import "BAViewController.h"
#import "BlockActivity.h"
@interface BAViewController ()

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showActivityView:(id)sender {
    
    BlockActivity *activity = [BlockActivity activityWithType:@"activity Type" title:@"activity Name" image:nil actionBlock:^{
        NSLog(@"Action here.");
    }];
    
    UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:@[@""] applicationActivities:@[activity]];
    [self presentViewController:vc animated:YES completion:nil];
}

@end

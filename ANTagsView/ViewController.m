//
//  ViewController.m
//  ANTagsView
//
//  Created by Adnan Nasir on 27/08/2015.
//  Copyright (c) 2015 Inasa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *tagsToDisplay = [[NSArray alloc] initWithObjects:@"fun",@"manicure", @"relax", @"cocktails", @"relax", @"cocktails", @"cocktails",@"relax", @"cocktails", @"cocktails", nil];
    ANTagsView *tagsView = [[ANTagsView alloc] initWithTags:tagsToDisplay];
//    [tagsView setTagCornerRadius:12];
//    [tagsView setTagBackgroundColor:[UIColor blueColor]];
//    [tagsView setTagTextColor:[UIColor whiteColor]];
//    [tagsView setBackgroundColor:[UIColor whiteColor]];
//    [tagsView setFrameWidth:300];
    [self.view addSubview:tagsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

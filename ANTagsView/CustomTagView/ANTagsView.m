//
//  ANTagsView.m
//  ANTagsView
//
//  Created by Adnan Nasir on 27/08/2015.
//  Copyright (c) 2015 Adnan Nasir. All rights reserved.
//

#import "ANTagsView.h"
#define TAG_SPACE_HORIZONTAL 10
#define TAG_SPACE_VERTICAL 5
#define DEFAULT_VIEW_HEIGHT 44
#define MAX_TAG_SIZE 300
#define MIN_TAG_SIZE 40
#define DEFAULT_VIEW_WIDTH 320
#define DEFAULT_TAG_CORNER_RADIUS 10
@implementation ANTagsView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(instancetype) initWithTags:(NSArray *)tagsArray
{
    self = [super init];
    if(self)
    {
        
        viewWidth = DEFAULT_VIEW_WIDTH;
        tagsToDisplay = tagsArray;
        maxTagSize = DEFAULT_VIEW_WIDTH - TAG_SPACE_HORIZONTAL;
        tagRadius = DEFAULT_TAG_CORNER_RADIUS;
        tagTextColor = [UIColor blueColor];
        tagBGColor = [UIColor grayColor];
        [self renderTagsOnView];
        
    }
    return self;
    
}
-(instancetype) initWithTags:(NSArray *)tagsArray frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
        viewWidth = frame.size.width;
        tagsToDisplay = tagsArray;
        maxTagSize = DEFAULT_VIEW_WIDTH - TAG_SPACE_HORIZONTAL;
        tagRadius = DEFAULT_TAG_CORNER_RADIUS;
        tagTextColor = [UIColor blueColor];
        tagBGColor = [UIColor grayColor];
        [self renderTagsOnView];
        
    }
    return self;
}

-(void) renderTagsOnView
{
    [self removeAllTags];
    
    tagXPos = TAG_SPACE_HORIZONTAL;
    tagYPos = TAG_SPACE_VERTICAL;
    viewHeight = DEFAULT_VIEW_HEIGHT;
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, viewWidth, viewHeight);
    for (NSString *tag in tagsToDisplay)
    {
        [self addTagInView:tag];
    }
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y+10, viewWidth, viewHeight+10);
}
-(void) setTagBackgroundColor:(UIColor *)color
{
    tagBGColor = color;
    for (UIView *view in self.subviews)
    {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel *tag = (UILabel *)view;
            tag.backgroundColor = tagBGColor;
        }
    }
}

-(void) removeAllTags
{
    
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
    
}
-(void) setFrameWidth:(int)width;
{
    viewWidth = width;
    maxTagSize = viewWidth - TAG_SPACE_HORIZONTAL;
    [self renderTagsOnView];
    
}

-(void) setTagTextColor:(UIColor *)color
{
    tagTextColor = color;
    for (UIView *view in self.subviews)
    {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel *tag = (UILabel *)view;
            tag.textColor = tagTextColor;
        }
    }
}

-(void) setTagCornerRadius:(int)radius
{
    tagRadius = radius;
    for (UIView *view in self.subviews)
    {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel *tag = (UILabel *)view;
            tag.layer.masksToBounds = YES;
            tag.layer.cornerRadius = tagRadius;
        }
    }
}
-(void) addTagInView:(NSString *)tag
{
    UILabel *tagLabel = [[UILabel alloc]init];
    UIFont *tagFont = [UIFont fontWithName:@"Arial" size:26];
    CGSize maximumLabelSize = CGSizeMake( maxTagSize, CGRectGetWidth(self.bounds) );
    
    CGSize expectedLabelSize = [tag sizeWithFont:tagFont
                               constrainedToSize:maximumLabelSize
                                   lineBreakMode:[tagLabel lineBreakMode]];
    if(expectedLabelSize.width < MIN_TAG_SIZE)
        expectedLabelSize.width = MIN_TAG_SIZE;
    NSLog(@"%f",expectedLabelSize.width);
    
    if((tagXPos + expectedLabelSize.width) > self.frame.size.width)
    {
        tagXPos = TAG_SPACE_HORIZONTAL;
        tagYPos += expectedLabelSize.height + TAG_SPACE_VERTICAL;
        viewHeight += expectedLabelSize.height + TAG_SPACE_HORIZONTAL;
    }
    
    tagLabel.frame = CGRectMake(tagXPos, tagYPos, expectedLabelSize.width, expectedLabelSize.height);
    tagLabel.text = tag;
    tagLabel.textAlignment = NSTextAlignmentCenter;
    tagLabel.backgroundColor = tagBGColor;
    tagLabel.textColor = tagTextColor;
    tagLabel.layer.masksToBounds = YES;
    tagLabel.layer.cornerRadius = tagRadius;
    [self addSubview:tagLabel];
    
    tagXPos += tagLabel.frame.size.width + TAG_SPACE_HORIZONTAL;
    
    
    
    
    
    
}



@end

//
//  ANTagsView.h
//  ANTagsView
//
//  Created by Adnan Nasir on 27/08/2015.
//  Copyright (c) 2015 Inasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANTagsView : UIView
{
    int tagXPos;
    int tagYPos;
    int viewHeight;
    int viewWidth;
    int tagRadius;
    int maxTagSize;
    NSArray *tagsToDisplay;
    UIColor *tagBGColor;
    UIColor *tagTextColor;
}

-(instancetype) initWithTags:(NSArray *)tagsArray;
-(void) setTagCornerRadius:(int)radius;
-(void) setTagBackgroundColor:(UIColor *)color;
-(void) setTagTextColor:(UIColor *)color;
-(void) setFrameWidth:(int)width;
@end

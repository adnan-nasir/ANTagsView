# ANTagsView
This is the dynamic view to add and display hash tags in iOS Applicaitons.

Usage
~~~~~

    ANTagsView *tagsView = [[ANTagsView alloc] initWithTags:<NSArray of HashTags>];
    [tagsView setTagCornerRadius:12];
    [tagsView setTagBackgroundColor:[UIColor blueColor]];
    [tagsView setTagTextColor:[UIColor whiteColor]];
    [tagsView setBackgroundColor:[UIColor whiteColor]];
    [tagsView setFrameWidth:300];
    //Height of the view will be calculated dynamically with respect to number of hash tags and width of each tag
    

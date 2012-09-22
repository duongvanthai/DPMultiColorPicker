//
//  UIView+RemoveAllSubviews.m
//  DPMultiColorPicker
//
//  Created by Kostas Antonopoulos on 9/22/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "UIView+RemoveAllSubviews.h"

@implementation UIView (RemoveAllSubviews)

-(void)removeAllSubviews{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}
@end

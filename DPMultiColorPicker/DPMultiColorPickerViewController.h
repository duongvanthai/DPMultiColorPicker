//
//  DPMultiColorPickerViewController.h
//  DPMultiColorPicker
//
//  Created by Kostas Antonopoulos on 9/22/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPMultiColorPickerViewController;

@protocol DPMultiColorPickerViewControllerDelegate <NSObject>

@required
-(void)multiColorPickerViewController:(DPMultiColorPickerViewController*)colorPickerVC didSelectColor:(UIColor*)color;

@end


@interface DPMultiColorPickerViewController : UIViewController

@property (nonatomic,strong) UIColor *activeColor;
@property (nonatomic,weak) id<DPMultiColorPickerViewControllerDelegate> delegate;
@end

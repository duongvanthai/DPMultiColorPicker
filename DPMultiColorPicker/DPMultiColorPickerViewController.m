//
//  DPMultiColorPickerViewController.m
//  DPMultiColorPicker
//
//  Created by Kostas Antonopoulos on 9/22/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPMultiColorPickerViewController.h"
#import "RSColorPickerView.h"
#import "RSBrightnessSlider.h"
#import "ColorViewController.h"
#import "UIView+RemoveAllSubviews.h"

@interface DPMultiColorPickerViewController ()<RSColorPickerViewDelegate,ColorViewControllerDelegate>{
    ColorViewController *pickerViewController;
}

@property (weak, nonatomic) IBOutlet UIView *selectionView;
@property (weak, nonatomic) IBOutlet UIView *selectedColorView;

@end

@implementation DPMultiColorPickerViewController
@synthesize selectionView;
@synthesize selectedColorView;
@synthesize delegate;
@synthesize activeColor;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    activeColor=[UIColor blueColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)selectorChanged:(UISegmentedControl*)sender {
    [selectionView removeAllSubviews];
    if (sender.selectedSegmentIndex==0) {
        [self loadPaletteView];
    }else if (sender.selectedSegmentIndex==1){
        [self loadPickerView];
    }
    
}

#pragma mark - Create Views
#pragma mark RSColorPicker

-(void)loadPickerView{
    UIColor *tempColor=activeColor;
    RSColorPickerView *colorPicker = [[RSColorPickerView alloc] initWithFrame:CGRectMake(10.0, 40.0, 300.0, 300.0)];

	[colorPicker setDelegate:self];
	[colorPicker setBrightness:1.0];
	[colorPicker setCropToCircle:NO]; // Defaults to YES (and you can set BG color)
	[colorPicker setBackgroundColor:[UIColor clearColor]];
	
	RSBrightnessSlider *brightnessSlider = [[RSBrightnessSlider alloc] initWithFrame:CGRectMake(10.0, 360.0, 300.0, 30.0)];
	[brightnessSlider setColorPicker:colorPicker];
	[brightnessSlider setUseCustomSlider:YES]; // Defaults to NO
	

    // example of preloading a color
    // UIColor * aColor = [UIColor colorWithRed:0.803 green:0.4 blue:0.144 alpha:1];
    activeColor=tempColor;
    [colorPicker setSelectionColor:activeColor];
    [brightnessSlider setValue:[colorPicker brightness]];
    
	[selectionView addSubview:colorPicker];
	[selectionView addSubview:brightnessSlider];
}

-(void)colorPickerDidChangeSelection:(RSColorPickerView *)cp{
    [self didSelectColor:cp.selectionColor];
}

#pragma mark ColorPopover (palette)

-(void)loadPaletteView{
    
    pickerViewController = [[ColorViewController alloc] init];
    pickerViewController.delegate = self;
    
    [selectionView addSubview:pickerViewController.view];
}

- (void)colorPopoverControllerDidSelectColor:(NSString *)hexColor{
    [self didSelectColor:[GzColors colorFromHex:hexColor]];
}

#pragma mark - Color Selected

-(void)didSelectColor:(UIColor*)color{
    activeColor=color;
    [selectedColorView setBackgroundColor:color];
    [delegate multiColorPickerViewController:self didSelectColor:color];
}

@end

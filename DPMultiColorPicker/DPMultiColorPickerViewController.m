//
//  DPMultiColorPickerViewController.m
//  DPMultiColorPicker
//
//  Created by Kostas Antonopoulos on 9/22/12.
//  Copyright (c) 2012 Kostas Antonopoulos. All rights reserved.
//

#import "DPMultiColorPickerViewController.h"
#import "RSColorPickerView.h"

@interface DPMultiColorPickerViewController ()
@property (weak, nonatomic) IBOutlet UIView *selectionView;

@end

@implementation DPMultiColorPickerViewController

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
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)selectorChanged:(UISegmentedControl*)sender {
    if (sender.selectedSegmentIndex==0) {
        [self loadPaletteView];
    }else if (sender.selectedSegmentIndex==1){
        [self loadPickerView];
    }
    
}

#pragma mark - Create Views
#pragma mark RSColorPicker

-(void)loadPickerView{
    
}

#pragma mark ColorPopover (palette)

-(void)loadPaletteView{
    
}

@end

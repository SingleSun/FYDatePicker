//
//  ViewController.m
//  FYDatePickerDemo
//
//  Created by 樊杨 on 2017/3/27.
//  Copyright © 2017年 YHCRT.FY. All rights reserved.
//

#import "ViewController.h"
#import "CurrentDate.h"
#import "FYDatePickerView.h"
@interface ViewController ()<FYDatePickerCancelDelegate,FYDatePickerConfirmDeleage>

@property(nonatomic,strong)UILabel * dateLabel;

@property(nonatomic,strong)FYDatePickerView * datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 150, 40)];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    
    _dateLabel.text = [CurrentDate GetCurrentDate];
    
    _dateLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DatePicker)];
    
    [_dateLabel addGestureRecognizer:tap];
    
    [self.view addSubview:_dateLabel];


}

-(void)DatePicker{
    _datePicker = [[FYDatePickerView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300)];
    _datePicker.cancelDelegate = self;
    _datePicker.confirmDelegate = self;
    _datePicker.topViewColor = [UIColor darkGrayColor];
    _datePicker.datePickerType = DatePickerModeDate;
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, self.view.frame.size.height-300, self.view.frame.size.width, 300);
        [self.view addSubview:_datePicker];
    } completion:^(BOOL finished) {
        
    }];
}


-(void)cancelDate{
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    } completion:^(BOOL finished) {
        [_datePicker removeFromSuperview];
    }];
    
}

-(void)confirmDate:(NSString *)date{
    _dateLabel.text = date;
    [UIView animateWithDuration:0.5 animations:^{
        _datePicker.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    } completion:^(BOOL finished) {
        [_datePicker removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

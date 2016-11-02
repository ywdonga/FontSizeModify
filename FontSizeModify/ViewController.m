//
//  ViewController.m
//  FontSizeModify
//
//  Created by dyw on 16/10/20.
//  Copyright © 2016年 dyw. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FontSize.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ibLabel;
@property (weak, nonatomic) IBOutlet UIButton *ibButton;
@property (weak, nonatomic) IBOutlet UITextField *ibTf;
@property (weak, nonatomic) IBOutlet UITextView *ibTv;

@property (nonatomic, strong) UILabel *cdLabel;
@property (nonatomic, strong) UIButton *cdButton;
@property (nonatomic, strong) UITextField *cdTextField;
@property (nonatomic, strong) UITextView *cdTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [UIView setIgnoreTags:@[@(111), @(1)]];
    
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    self.cdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, screenSize.width, 30)];
//    self.cdLabel.font = [UIFont systemFontOfSize:17];
    self.cdLabel.text = @"标签测试字体";
    [self.view addSubview:self.cdLabel];
    
    self.cdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cdButton.tag = 1;
    self.cdButton.frame = CGRectMake(0, CGRectGetMaxY(self.cdLabel.frame), screenSize.width, 30);
    [self.cdButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    self.cdButton.titleLabel.font = [UIFont systemFontOfSize:17];
    self.cdButton.titleLabel.text = @"按钮测试字体";
    [self.view addSubview:self.cdButton];
    
    self.cdTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cdButton.frame), screenSize.width, 30)];
//    self.cdTextField.font = [UIFont systemFontOfSize:17];
    self.cdTextField.text = @"输入框测试字体";
    [self.view addSubview:self.cdTextField];
    
    self.cdTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cdTextField.frame), screenSize.width, 40)];
//    self.cdTextView.font = [UIFont systemFontOfSize:17];
    self.cdTextView.text = @"文本视图测试字体";
    [self.view addSubview:self.cdTextView];
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    NSLog(@"\nlb->%@  \nbt->%@  \ntf->%@  \ntv->%@", self.ibLabel.font, self.ibButton.titleLabel.font, self.ibTf.font, self.ibTv.font);
    
    
    NSLog(@"\nlb->%@  \nbt->%@  \ntf->%@  \ntv->%@", self.cdLabel.font, self.cdButton.titleLabel.font, self.cdTextField.font, self.cdTextView.font);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

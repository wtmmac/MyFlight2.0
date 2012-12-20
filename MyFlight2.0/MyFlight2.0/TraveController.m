//
//  TraveController.m
//  MyFlight2.0
//
//  Created by WangJian on 12-12-16.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import "TraveController.h"

@interface TraveController ()

@end

@implementation TraveController

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
    self.postView.hidden = YES;
    
    name.delegate = self;
    address.delegate = self;
    phone.delegate = self;
    city.delegate = self;
    
    UIButton * backBtn_ = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn_.frame = CGRectMake(10, 5, 30, 31);
    backBtn_.titleLabel.font = [UIFont systemFontOfSize:13.0];
    backBtn_.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_return_.png"]];
    [backBtn_ addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBtn1=[[UIBarButtonItem alloc]initWithCustomView:backBtn_];
    self.navigationItem.leftBarButtonItem=backBtn1;
    [backBtn1 release];
    
    UIButton * histroyBut = [UIButton buttonWithType:UIButtonTypeCustom];
    histroyBut.frame = CGRectMake(250, 5, 50, 31);
    histroyBut.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [histroyBut setTitle:@"确定" forState:UIControlStateNormal];
    histroyBut.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_2words_.png"]];
    [histroyBut addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBtn=[[UIBarButtonItem alloc]initWithCustomView:histroyBut];
    self.navigationItem.rightBarButtonItem=backBtn;
    [backBtn release];

    
    noNeedBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    helpYourselfBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    post.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)noNeed:(id)sender {

    _schedule_ = @"不需要行程单";
    noNeedBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Selected_.png"]];
    helpYourselfBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    post.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    
    self.postView.hidden = YES;
}

- (IBAction)helpYourself:(id)sender {
    _schedule_ = @"机场自取";
    noNeedBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    helpYourselfBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Selected_.png"]];
    post.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    self.postView.hidden = YES;
}

- (IBAction)post:(id)sender {
    _schedule_ = @"邮寄行程单";
    noNeedBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    helpYourselfBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Default_.png"]];
    post.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_Selected_.png"]];
    self.postView.hidden = NO;
}
- (void)dealloc {
    [_postView release];
    [noNeedBtn release];
    [helpYourselfBtn release];
    [post release];
    [name release];
    [city release];
    [address release];
    [phone release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setPostView:nil];
    [noNeedBtn release];
    noNeedBtn = nil;
    [helpYourselfBtn release];
    helpYourselfBtn = nil;
    [post release];
    post = nil;
    [name release];
    name = nil;
    [city release];
    city = nil;
    [address release];
    address = nil;
    [phone release];
    phone = nil;
    [super viewDidUnload];
}

-(void)getDate:(void (^) (NSString *schedule, NSString *postPay))string
{
    [blocks release];
    blocks = [string copy];

}
-(void)back
{
    blocks(_schedule_,@"");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGPoint ce=self.view.center;
    ce.y=self.view.frame.size.height/2;
    if (textField.center.y>180) {
        ce.y-=(textField.center.y-180);
    }
    [UIView beginAnimations:@"Curl"context:nil];//动画开始
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelegate:self];
    self.view.center=ce;
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    CGPoint ce=self.view.center;
    ce.y=self.view.frame.size.height/2;
    [UIView beginAnimations:@"Curl"context:nil];//动画开始
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelegate:self];
    self.view.center=ce;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES ;
}

@end
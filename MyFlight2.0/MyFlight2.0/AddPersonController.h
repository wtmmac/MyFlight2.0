//
//  AddPersonController.h
//  MyFlight2.0
//
//  Created by WangJian on 12-12-11.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonContact.h"
@class ChoosePersonController;
@class AddPersonCoustomCell;
@class AddPersonSwitchCell;
#import "ServiceDelegate.h"
@class AddPersonController;
#import "PersonTypeCell.h"
@protocol AddPersonControllerDelegate <NSObject>

@optional


- (void) AddPersonController:(AddPersonController *)controller ;



@end





@interface AddPersonController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIAlertViewDelegate,ServiceDelegate,UIActionSheetDelegate>
{
    UISwitch *mySwitch;
    void (^blocks) (NSString * name, NSString * identity);
    
    NSString * name;
    NSString * identityType;  // 成人或儿童
}

@property (nonatomic, retain) NSString * controllerType;  // 判断是哪一个Controller推进到次界面的

@property (nonatomic, retain) NSString * navTitleString; // 控制条文字


@property (nonatomic, retain) CommonContact * passenger;

@property (retain, nonatomic) IBOutlet UIView *delBtnView;

@property (nonatomic, assign) BOOL addBtnSelected;

@property (retain, nonatomic) IBOutlet UITableView *addPersonTableView;

@property (retain, nonatomic) IBOutlet AddPersonCoustomCell *addPersonCoustomCell;

@property (retain, nonatomic) IBOutlet AddPersonSwitchCell *addPersonSwithCell;

@property (retain, nonatomic) ChoosePersonController * choose;

@property(nonatomic,retain) NSArray * cellTitleArr;
@property(nonatomic,retain) NSMutableArray * cellTextArr;
- (IBAction)delPassenger:(id)sender;
@property (retain, nonatomic) IBOutlet PersonTypeCell *typeCell;

@property (retain, nonatomic) IBOutlet UITableView *typeTableView;


@property (retain, nonatomic) NSMutableArray * typeArr;    // 儿童，成人
@property (retain, nonatomic) NSMutableArray * typeArrText;

@property (retain, nonatomic) NSMutableArray * certArr;    // 身份证，护照
@property (retain, nonatomic) NSMutableArray * certArrText;


-(void)getDate:(void (^) (NSString * name, NSString * identity))string;
@end

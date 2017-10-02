//
//  LoginViewController.m
//  IOSChallenge29092017
//
//  Created by Macbook  on 9/29/17.
//  Copyright © 2017 tuanbinh. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RegisterViewController.h"
#import "NSString+Validation.h"
#import "MBProgressHUD.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbLongText;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *tfLogin;
@property (weak, nonatomic) IBOutlet UILabel *lbPassword;
@property (weak, nonatomic) IBOutlet UILabel *lbRegister;
@property (nonatomic) NSString *validation;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) configUI{
    //
   
    //
    _validation = [[NSString alloc] init];
    //
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec auctor neque sed pretium luctus.";
    NSMutableAttributedString* attrString = [[NSMutableAttributedString  alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    [style setLineSpacing:5];
    [attrString addAttribute:NSParagraphStyleAttributeName
                       value:style
                       range:NSMakeRange(0, [text length ])];
    self.lbLongText.attributedText = attrString;
    
    //email style
    UIColor *color = [UIColor whiteColor];
    self.tfEmail.layer.borderColor= color.CGColor;
    self.tfEmail.layer.borderWidth = 1.0f;
    self.tfEmail.layer.cornerRadius = 20;
    self.tfEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: color}];
    //password style
    self.tfPassword.layer.borderColor= color.CGColor;
    self.tfPassword.layer.borderWidth = 1.0f;
    self.tfPassword.layer.cornerRadius = 20;
    self.tfPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    //Button Login
    self.tfLogin.layer.borderColor= [UIColor clearColor].CGColor;
    self.tfLogin.layer.borderWidth = 1.0f;
    self.tfLogin.layer.cornerRadius = 20;
    //
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registerClick)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.lbRegister addGestureRecognizer:tapGestureRecognizer];
    self.lbRegister.userInteractionEnabled = TRUE;
}

-(void)registerClick{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    RegisterViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Register"];
    [self presentViewController:viewController animated:TRUE completion:nil];
}
- (IBAction)acLogin:(id)sender {
    if([[self.tfEmail.text trim] length] == 0){
        [self showToast:@"Email null"];
        return;
    }else if(![self.tfEmail.text isValidEmail]){
        [self showToast:@"Email not valid"];
        return;
    }else if([[self.tfPassword.text trim] length] == 0){
        [self showToast:@"Password null"];
        return;
    }else if(![self.tfPassword.text isValidPassword]){
        [self showToast:@"Password not valid"];
        return;
    }else{
        _tfEmail.text = @"";
        _tfPassword.text = @"";
        [self showToast:@"Login Successfully"];
    }
}

- (void) showToast: (NSString *)mess{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    hud.label.text = mess;
    [hud hideAnimated:YES afterDelay:2];
}


@end

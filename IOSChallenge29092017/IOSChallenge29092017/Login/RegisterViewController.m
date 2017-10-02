//
//  RegisterViewController.m
//  IOSChallenge29092017
//
//  Created by Macbook  on 10/2/17.
//  Copyright © 2017 tuanbinh. All rights reserved.
//

#import "RegisterViewController.h"
#import "MBProgressHUD.h"
#import "NSString+Validation.h"


@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbAddImage;
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btRegister;
@property (weak, nonatomic) IBOutlet UILabel *lbLongText;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) configUI{
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.Donec auctor neque sed pretium luctus.";
    NSMutableAttributedString* attrString = [[NSMutableAttributedString  alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter];
    [style setLineSpacing:5];
    [attrString addAttribute:NSParagraphStyleAttributeName
                       value:style
                       range:NSMakeRange(0, [text length ])];
    self.lbLongText.attributedText = attrString;
    //
    NSString *text1 = @"Add Photo";
    NSMutableAttributedString* attrString1 = [[NSMutableAttributedString  alloc] initWithString:text1];
    NSMutableParagraphStyle *style1 = [[NSMutableParagraphStyle alloc] init];
    [style1 setAlignment:NSTextAlignmentCenter];
    [style1 setLineSpacing:5];
    [attrString1 addAttribute:NSParagraphStyleAttributeName
                       value:style1
                       range:NSMakeRange(0, [text1 length ])];
    self.lbAddImage.attributedText = attrString1;
    //init Text field
    [self initTextField:self.tfName plaintText:@"Name and Surname"];
    [self initTextField:self.tfEmail plaintText:@"Email Address"];
    [self initTextField:self.tfPhone plaintText:@"Phone"];
    [self initTextField:self.tfPassword plaintText:@"Password"];
    //init button
    self.btRegister.layer.borderColor= [UIColor clearColor].CGColor;
    self.btRegister.layer.borderWidth = 1.0f;
    self.btRegister.layer.cornerRadius = 20;
    //init ImageView
    UIColor *color = [UIColor whiteColor];
    self.imgAvatar.layer.borderColor= color.CGColor;
    self.imgAvatar.layer.borderWidth = 1.0f;
    self.imgAvatar.layer.cornerRadius = self.imgAvatar.frame.size.height/2;
    self.imgAvatar.clipsToBounds = TRUE;
}
- (void) initTextField: (UITextField *)view plaintText:(NSString*) text{
    UIColor *color = [UIColor whiteColor];
    view.layer.borderColor= color.CGColor;
    view.layer.borderWidth = 1.0f;
    view.layer.cornerRadius = 20;
    view.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName: color}];
}
- (IBAction)acRegister:(id)sender {
    if([_tfName.text trim].length == 0){
        [self showToast:@"Name null"];
        return;
    }else if([_tfEmail.text trim].length == 0){
         [self showToast:@"Email null"];
        return;
    }else if(![_tfEmail.text isValidEmail]){
         [self showToast:@"Email not valid"];
        return;
    }else if([_tfPhone.text trim].length == 0){
         [self showToast:@"Phone null"];
        return;
    }else if(![_tfPhone.text isValidPhoneNumber]){
         [self showToast:@"Phone not valid"];
        return;
    }else if([_tfPassword.text trim].length == 0){
         [self showToast:@"Password null"];
        return;
    }else if(![_tfPassword.text isValidPassword]){
         [self showToast:@"Password not valid"];
        return;
    }else{
        [self showToast:@"Register successfully"];
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self dismissViewControllerAnimated:TRUE completion:nil];
        });
        
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

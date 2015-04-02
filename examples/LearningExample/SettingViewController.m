//
//  SettingViewController.m
//  LearningExample
//
//  Created by chksong on 15-4-1.
//
//

#import "SettingViewController.h"
#import "SquareCamViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.textLabelServerIP.text = [userDefaults objectForKey:@"serverip"] ;
    self.textLabelName.text     = [userDefaults objectForKey:@"labelname"] ;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (void)dealloc {
    
    [_textLabelName release];
    [_textLabelServerIP release];
    [super dealloc];
}



- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

-(BOOL)isValidatIP:(NSString *)ipAddress{
    
    NSString  *urlRegEx =@"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5]):[0-9]{2,10}$";
    
    NSString  *urlRegEx_2=@"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
    "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
    
    NSPredicate *urlTest2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx_2];
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    
    return [urlTest evaluateWithObject:ipAddress] | [urlTest2 evaluateWithObject:ipAddress];
    
}


- (IBAction)saveSetting:(id)sender {
    
 
    
    
    NSString* strServerIP = self.textLabelServerIP.text ;
    if ( FALSE == [self isValidatIP:strServerIP]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"请输入有效IP的地址" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] ;
        
        [alertView show];
        
        return ;
    }
    
    NSString *  strLabelName = self.textLabelName.text ;
    if ([strLabelName length] <1 ) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"保存的训练文件名称为空" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] ;
        
        [alertView show];
        
        return ;
    }
    
    //保存配置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:strServerIP forKey:@"serverip"] ;
    [userDefaults setObject:strLabelName forKey:@"labelname"] ;
    [userDefaults synchronize] ;
    
    SquareCamViewController* scvt = (SquareCamViewController*) self.delegate ;
    
    scvt.strServerIP = strServerIP ;
    scvt.strPredictionsName = strLabelName ;
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
    
}



@end

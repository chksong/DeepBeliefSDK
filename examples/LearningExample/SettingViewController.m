//
//  SettingViewController.m
//  LearningExample
//
//  Created by chksong on 15-4-1.
//
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (IBAction)saveSetting:(id)sender {
    
    NSString *  strLabelName = self.textLabelName.text ;
    if ([strLabelName length] <1 ) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"保存的训练文件名称为空" delegate:nil cancelButtonTitle:@"" otherButtonTitles:nil, nil] ;
        
        [alertView show];
        
        return ;
    }
    
}



@end

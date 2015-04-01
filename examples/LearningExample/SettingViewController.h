//
//  SettingViewController.h
//  LearningExample
//
//  Created by chksong on 15-4-1.
//
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController

- (IBAction)cancel:(id)sender;

@property (retain, nonatomic) IBOutlet UITextField *textLabelName;

@property (retain, nonatomic) IBOutlet UITextField *textLabelServerIP;

@end

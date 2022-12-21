//
//  PubkeyViewController.m
//  PincruxOBJSample
//
//  Created by K_JINY on 2022/07/25.
//

#import <Foundation/Foundation.h>
#import "PubkeyViewController.h"

@interface PubkeyViewController ()

@end

@implementation CustomNavi
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
@end

@implementation PubkeyViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pubkeyF.text = [self getCustomPubkey];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)setCustomPubkey:(NSString *)pubkey {
    [[NSUserDefaults standardUserDefaults] setObject:self.pubkeyF.text forKey:@"offerwallPubKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)getCustomPubkey {
    NSString *customPubkey = [[NSUserDefaults standardUserDefaults] stringForKey:@"offerwallPubKey"];
    return customPubkey;
}

- (IBAction)customStartBtt:(id)sender {
    if([self.pubkeyF.text length] == 0) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"PubKey를 입력하세요"
                                                                        message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }else {
        [self setCustomPubkey:self.pubkeyF.text];
        
        SetOfferwallViewController *settingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"setOfferwallVC"];
        settingVC.pubkey = self.pubkeyF.text;
        [self.navigationController pushViewController: settingVC animated:YES];
    }
}
@end

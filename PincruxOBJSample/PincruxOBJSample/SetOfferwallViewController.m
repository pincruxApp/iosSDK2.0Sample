//
//  SetOfferwallViewController.m
//  ObjcSample
//
//  Created by K_JINY on 2022/05/10.
//

#import <Foundation/Foundation.h>
#import "SetOfferwallViewController.h"

@interface SetOfferwallViewController()

@end

@implementation SetOfferwallViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.userkey = @"pincrux_test";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)initOfferwall {
    self.offerwall = [PincruxOfferwallSDK initWithPubkeyAndUsrkey:self.pubkey :self.userkey];
}

- (IBAction)barPush:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeNavigationPush];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)barModal:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeModal];
//    [self settingAndStart:self];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)barViewType:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeViewType];
//    [self settingAndStart:self];
    [self settingOfferwall];
    
    [self viewTypeStartOfferwall];
}

- (IBAction)barLandscapeModal:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeModal];
    [self.offerwall setOrientationLandscape:YES];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)premiumPush:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypePREMIUM_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeNavigationPush];
//    [self settingAndStart:self];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)premiumModal:(id)sender {
    [self.offerwall setOfferwallType: OfferwallTypePREMIUM_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeModal];
//    [self settingAndStart:self];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)premiumViewType:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypePREMIUM_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeViewType];
    [self settingOfferwall];
    
    [self viewTypeStartOfferwall];
}

- (IBAction)barPremiumPush:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_PREMIUM_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeNavigationPush];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)barPremiumModal:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_PREMIUM_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeModal];
    [self settingOfferwall];
    [self startOfferwall];
}

- (IBAction)barPremiumViewType:(id)sender {
    [self initOfferwall];
    [self.offerwall setOfferwallType: OfferwallTypeBAR_PREMIUM_TYPE];
    [self.offerwall setViewControllerType: ViewControllerTypeViewType];
    [self settingOfferwall];
    
    [self viewTypeStartOfferwall];
}

- (void)settingOfferwall {
    // Make tabs visible.
    [self.offerwall setEnableTab: YES];
    // Show the scroll button to the top.
    [self.offerwall setEnableScrollTopButton: YES];
    // Enables access to the advertisement detail page.
    [self.offerwall setAdDetail: YES];
    // Set a custom title for the Offerwall.
    [self.offerwall setOfferwallTitle: @"Offerwall"];
    // Set a custom color for the Offerwall.
    [self.offerwall setThemeColor: @""];
    // Running an offerwall in Unity
    [self.offerwall setUnityOfferwall: NO];
    // Disable CPS.
    [self.offerwall setDisableCPS: NO];
    // Set dark mode.
    [self.offerwall setDarkMode: DarkModeLIGHT_ONLY];
}

- (void)startOfferwall {
    [self.offerwall startOfferwallWithVc: self];
    NSLog(@"Offerwall Start");
}

- (void)viewTypeStartOfferwall {
    ViewTypeViewController *viewtypeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"viewTypeVC"];
    viewtypeVC.offerwall = self.offerwall;
    [self.navigationController pushViewController: viewtypeVC animated:YES];
}

@end


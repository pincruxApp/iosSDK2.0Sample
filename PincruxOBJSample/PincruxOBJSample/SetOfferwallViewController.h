//
//  SetOfferwallViewController.h.h
//  ObjcSample
//
//  Created by K_JINY on 2022/05/10.
//

#ifndef SetOfferwallViewController_h
#define SetOfferwallViewController_h

#import <UIKit/UIKit.h>
#import <PincruxOfferwall/PincruxOfferwall-Swift.h>
#import "ViewTypeViewController.h"

@interface SetOfferwallViewController : UIViewController

@property (strong, nonatomic) NSString *pubkey;
@property (strong, nonatomic) NSString *userkey;

@property (strong, nonatomic) PincruxOfferwallSDK *offerwall;

- (IBAction)barPush:(id)sender;
- (IBAction)barModal:(id)sender;
- (IBAction)barViewType:(id)sender;
- (IBAction)barLandscapeModal:(id)sender;


- (IBAction)premiumPush:(id)sender;
- (IBAction)premiumModal:(id)sender;
- (IBAction)premiumViewType:(id)sender;


@end

#endif /* SetOfferwallViewController_h */

//
//  ViewTypeViewController.h
//  ObjcSample
//
//  Created by K_JINY on 2022/05/10.
//

#ifndef ViewTypeViewController_h
#define ViewTypeViewController_h

#import <UIKit/UIKit.h>
#import <PincruxOfferwall/PincruxOfferwall-Swift.h>
#import "SetOfferwallViewController.h"

@interface ViewTypeViewController : UIViewController <OfferwallViewTypeDelegate>

@property (weak, nonatomic) IBOutlet UIView *customView;
@property (strong, nonatomic) PincruxOfferwallSDK *offerwall;

@end

#endif /* ViewTypeViewController_h */

//
//  PubkeyViewController.h
//  PincruxOBJSample
//
//  Created by K_JINY on 2022/07/25.
//

#ifndef PubkeyViewController_h
#define PubkeyViewController_h

#import "SetOfferwallViewController.h"

@interface CustomNavi : UINavigationController

@end

@interface PubkeyViewController : UIViewController

@property (strong, nonatomic) NSString *pubKey;
@property (strong, nonatomic) NSString *userKey;
@property (weak, nonatomic) IBOutlet UITextField *pubkeyF;

@end

#endif /* PubkeyViewController_h */

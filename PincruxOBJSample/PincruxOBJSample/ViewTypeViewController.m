//
//  ViewTypeViewController.m
//  ObjcSample
//
//  Created by K_JINY on 2022/05/10.
//

#import <Foundation/Foundation.h>
#import "ViewTypeViewController.h"

@interface ViewTypeViewController()

@end

@implementation ViewTypeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) enterForeground:(NSNotification *)note {
    [self.offerwall enterForeground];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.offerwall setViewtypeDelegate:self];
    [self.offerwall startOfferwallWithVc:self];
    [self setTitle:@"Offerwall"];
}

- (void)offerwallInitFailed:(NSInteger)errCode {
    NSLog(@"offerwallInitFailed");
}

- (void)offerwallInitSuccess { 
    NSLog(@"offerwallInitSuccess");
}

- (void)offerwallReceived:(UIView * _Nonnull)offerwallView { 
    NSLog(@"offerwallReceived");
    [self.customView addSubview:offerwallView];
    [self addContstraint: offerwallView];
}

- (void)offerwallAction {
    NSLog(@"offerwallAction");
}

- (void)addContstraint:(UIView *) view{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topC = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[view superview] attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *bottomC = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:[view superview] attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint *leadingC = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:[view superview] attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *trailingC = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:[view superview] attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    [[view superview] addConstraints:@[topC, bottomC, leadingC, trailingC]];
}

@end

//
//  DropAnimationController.m
//  Notes
//
//  Created by Tope Abayomi on 25/07/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "DropAnimationController.h"

@implementation DropAnimationController

-(id)init{
    self = [super init];
    
    if(self){
        
        self.presentationDuration = 1.0;
        self.dismissalDuration = 1.0;
    }
    
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return self.isPresenting ? self.presentationDuration : self.dismissalDuration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    if(self.isPresenting){
        [self executePresentationAnimation:transitionContext];
    }
    else{
        [self executeDismissalAnimation:transitionContext];
    }
    
}

-(void)executePresentationAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView* inView = [transitionContext containerView];
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView addSubview:toViewController.view];
    
    CGPoint centerOffScreen = inView.center;
    
    centerOffScreen.x = (2)*inView.frame.size.width;
    toViewController.view.center = centerOffScreen;
    
    [UIView animateWithDuration:self.presentationDuration delay:0.0f usingSpringWithDamping:0.9f initialSpringVelocity:10.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        toViewController.view.center = inView.center;
        fromViewController.view.alpha = 0.6;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}

-(void)executeDismissalAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView* inView = [transitionContext containerView];
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    CGPoint centerOffScreen = inView.center;
    centerOffScreen.x = (2)*inView.frame.size.width;
    
    [UIView animateWithDuration:self.presentationDuration delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        fromViewController.view.center = centerOffScreen;
        toViewController.view.alpha = 1.0;
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end

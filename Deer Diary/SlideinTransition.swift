//
//  SlideinTransition.swift
//  Deer Diary
//
//  Created by Clara Hung on 7/30/20.
//  Copyright © 2020 jenny and clara. All rights reserved.
//

import UIKit

class SlideinTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    //flag
    var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       guard let toViewController = transitionContext.viewController(forKey: .to),
        let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.width
        
        if isPresenting {
            //add menu VC to container
            containerView.addSubview(toViewController.view)
            
            //init frame off screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        //animate on to screen
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //animate back off screen
        let identity = {
            fromViewController.view.transform = .identity
        }
        
        //animation of transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
}
}

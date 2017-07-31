//
//  Animator.swift
//  iOS11AppStoreTransitions
//
//  Created by ohyesih on 29/07/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from) as? ViewController
        let toVC = transitionContext.viewController(forKey: .to) as? DetailViewController
        let initailFrame = fromVC!.cardView.frame
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toVC!.view)
        let toVCOldFrame = CGRect(x: 0, y: initailFrame.origin.y, width: initailFrame.size.width, height: initailFrame.size.height)
        let toVCNewFrame = toVC?.view.frame
        
        toVC?.view.frame = toVCOldFrame
        toVC?.view.alpha = 0
        toVC?.view.transform = CGAffineTransform(scaleX: toVCOldFrame.width / (toVCNewFrame?.width)!, y: toVCOldFrame.height / (toVCNewFrame?.height)!)
        
        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                toVC?.view.transform = CGAffineTransform(scaleX: 1, y: 1)
                toVC?.view.frame = toVCNewFrame!
                toVC?.view.alpha = 1
            })
            
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}

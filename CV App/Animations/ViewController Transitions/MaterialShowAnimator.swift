import UIKit

final class MaterialShowAnimator: NSObject { }

extension MaterialShowAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from),
            let overViewController = fromViewController as? UserInfoViewController,
            let button = overViewController.moreInfoButton
            else {
                return
        }
        
        let blackView = UIView(frame: overViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0
        overViewController.view.addSubview(blackView)
        
        let startFrame = button.frame
        
        toViewController.view.frame = startFrame
        toViewController.view.layer.cornerRadius = startFrame.height / 2.0
        transitionContext.containerView.addSubview(toViewController.view)
        
        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)
        
        animator.addAnimations {
            toViewController.view.frame = transitionContext.finalFrame(for: toViewController)
            toViewController.view.layer.cornerRadius = 0
            blackView.alpha = 1
        }
        
        animator.addCompletion { finished in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}

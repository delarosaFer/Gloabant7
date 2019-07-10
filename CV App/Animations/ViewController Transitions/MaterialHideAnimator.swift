import UIKit

final class MaterialHideAnimator: NSObject { }

extension MaterialHideAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from),
            let overViewController = toViewController as? UserInfoViewController,
            let button = overViewController.moreInfoButton
            else {
                return
        }
        
        let blackView = UIView(frame: overViewController.view.frame)
        blackView.backgroundColor = UIColor.black
        overViewController.view.addSubview(blackView)
        
        
        let transitionContainer = transitionContext.containerView
        transitionContainer.addSubview(toViewController.view)
        transitionContainer.addSubview(fromViewController.view)
        
        let animationTiming = UICubicTimingParameters(animationCurve: .easeInOut)
        
        let animator = UIViewPropertyAnimator(duration: transitionDuration(using: transitionContext), timingParameters: animationTiming)
        
        animator.addAnimations {
            fromViewController.view.frame = button.frame
            fromViewController.view.layer.cornerRadius = button.frame.height / 2
            blackView.alpha = 0
        }
        
        animator.addCompletion { finished in
            blackView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
        animator.startAnimation()
    }
}

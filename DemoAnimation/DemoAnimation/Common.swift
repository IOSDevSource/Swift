//
//  Common.swift
//  DemoAnimation
//
//  Created by iexm01 on 08/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit

class Common: NSObject {

    class func viwwFadein(view: UIView) {
        let transition = CATransition()
        transition.duration = 0.7
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFade
        view.layer.add(transition, forKey: nil)
    }

    class func viwwFromTop(view: UIView) {
        let transition = CATransition()
        transition.duration = 0.7
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromTop
        view.layer.add(transition, forKey: nil)
    }
    
    class func viwwFromBottom(view: UIView) {
        let transition = CATransition()
        transition.duration = 0.7
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        view.layer.add(transition, forKey: nil)
    }

    class func viwwLeft_ToRight(view: UIView) {
        let transition = CATransition()
        transition.duration = 0.7
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromLeft
        view.layer.add(transition, forKey: nil)
    }

    class func viwwRight_ToLeft(view: UIView) {
        let transition = CATransition()
        transition.duration = 0.7
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromRight
        view.layer.add(transition, forKey: nil)
    }

}

//
//  ViewController.swift
//  codepathDropboxWeek1
//
//  Created by Manuel Muñoz Solera on 9/16/15.
//  Copyright © 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var introImages: UIView!
    
    let leftSwipe = UISwipeGestureRecognizer()
    let rightSwipe = UISwipeGestureRecognizer()
    var position = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        leftSwipe.addTarget(self, action: Selector("swippedView:"))
        rightSwipe.addTarget(self, action: Selector("swippedView:"))
        view.userInteractionEnabled = true
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func swippedView(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            position = (position+1 > 2 ? 2 : position+1)
        }
        if (sender.direction == .Right) {
            position = (position-1 < 0 ? 0 : position-1)
        }
        animateView()
    }
    
    func animateView() {
        let animateTo = (-320*position)+480
        UIView.animateWithDuration(0.3, animations: {
            self.introImages.center = CGPoint(x: CGFloat(animateTo), y: self.introImages.center.y)
        })
    }

}


//
//  ViewController.swift
//  PFXIntro
//
//  Created by PFXStudio on 2020/03/14.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var leftAnimationView: AnimationView?
    var rightAnimationView: AnimationView?
    var deckAnimationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let leftAnimationView = AnimationView(name: "heart-jump")
        leftAnimationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        leftAnimationView.center = CGPoint(x: 0, y: self.view.center.y)
        leftAnimationView.contentMode = .scaleAspectFit
        leftAnimationView.loopMode = .autoReverse
        view.addSubview(leftAnimationView)
        leftAnimationView.play()
        self.leftAnimationView = leftAnimationView

        let rightAnimationView = AnimationView(name: "heart-jump")
        rightAnimationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        rightAnimationView.center = CGPoint(x: self.view.frame.width, y: self.view.center.y)
        rightAnimationView.contentMode = .scaleAspectFit
        rightAnimationView.loopMode = .autoReverse
        view.addSubview(rightAnimationView)
        rightAnimationView.play()
        self.rightAnimationView = rightAnimationView

        let deckAnimationView = AnimationView(name: "heart-deck")
        deckAnimationView.frame = CGRect(x: 0, y: self.view.center.y + 50, width: self.view.frame.width, height: 15)
//        deckAnimationView.center = CGPoint(x: self.view.frame.width, y: self.view.center.y)
        deckAnimationView.contentMode = .scaleAspectFill
        deckAnimationView.loopMode = .autoReverse
        view.addSubview(deckAnimationView)
        deckAnimationView.play()
        self.deckAnimationView = deckAnimationView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let leftAnimationView = self.leftAnimationView, let rightAnimationView = self.rightAnimationView else { return }
        UIView.animate(withDuration: 3, animations: {
            leftAnimationView.center = CGPoint(x: self.view.center.x - 14, y: self.view.center.y)
            rightAnimationView.center = CGPoint(x: self.view.center.x + 14, y: self.view.center.y)
            self.view.layoutIfNeeded()
        }) { result in
            UIView.animate(withDuration: 0.5, animations: {
                self.deckAnimationView?.alpha = 0
                self.label.alpha = 1
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}


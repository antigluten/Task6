//
//  ViewController.swift
//  Task6
//
//  Created by va-gusev on 18.05.2023.
//

import UIKit

class ViewController: UIViewController {

    let squareView = UIView()
    var animator: UIDynamicAnimator!
    var snapBehaviour: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(squareView)
        squareView.backgroundColor = .link
        squareView.layer.masksToBounds = true
        squareView.layer.cornerRadius = 12
        squareView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        squareView.center = view.center
        
        animator = UIDynamicAnimator(referenceView: view)
        snapBehaviour = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehaviour.damping = 1
        animator.addBehavior(snapBehaviour)

        let tap = UITapGestureRecognizer(target: self, action: #selector(handle))
        view.addGestureRecognizer(tap)
    }

    @objc func handle(_ recognizer: UITapGestureRecognizer) {
        let point = recognizer.location(in: view)
        snapBehaviour.snapPoint = point
    }
}

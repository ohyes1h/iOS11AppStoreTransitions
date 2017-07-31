//
//  ViewController.swift
//  iOS11AppStoreTransitions
//
//  Created by ohyesih on 29/07/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardViewDelegate, UIViewControllerTransitioningDelegate {
    let cardView = CardView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSubviews()
    }
    
    func setupSubviews() {

        view.addSubview(cardView)
        cardView.delegate = self
        cardView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func viewTapped() {
        let detailViewController = DetailViewController()
        detailViewController.transitioningDelegate = self
        present(detailViewController, animated: true, completion: nil)
    }
    
    //MARK: Transition Delegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Animator()
    }
}


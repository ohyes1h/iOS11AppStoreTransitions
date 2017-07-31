//
//  DetailViewController.swift
//  iOS11AppStoreTransitions
//
//  Created by ohyesih on 29/07/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, CardViewDelegate {
    var cardView = CardView(frame: .zero)
    var dismissButton = UIButton.init(type: UIButtonType.custom)
    var textView = UITextView.init(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        initCustomViews()
    }
    
    func setupSubviews() {
        view.backgroundColor = UIColor.white
        view.addSubview(cardView)
        cardView.delegate = self
        
        cardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        cardView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 7 / 6, constant: 0).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant:20).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:15).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-15).isActive = true
    }
    
    func initCustomViews() {
        
        dismissButton.setImage(UIImage(named: "cross"), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        
        textView.text = "Why won't the shorthand conference play? The fizzy ingredient frowns beneath a cupboard. The yeti apologizes. A miracle mutters above the pops disclaimer. When will the lager study past the spare regret? Should the opinion float the vote? The operational cosmology pretends to be a libel. The log rot reacts. The dustbin responds! A purpose disappears within his breeding friendship."
        textView.font = UIFont.init(name: "AppleSDGothicNeo-UltraLight", size: 20)
        textView.textColor = UIColor.init(white: 0.5, alpha: 1)
    }
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func viewTapped() {
//        dismiss(animated: true, completion: nil)
    }
}

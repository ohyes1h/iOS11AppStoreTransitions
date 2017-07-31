//
//  CardView.swift
//  iOS11AppStoreTransitions
//
//  Created by ohyesih on 29/07/2017.
//  Copyright © 2017 ohyes1h. All rights reserved.
//

import UIKit

protocol CardViewDelegate: class {
    func viewTapped()
}

class CardView: UIView {
    
    let coverImageView = UIImageView(image: UIImage.init(named: "monument_valley"))
    let featureLabel = UILabel.init(frame: .zero)
    let titleLabel = UILabel.init(frame: .zero)
    weak var delegate:CardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        initCustomViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        initCustomViews()
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(coverImageView)
        coverImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        coverImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        coverImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        coverImageView.contentMode = .scaleAspectFill
        
        featureLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(featureLabel)
        featureLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        featureLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        featureLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        titleLabel.topAnchor.constraint(equalTo: featureLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    func initCustomViews() {
        layer.cornerRadius = 5
        clipsToBounds = true
        
        featureLabel.text = "WORLD PREMIERE"
        featureLabel.textColor = UIColor.white
        featureLabel.font = UIFont.systemFont(ofSize: 16)
        
        titleLabel.text = "The Art of the Impossible"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapped))
        addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped() {
        delegate?.viewTapped()
    }
}

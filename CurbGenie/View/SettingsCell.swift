//
//  SettingsCell.swift
//  CurbGenie
//
//  Created by Colin Horsford on 1/9/19.
//  Copyright © 2019 Paerdegat. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    var setting: Settings? {
        didSet {
            nameLabel.text = setting?.name.rawValue
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate) //use withRenderingMode so you can change the tint when highlighted
                iconImageView.tintColor = .gray
            }
            
        }
    }
    
    //handles the highlighting of menu cells
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.mainColor() : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.darkGray
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.gray
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont (name: "Nunito-Regular", size: 16)
        label.textColor = .darkGray
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    @objc func setupViews() {
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
        //expands from left edge to right to the right edge fully
        addConstraintsWithFormat(format: "H:|-8-[v0(20)]-8-[v1]|", views: iconImageView,nameLabel) //horizontal axis
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel) //vertical axis
        addConstraintsWithFormat(format: "V:[v0(20)]", views: iconImageView) //vertical axis
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AirlineCell.swift
//  CurbGenie
//
//  Created by Colin Horsford on 12/2/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

class AirlineCell: UICollectionViewCell {
    
    //set airline name and image
    var airline: Airline? {
        didSet {
            guard let airlineImage = airline?.image else { return }
            guard let airlineName = airline?.name else { return }
            
            airlineImageView.image = UIImage(named: airlineImage)
            airlineLabel.text = airlineName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAirlineCell()
    }
    
    @objc func setupAirlineCell() {
        self.backgroundColor = .white
        
        self.addSubview(airlineImageView)
        self.addSubview(airlineLabel)
        
        _ = airlineImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 50)
        _ = airlineLabel.anchor(airlineImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        
        //set up cell shadow
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 3
    }
    
    let airlineImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let airlineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

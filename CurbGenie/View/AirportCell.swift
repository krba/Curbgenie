//
//  AirportCell.swift
//  CurbGenie
//
//  Created by Colin Horsford on 12/1/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

//cell construction for the table view
class AirportCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //create space around cell
        textLabel?.frame = CGRect(x: 60, y: textLabel!.frame.origin.y-2, width: self.frame.width - 56, height: textLabel!.frame.height)
        
        detailTextLabel?.frame = CGRect(x: 60, y: detailTextLabel!.frame.origin.y, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
    }
    
    let airportProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .white
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 20
        imageview.layer.masksToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        addSubview(airportProfileImageView)
        
        //airportProfileImageView Constraints
        airportProfileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        airportProfileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        airportProfileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        airportProfileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


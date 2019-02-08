//
//  SelectRentalController.swift
//  CurbGenie
//
//  Created by Colin Horsford on 12/3/18.
//  Copyright © 2018 Paerdegat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectRentalController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var airport: Airport?
    var airline: Airline?
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Select Rental Company"

        //custom back button
        let backButtonImage = UIImage(named: "back_btn")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        
        // Register cell classes
        collectionView?.register(CompanyCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //dismiss controller and goes back to BookingsController
    @objc func handleBackButton() {
        _ = navigationController?.popViewController(animated: true)
        print("Screen dismissed.")
    }
    
    //cancel and go back to root controller
    @objc func handleCancel() {
        self.navigationController?.popToRootViewController(animated: true)
        print("Cancel")
    }
    
    @objc func showConfirmationController() {
         
        let confirmationController = ConfirmationController()
        confirmationController.selectRentalController = self
        navigationController?.pushViewController(confirmationController, animated: true)
        
    }
    
    // MARK: - CollectionView setup

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return companies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CompanyCell
        
        cell.company = companies[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //sets value for global variable
        selectedCompany = companies[indexPath.item]
        
        HomeModel.getInstance().company = (selectedCompany?.name)!
        print("selectedCompany.name \(selectedCompany?.name) \(HomeModel.getInstance().company)")
        
        showConfirmationController() 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/3) - 16, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
    }

}

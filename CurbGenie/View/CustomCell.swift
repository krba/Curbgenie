import UIKit

class CustomCell: UITableViewCell
{    
    var cellButton: UIButton!
    var cellLabel: UILabel!
    
    var namelabel: UILabel!, namelabel1: UILabel!, datelabel: UILabel!, statuslabel: UILabel!, accountNamelabel: UILabel!, button: UIButton!, menubutton: UIButton!, menubutton1: UIButton!, menubutton2: UIButton!, menubutton3: UIButton!, menubutton4: UIButton!, menubutton5: UIButton!, menubutton6: UIButton!, menubutton7: UIButton!, menubutton8: UIButton!
    var iView : UIImageView!, iView_1 : UIImageView!, img : UIImage!, textfield = UITextField(), scrollView = UIScrollView(), namelabel2 = UILabel(), uiPicker = UIPickerView(), imv =  UIImageView(), collectionView : UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init()), dummyView2 = UIView(), dummyView3 = UIView();
    let width = UIScreen.main.bounds.size.width; let height = UIScreen.main.bounds.size.height
    init(frame: CGRect, title: Int)
    {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        let doneToolbar: UIToolbar = UIToolbar()
        
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        doneToolbar.items = [
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.hoopla)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.boopla)),
        ]
        
        doneToolbar.sizeToFit()
        
        if title == 500 // menu list shop by category
        {
            iView = UIImageView(frame: CGRect(x: 5, y: height * 3 / 100, width: frame.width * 15 / 100 - 10, height: height * 4 / 100)) // frame.width * 15 / 100
            addSubview(iView)
            
            namelabel2 = UILabel(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 3 / 100, width: frame.width * 80 / 100 - 10, height: height * 5 / 100))
            
            namelabel2.textAlignment = .left;         namelabel2.textColor = UIColor.black;
            namelabel2.font = UIFont(name: HomeModel.getInstance().font_bold, size: 12)
            namelabel2.numberOfLines = 0;             namelabel2.text = "test"
            addSubview(namelabel2)
            
            // LAPTOPS
            iView_1 = UIImageView(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 9 / 100, width: frame.width * 10 / 100 - 10, height: height * 4 / 100)) // frame.width * 15 / 100
            iView_1.image = UIImage(named: "bullet");
            addSubview(iView_1)
            
            button = UIButton(frame: CGRect(x: frame.width * 30 / 100 + 5, y: height * 8 / 100, width: frame.width * 70 / 100 - 10, height: height * 6 / 100));
            button.isExclusiveTouch = true;                                 button.setTitleColor(UIColor.black, for: []);
            button.setTitle("Laptops", for: []);                 button.layer.borderWidth = 1;
            button.layer.borderColor = UIColor.white.cgColor;      button.backgroundColor = UIColor(rgb: 0xFAFAFA)
            //img = UIImage(named: "cart") as UIImage?;                         button.setImage(img, forState: .Normal)
            button.titleLabel!.font =  UIFont(name: HomeModel.getInstance().font_bold, size: 11)
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            addSubview(button);
            
            // PCs
            iView_1 = UIImageView(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 15 / 100, width: frame.width * 10 / 100 - 10, height: height * 4 / 100)) // frame.width * 15 / 100
            iView_1.image = UIImage(named: "bullet");
            addSubview(iView_1)
            
            menubutton = UIButton(frame: CGRect(x: frame.width * 30 / 100 + 5, y: height * 14 / 100, width: frame.width * 70 / 100 - 10, height: height * 6 / 100));
            menubutton.isExclusiveTouch = true;                               menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("PCs", for: []);                  menubutton.layer.borderWidth = 1;
            menubutton.layer.borderColor = UIColor.white.cgColor;    menubutton.backgroundColor = UIColor(rgb: 0xFAFAFA)
            //img = UIImage(named: "cart") as UIImage?;                    button.setImage(img, forState: .Normal)
            menubutton.titleLabel!.font =  UIFont(name: HomeModel.getInstance().font_bold, size: 11)
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            addSubview(menubutton);
            
            // Tablets
            iView_1 = UIImageView(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 21 / 100, width: frame.width * 10 / 100 - 10, height: height * 4 / 100)) // frame.width * 15 / 100
            iView_1.image = UIImage(named: "bullet");
            addSubview(iView_1)
            
            menubutton1 = UIButton(frame: CGRect(x: frame.width * 30 / 100 + 5, y: height * 20 / 100, width: frame.width * 70 / 100 - 10, height: height * 6 / 100));
            menubutton1.isExclusiveTouch = true;                                menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("Tablets", for: []);               menubutton1.layer.borderWidth = 1;
            menubutton1.layer.borderColor = UIColor.white.cgColor;    menubutton1.backgroundColor = UIColor(rgb: 0xFAFAFA)
            //img = UIImage(named: "cart") as UIImage?;                    button.setImage(img, forState: .Normal)
            menubutton1.titleLabel!.font =  UIFont(name: HomeModel.getInstance().font_bold, size: 11)
            menubutton1.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            addSubview(menubutton1); 
            
            // IMACs
            iView_1 = UIImageView(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 27 / 100, width: frame.width * 10 / 100 - 10, height: height * 4 / 100)) // frame.width * 15 / 100
            iView_1.image = UIImage(named: "bullet");
            addSubview(iView_1)
            
            menubutton2 = UIButton(frame: CGRect(x: frame.width * 30 / 100 + 5, y: height * 26 / 100, width: frame.width * 70 / 100 - 10, height: height * 6 / 100));
            menubutton2.isExclusiveTouch = true;                                  menubutton2.setTitleColor(UIColor.black, for: []);
            menubutton2.setTitle("IMACs", for: []);                    menubutton2.layer.borderWidth = 1;
            menubutton2.layer.borderColor = UIColor.white.cgColor;       menubutton2.backgroundColor = UIColor(rgb: 0xFAFAFA)
            //img = UIImage(named: "cart") as UIImage?;                    button.setImage(img, forState: .Normal)
            menubutton2.titleLabel!.font =  UIFont(name: HomeModel.getInstance().font_bold, size: 11)
            menubutton2.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            addSubview(menubutton2);
            
            // Accessories
            iView_1 = UIImageView(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 33 / 100, width: frame.width * 10 / 100 - 10, height: height * 4 / 100)) // frame.width * 15 / 100
            iView_1.image = UIImage(named: "bullet");
            addSubview(iView_1)
            
            menubutton3 = UIButton(frame: CGRect(x: frame.width * 30 / 100 + 5, y: height * 32 / 100, width: frame.width * 70 / 100 - 10, height: height * 6 / 100));
            menubutton3.isExclusiveTouch = true;                                      menubutton3.setTitleColor(UIColor.black, for: []);
            menubutton3.setTitle("Accessories", for: []);                  menubutton3.layer.borderWidth = 1;
            menubutton3.layer.borderColor = UIColor.white.cgColor;           menubutton3.backgroundColor = UIColor(rgb: 0xFAFAFA)
            //img = UIImage(named: "cart") as UIImage?;                    button.setImage(img, forState: .Normal)
            menubutton3.titleLabel!.font =  UIFont(name: HomeModel.getInstance().font_bold, size: 11)
            menubutton3.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            addSubview(menubutton3);
        }
        
        if title == 400 // menu list
        {
            iView = UIImageView(frame: CGRect(x: frame.width * 5 / 100 + 5, y: height * 3 / 100, width: height * 4 / 100, height: height * 4 / 100)) // frame.width * 15 / 100
            addSubview(iView)
            
            namelabel2 = UILabel(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 2.6 / 100, width: frame.width * 80 / 100 - 10, height: height * 5 / 100))
            
            namelabel2.textAlignment = .left;         namelabel2.textColor = UIColor.white;
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            else
            {
                namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            } 
            
            namelabel2.numberOfLines = 0;       namelabel2.text = "test"
            addSubview(namelabel2)
        }
        
        if title == 401 // menu list
        {
            //iView = UIImageView(frame: CGRectMake(5, height * 4 / 100, frame.width * 15 / 100 - 10, height * 4 / 100 )) // frame.width * 15 / 100 - 4
            //addSubview(iView)
            
            //namelabel2 = UILabel(frame: CGRectMake(frame.width * 20 / 100 + 5, height * 3.5 / 100, frame.width * 80 / 100 - 10, height * 5 / 100))
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel2 = UILabel(frame: CGRect(x: 10, y: height * 3.5 / 100, width: frame.width - 10, height: height * 8 / 100))
                namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            else
            {   namelabel2 = UILabel(frame: CGRect(x: 10, y: height * 3.5 / 100, width: frame.width - 10, height: height * 5 / 100))
                namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            
            namelabel2.textAlignment = .left;         namelabel2.textColor = UIColor.white;
            namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12)) //
            namelabel2.numberOfLines = 0;       namelabel2.text = "test"
            addSubview(namelabel2)
        }
        
        if title == 50 // menu list
        {
            //iView = UIImageView(frame: CGRectMake(5, height * 4 / 100, frame.width * 10 / 100 - 10, height * 4 / 100 )) // frame.width * 15 / 100 - 4
            //iView.image = UIImage(named: "bullet");
            //addSubview(iView)
            
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: 5, y: height * 2 / 100 + 5, width: height * 6 / 100 - 10, height: height * 6 / 100 - 10)
            //menubutton.backgroundColor = UIColor(rgb: 0x269FF5);                                   //img = UIImage(named: "menu_icon") as UIImage?
            //menubutton.setImage(img, forState: .Normal) // home fbfeff .blueColor();
            addSubview(menubutton)
            
            namelabel2 = UILabel(frame: CGRect(x: frame.width * 20 / 100 + 5, y: height * 2 / 100, width: frame.width * 80 / 100 - 10, height: height * 6 / 100))
            namelabel2.textAlignment = .left;         namelabel2.textColor = UIColor.white;
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                namelabel2.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 16))
            }
            
            namelabel2.numberOfLines = 0;       namelabel2.text = "test"
            addSubview(namelabel2)
            
            iView_1 = UIImageView(frame: CGRect(x: frame.width * 90 / 100 + 5, y: height * 4 / 100, width: frame.width * 10 / 100 - 10, height: height * 4 / 100 )) // frame.width * 15 / 100 - 4
            iView_1.image = UIImage(named: "forward");
            //addSubview(iView_1)
            
            let lineView = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
            lineView.backgroundColor = UIColor.black
            //addSubview(lineView)
        }
        
        if title == 100 // search_page
        {
            namelabel = UILabel(frame: CGRect(x: 5, y: 2, width: frame.width - 10, height: frame.height - 4))
            namelabel.textColor = UIColor.white;         //namelabel.font = UIFont.systemFontOfSize(namelabel.font.pointSize - 6)
            namelabel.textAlignment = .left;                    namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 15)
            namelabel.numberOfLines = 0;                        namelabel.text = "Nettradez - Home"
            addSubview(namelabel)
        }
        
        if title == 0 // 1 Spoguide header with back button and heading center
        {
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            if UIDevice.current.userInterfaceIdiom == .pad
            { menubutton.frame = CGRect(x: frame.width * 2 / 100 + 5, y: height * 2 / 100, width: height * 2.5 / 100, height: height * 2.5 / 100) }
            else { menubutton.frame = CGRect(x: frame.width * 2 / 100 + 5, y: height * 3 / 100, width: frame.width * 20 / 100 - 10, height: height * 5 / 100) }
            
            menubutton.backgroundColor = UIColor(rgb: 0x269FF5);
            img = UIImage(named: "menu_icon") as UIImage?;        menubutton.setImage(img, for: []) // home fbfeff .blueColor();
            //menubutton.setTitle("< Back", for: []);
            //menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.contentMode = .left
            menubutton.imageView?.contentMode = .scaleAspectFit 
            
            addSubview(menubutton)
            
            //
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 30 / 100, y: height * 1.5 / 100, width: frame.width * 80 / 100, height: height * 4.25 / 100))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 15))
            }
            else
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 40 / 100, y: height * 3 / 100, width: frame.width * 80 / 100, height: height * 5 / 100))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 20))
            }
            
            namelabel.textColor = UIColor.white;           namelabel.textAlignment = .center;
            namelabel.numberOfLines = 0;                          namelabel.text = "Nettradez"
            //addSubview(namelabel)
            
            //refresh icon
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1 = UIButton(frame: CGRect(x: frame.width * 20 / 100, y: height * 3 / 100, width: frame.width * 60 / 100, height: height * 5 / 100 ) );
            menubutton1.isExclusiveTouch = true; menubutton1.isHidden = true
            addSubview(menubutton1)
            
            //refresh icon
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2 = UIButton(frame: CGRect(x: frame.width * 20 / 100, y: height * 3 / 100, width: frame.width * 60 / 100, height: height * 5 / 100 ) );
            menubutton2.isExclusiveTouch = true; menubutton2.isHidden = true
            addSubview(menubutton2)
            
            let dummyView = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width , height: 1 ) );
            dummyView.backgroundColor = UIColor(rgb: 0xf2f2f2)
            addSubview(dummyView)
        }
        
        if title == 20 // Spoguide big heading (Want our advice?)
        {
            //
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 30 / 100, y: height * 1.5 / 100, width: frame.width * 80 / 100, height: frame.height ) )
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 15))
            }
            else
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 40 / 100, y: 0, width: frame.width * 80 / 100, height: frame.height))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: HomeModel.getInstance().get_font_size(font_size: 20))
            }
            
            namelabel.textColor = UIColor.black;           namelabel.textAlignment = .center;
            namelabel.numberOfLines = 0;                          namelabel.text = "Want our advice?"
            addSubview(namelabel)
        }
        
        if title == 21 // Spoguide small heading (To give you best experience we would like to ask..)
        {
            //
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 30 / 100, y: height * 1.5 / 100, width: frame.width * 80 / 100, height: height * 4.25 / 100))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 15))
            }
            else
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 40 / 100, y: 0, width: frame.width * 80 / 100, height: frame.height))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            
            namelabel.textColor = UIColor.black;           namelabel.textAlignment = .center;
            namelabel.numberOfLines = 0;                   namelabel.text = "To give you best experience we would like to ask few quick questions to set everything up for you."
            addSubview(namelabel)
        }
        
        if title == 22 // Spoguide button (ok)
        {
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width / 2 - (frame.width * (30 / 100)), y: 0, width: frame.width * (60 / 100), height: frame.height)
            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.white, for: []);
            menubutton.setTitle("Ok", for: []);
            menubutton.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 14))
            }
            addSubview(menubutton)
        }
        
        if title == 23 // Spoguide skip button
        {
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width / 2 - (frame.width * (30 / 100)), y: 0, width: frame.width * (60 / 100), height: frame.height)
            menubutton.backgroundColor = UIColor.white; //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Skip", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            addSubview(menubutton)
        }
        
        if title == 24 // Spoguide medium heading (Add your photo)
        {
            //
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 30 / 100, y: height * 1.5 / 100, width: frame.width * 80 / 100, height: height * 4.25 / 100))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 15))
            }
            else
            {
                namelabel = UILabel(frame: CGRect(x: frame.width / 2 - frame.width * 40 / 100, y: 0, width: frame.width * 80 / 100, height: frame.height))
                namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 14))
            }
            
            namelabel.textColor = UIColor.black;           namelabel.textAlignment = .center;
            namelabel.numberOfLines = 0;                   namelabel.text = "Add your photo"
            addSubview(namelabel)
        }
        
        if title == 25 // Spoguide Add your photo image button
        {
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                iView = UIImageView(frame: CGRect(x: frame.width * 25 / 100 + 5,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) )
            }
            else
            {
                iView = UIImageView(frame: CGRect(x: frame.width / 2 - (frame.width * ( 17.5 / 100 )), y: 0, width: frame.width * ( 35 / 100 ), height: frame.width * ( 35 / 100 ) ) )
            }
            
            iView.image = UIImage(named: "add_photo")
            
            iView.layer.borderWidth = 1
            iView.layer.masksToBounds = false
            iView.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            iView.layer.cornerRadius = iView.frame.height/2
            iView.clipsToBounds = true
            addSubview(iView)
        }
        
        if title == 26 // Spoguide male female image buttons
        {
            //
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {menubutton4.frame = CGRect(x: frame.width * 10 / 100,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) }
            else
            { menubutton4.frame = CGRect(x: frame.width * (10 / 100), y: 0, width: frame.width * ( 35 / 100 ), height: frame.width * ( 35 / 100 ) ) }
            
            img = UIImage(named: "female") as UIImage?;                        menubutton4.setImage(img, for: [])
            
            menubutton4.backgroundColor = .clear
            menubutton4.layer.cornerRadius = 25
            menubutton4.layer.borderWidth = 1
            menubutton4.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            menubutton4.imageView!.contentMode = .scaleAspectFit
            menubutton4.imageEdgeInsets = UIEdgeInsets(top: frame.width * ( 10 / 100 ), left: frame.width * ( 10 / 100 ), bottom: frame.width * ( 10 / 100 ), right: frame.width * ( 10 / 100 ));
            addSubview(menubutton4)
            
            //
            menubutton5 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton5.isExclusiveTouch = true
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {menubutton5.frame = CGRect(x: frame.width * 25 / 100 + 5,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) }
            else
            { menubutton5.frame = CGRect(x: frame.width * (55 / 100), y: 0, width: frame.width * ( 35 / 100 ), height: frame.width * ( 35 / 100 ) ) }
            
            img = UIImage(named: "male") as UIImage?;                        menubutton5.setImage(img, for: [])
            menubutton5.backgroundColor = .clear
            menubutton5.layer.cornerRadius = 25
            menubutton5.layer.borderWidth = 1
            menubutton5.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            menubutton5.imageView!.contentMode = .scaleAspectFit
            menubutton5.imageEdgeInsets = UIEdgeInsets(top: frame.width * ( 10 / 100 ), left: frame.width * ( 10 / 100 ), bottom: frame.width * ( 10 / 100 ), right: frame.width * ( 10 / 100 ));
            addSubview(menubutton5)
        }
        
        if title == 27 // Spoguide uipicker view & and unit text
        {
            //
            if UIDevice.current.userInterfaceIdiom == .pad
            {uiPicker.frame = CGRect(x: frame.width * 25 / 100 + 5,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) }
            else
            { uiPicker.frame = CGRect(x: frame.width / 2 - (frame.width * ( 15 / 100 )), y: 0, width: frame.width * ( 30 / 100 ), height: frame.width * ( 30 / 100 ) ) }
            
            addSubview(uiPicker)
            
            //
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {menubutton4.frame = CGRect(x: frame.width * 10 / 100,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) }
            else
            { menubutton4.frame = CGRect(x: (frame.width / 2) + (frame.width * ( 15 / 100 )), y: 0, width: frame.width * ( 15 / 100 ), height: frame.width * ( 35 / 100 ) ) }
            
            menubutton4.titleLabel?.textAlignment = NSTextAlignment.center 
            menubutton4.setTitleColor(UIColor.black, for: []);            //menubutton.setTitleColor backgroundColor = UIColor.blackColor()
            menubutton4.setTitle("ft", for: []);
            addSubview(menubutton4)
        }
        
        if title == 28 // Spoguide change unit system button
        {
            //
            menubutton5 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton5.isExclusiveTouch = true
            
            if UIDevice.current.userInterfaceIdiom == .pad
            { menubutton5.frame = CGRect(x: frame.width * 25 / 100 + 5,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.height ) }
            else
            { menubutton5.frame = CGRect(x: frame.width * (25 / 100), y: 0, width: frame.width * ( 50 / 100 ), height: frame.height ) }
            
            menubutton5.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);            //menubutton.setTitleColor backgroundColor = UIColor.blackColor()
            menubutton5.setTitle("IMPERIAL(FT)", for: []);
            addSubview(menubutton5)
        }
        
        if title == 29 // Spoguide buttons beginner/Intermediate/Advanced/Gain Weight/ Lose Weight
        {
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width / 2 - (frame.width * (40 / 100)), y: frame.height * (20/100), width: frame.width * (80 / 100), height: frame.height - frame.height * (40/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Beginner", for: []);
            //menubutton.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 15)
            
            //button.backgroundColor = .clear
            menubutton.layer.cornerRadius = 15
            menubutton.layer.borderWidth = 1
            menubutton.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            } 
            
            imv =  UIImageView(frame: CGRect(x: frame.width - frame.width * (30 / 100), y: (menubutton.frame.height / 2) - 18, width: 36, height: 36))
            imv.image = UIImage(named: "plus")
            imv.isHidden = true
            menubutton.addSubview(imv)
            
            namelabel =  UILabel(frame: CGRect(x: frame.width - frame.width * (40 / 100), y: (menubutton.frame.height / 2) - 18, width: 80, height: 36))
            namelabel.isHidden = true 
            namelabel.textColor = UIColor.black;
            //namelabel.font = UIFont(name: "Optima", size: 15) //UIFont.systemFontOfSize(namelabel.font.pointSize - 7)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0;
            menubutton.addSubview(namelabel)
            
            addSubview(menubutton)
        }
        
        if title == 30 // Spoguide dummy cell
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white 
            addSubview(dummyView)
        }
        
        if title == 31 // week month collection view
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (2/100), y: 0, width: dummyView.frame.width * (96/100), height: dummyView.frame.height))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (5/100), width: dummyView1.frame.width * (40 / 100), height:dummyView1.frame.height * (18/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Jan 2019", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton)
            
            // 21
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: dummyView1.frame.width * (55/100), y: dummyView1.frame.height * (5/100), width: dummyView1.frame.width * (20 / 100), height:dummyView1.frame.height * (18/100))
            menubutton1.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton1.setTitleColor(UIColor.white, for: []);
            menubutton1.setTitle("Week", for: []);
            menubutton1.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton1)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (75/100), y: dummyView1.frame.height * (5/100), width: dummyView1.frame.width * (20 / 100), height:dummyView1.frame.height * (18/100))
            menubutton2.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton2.setTitleColor(UIColor.black, for: []);
            menubutton2.setTitle("Month", for: []);
            menubutton2.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton2)
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: dummyView1.frame.width * (90 / 100), height: dummyView1.frame.height * (90/100));
            flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            
            collectionView = UICollectionView(frame: CGRect(x: 0, y: dummyView1.frame.height * (30/100), width: dummyView1.frame.width, height: dummyView1.frame.height * (70/100)), collectionViewLayout: flowLayout)
            
            //let alarmCollectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
 
            collectionView.backgroundColor = UIColor.white
            dummyView1.addSubview(collectionView)
        }
        
        if title == 32 // Today's workout commitment
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (2/100), y: height * (1/100), width: dummyView.frame.width * (96/100), height: dummyView.frame.height - height * (1/100)))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            //
            dummyView2 = UIView(frame: CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (1/100), width: dummyView1.frame.width * (96/100), height: dummyView1.frame.height * (35/100)))
            dummyView2.backgroundColor = UIColor.white
            dummyView1.addSubview(dummyView2)
            
            // 21
            menubutton6 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton6.isExclusiveTouch = true
            menubutton6.frame = CGRect(x: width / 2 - 25, y: (dummyView1.frame.height * (37/100)) / 2 - dummyView1.frame.height * (2.5/100), width: 50, height:dummyView1.frame.height * (5/100))
            menubutton6.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D          - (dummyView2.frame.width * (7.5/100))
            menubutton6.setTitleColor(UIColor.black, for: []);
            menubutton6.titleLabel!.textAlignment = .center
            menubutton6.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            menubutton6.setTitle("75 %", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton6.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton6.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 14))
            }
            dummyView1.addSubview(menubutton6)
             
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (35/100), width: dummyView1.frame.width * (96 / 100), height:dummyView1.frame.height * (10/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Today's Workout Commitment", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton)
            
            // 21
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (45/100), width: dummyView1.frame.width * (96 / 100), height:dummyView1.frame.height * (5/100))
            menubutton1.backgroundColor = UIColor(rgb: 0xffffff); //0x00AEF4            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("3/5 Exercise", for: []);
            //menubutton1.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (60/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (5/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Duration", for: []);
            menubutton.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
            
            iView = UIImageView(frame: CGRect(x: 10, y: 0, width: menubutton.frame.height, height: menubutton.frame.height))
            iView.image = UIImage(named: "duration")
            menubutton.addSubview(iView)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (65/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (10/100))
            menubutton2.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton2.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);
            menubutton2.setTitle("26:03 min", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton2)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (52/100), y: dummyView1.frame.height * (60/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (5/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Steps", for: []);
            menubutton.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
            
            iView = UIImageView(frame: CGRect(x: 10, y: 0, width: menubutton.frame.height, height: menubutton.frame.height))
            iView.image = UIImage(named: "steps")
            menubutton.addSubview(iView)
            
            // 21
            menubutton3 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton3.isExclusiveTouch = true
            menubutton3.frame = CGRect(x: dummyView1.frame.width * (52/100), y: dummyView1.frame.height * (65/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (10/100))
            menubutton3.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton3.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);
            menubutton3.setTitle("705 Step", for: []);
            menubutton3.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton3)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (85/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (5/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Distance", for: []);
            menubutton.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
            
            iView = UIImageView(frame: CGRect(x: 10, y: 0, width: menubutton.frame.height, height: menubutton.frame.height))
            iView.image = UIImage(named: "distance")
            menubutton.addSubview(iView)
            
            // 21
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            menubutton4.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (90/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (10/100))
            menubutton4.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton4.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);
            menubutton4.setTitle("4,36 km", for: []);
            menubutton4.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton4)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (52/100), y: dummyView1.frame.height * (85/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (5/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle(" Calories Burned", for: []);
            menubutton.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
            
            iView = UIImageView(frame: CGRect(x: 0, y: 0, width: menubutton.frame.height, height: menubutton.frame.height))
            iView.image = UIImage(named: "calories")
            menubutton.addSubview(iView)
            
            // 21
            menubutton5 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton5.isExclusiveTouch = true
            menubutton5.frame = CGRect(x: dummyView1.frame.width * (52/100), y: dummyView1.frame.height * (90/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (10/100))
            menubutton5.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton5.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);
            menubutton5.setTitle("322 kcal", for: []);
            menubutton5.roundCorners([.bottomLeft, .topLeft, .topRight, .bottomRight], radius: 50)
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton5.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton5.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton5)
        }
        
        if title == 33 // Today's workout
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (2/100), y:  height * (1/100), width: dummyView.frame.width * (96/100), height: dummyView.frame.height - height * (1/100)))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (2/100), width: dummyView1.frame.width * (55 / 100), height: dummyView1.frame.height * (33/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.titleLabel!.textAlignment = .left
            menubutton.setTitle("Today's Workout", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton)
            
            iView = UIImageView(frame: CGRect(x: menubutton.frame.width * (2/100), y: menubutton.frame.height/2 - menubutton.frame.width * (5/100), width: menubutton.frame.width * (10/100), height: menubutton.frame.width * (10/100)))
            iView.image = UIImage(named: "blue_bullet")
            menubutton.addSubview(iView)
            
            let dummyView2 = UIView(frame: CGRect(x: 0, y: dummyView1.frame.height * (10/100), width: frame.width, height: 1))
            dummyView2.backgroundColor = UIColor(rgb: 0xf2f2f2)
            dummyView1.addSubview(dummyView2)
            
            // 21
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (37/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (32/100))
            menubutton1.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("Chest, Biceps, Trap", for: []);
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (52/100), y: dummyView1.frame.height * (37/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (59/100))
            menubutton.setImage(UIImage(named: "todays_workout"), for: [])
            dummyView1.addSubview(menubutton)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (70/100), width: dummyView1.frame.width * (46 / 100), height:dummyView1.frame.height * (25/100))
            menubutton2.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton2.setTitleColor(UIColor(rgb: 0xffffff), for: []);
            menubutton2.setTitle("Start Now", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton2)
        }
        
        if title == 34 // Previous workout
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (2/100), y: height * (1/100), width: dummyView.frame.width * (96/100), height: dummyView.frame.height - height * (1/100)))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (5/100), y: dummyView1.frame.height * (2/100), width: dummyView1.frame.width * (55 / 100), height: dummyView1.frame.height * (20/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.titleLabel!.textAlignment = .left
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            menubutton.setTitle("Previous Workout", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (2/100), y: dummyView1.frame.height * (30/100), width: dummyView1.frame.width * (20 / 100), height:dummyView1.frame.height * (60/100))
            menubutton2.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton2.setTitleColor(UIColor(rgb: 0xffffff), for: []);
            menubutton2.setTitle("7\nNov", for: []);
            menubutton2.titleLabel!.textAlignment = .center
            menubutton2?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
 
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 14))
            }
            dummyView1.addSubview(menubutton2)
            
            // 21
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: dummyView1.frame.width * (25/100), y: dummyView1.frame.height * (30/100), width: dummyView1.frame.width * (40 / 100), height:dummyView1.frame.height * (30/100))
            menubutton1.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("Shoulders, Abs", for: []);
            menubutton1.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton1)
            
            // 21
            menubutton3 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton3.isExclusiveTouch = true
            menubutton3.frame = CGRect(x: dummyView1.frame.width * (25/100), y: dummyView1.frame.height * (60/100), width: dummyView1.frame.width * (40 / 100), height:dummyView1.frame.height * (30/100))
            menubutton3.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton3.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton3.setTitle("8 exercise completed", for: []);
            menubutton3.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton3)
        }
        
        if title == 35 // Measurements update
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (2/100), y: height * (1/100), width: dummyView.frame.width * (96/100), height: dummyView.frame.height - height * (1/100) ))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (1/100), y: dummyView1.frame.height * (1/100), width: dummyView1.frame.width * (51 / 100), height: dummyView1.frame.height * (98/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.titleLabel!.textAlignment = .center
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            menubutton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            menubutton.setTitle("Measurements\nUpdate", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
            
            iView = UIImageView(frame: CGRect(x: menubutton.frame.width * (1/100), y: menubutton.frame.height/2 - menubutton.frame.width * (8.5/100), width: menubutton.frame.width * (17/100), height: menubutton.frame.width * (17/100)))
            iView.image = UIImage(named: "measurements")
            menubutton.addSubview(iView)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (54/100), y: dummyView1.frame.height * (15/100), width: dummyView1.frame.width * (45 / 100), height:dummyView1.frame.height * (70/100))
            menubutton2.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton2.setTitleColor(UIColor(rgb: 0xffffff), for: []);
            menubutton2.setTitle("Click to Update", for: []);
            menubutton2.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton2)
        }
        
        if title == 36 // menu item 1
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView1.backgroundColor =  UIColor(rgb: 0x00AEF4)
            dummyView.addSubview(dummyView1)
            
            iView = UIImageView(frame: CGRect(x: dummyView1.frame.width * (25/100), y: dummyView1.frame.height * (10/100) + dummyView1.frame.height / 2 - dummyView1.frame.width / 2, width: dummyView1.frame.width / 2, height: dummyView1.frame.width / 2))
            iView.image = UIImage(named: "add_photo")
            iView.layer.borderWidth = 1
            iView.layer.masksToBounds = false
            iView.backgroundColor = UIColor(rgb: 0xffffff)
            iView.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            iView.layer.cornerRadius = iView.frame.height/2
            iView.clipsToBounds = true
            dummyView1.addSubview(iView)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (1/100), y: dummyView1.frame.height * (60/100), width: dummyView1.frame.width * (98 / 100), height: dummyView1.frame.height * (20/100))
            menubutton.backgroundColor = .clear //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.white, for: []);
            menubutton.titleLabel!.textAlignment = .center
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            menubutton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            menubutton.setTitle("John Doe", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 14))
            }
            dummyView1.addSubview(menubutton)  
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (1/100), y: dummyView1.frame.height * (80/100), width: dummyView1.frame.width * (98 / 100), height:dummyView1.frame.height * (20/100))
            menubutton2.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton2.setTitleColor(UIColor(rgb: 0xffffff), for: []);
            menubutton2.setTitle("jon.doe@example.com", for: []);
            menubutton2.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton2)
        }
        
        if title == 37 // menu item 2
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView1.backgroundColor =  UIColor(rgb: 0xffffff)
            dummyView.addSubview(dummyView1)
            
            iView = UIImageView(frame: CGRect(x: dummyView1.frame.width * (10/100), y: dummyView1.frame.height / 2 -  dummyView1.frame.width * (5/100), width: dummyView1.frame.width * (10/100), height: dummyView1.frame.width * (10/100)))
            iView.image = UIImage(named: "add_photo")
            iView.clipsToBounds = true
            dummyView1.addSubview(iView)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (25/100), y: dummyView1.frame.height * (10/100), width: dummyView1.frame.width * (75 / 100), height: dummyView1.frame.height * (80/100))
            menubutton.backgroundColor = .clear //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.titleLabel!.textAlignment = .left
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            menubutton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            menubutton.setTitle("Recipes", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton)
        }
        
        if title == 38 // menu dummy
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView) 
        }
        
        if title == 39 // Workout plans
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            dummyView3 = UIView(frame: CGRect(x: dummyView.frame.width * (5 / 100), y: height * (1/100), width: 1, height: dummyView.frame.height - height * (1/100) ))
            //dummyView3 = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 0 ))
            dummyView3.backgroundColor = UIColor.black
            dummyView.addSubview(dummyView3)
            
            let arcCenter = CGPoint(x: dummyView.frame.width * (5 / 100), y: (dummyView.frame.height - height * (1/100)) / 2)
            
            let trackLayer = CAShapeLayer()
            let circularPath = UIBezierPath(arcCenter: arcCenter, radius: 2, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true) //
            trackLayer.path = circularPath.cgPath
            trackLayer.strokeColor = UIColor.lightGray.cgColor
            trackLayer.lineWidth = 10
            trackLayer.fillColor = UIColor.black.cgColor
            //trackLayer.lineCap = CAShapeLayerLineCap.round
            dummyView.layer.addSublayer(trackLayer)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (10/100), y: height * (1/100), width: dummyView.frame.width * (88/100), height: dummyView.frame.height - height * (1/100) ))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (7/100), y: dummyView1.frame.height * (4/100), width: dummyView1.frame.width * (80 / 100), height: dummyView1.frame.height * (50/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.titleLabel!.textAlignment = .left
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            menubutton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            menubutton.setTitle("12 Week Fat Destroyer", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton)
            
            let dummyView4 = UIView(frame: CGRect(x: 0, y: menubutton.frame.height - 2, width: menubutton.frame.width, height: 2))
            dummyView4.backgroundColor = UIColor.lightGray
            menubutton.addSubview(dummyView4)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (7/100), y: dummyView1.frame.height * (70/100), width: dummyView1.frame.width * (34 / 100), height:dummyView1.frame.height * (10/100))
            menubutton2.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton2.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton2.setTitle("Completed", for: []);
            menubutton2.titleLabel!.textAlignment = .left
            menubutton2.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton2)
            
            // 21
            menubutton3 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton3.isExclusiveTouch = true
            menubutton3.frame = CGRect(x: menubutton.frame.width - dummyView1.frame.width * (10/100), y: dummyView1.frame.height * (70/100), width: dummyView1.frame.width * (10 / 100), height:dummyView1.frame.height * (10/100))
            menubutton3.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton3.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton3.setTitle("0%", for: []);
            menubutton3.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton3)
            
            // 21
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            menubutton4.frame = CGRect(x: dummyView1.frame.width * (90/100), y: dummyView1.frame.height / 2 - (dummyView1.frame.width * (2.5/100)), width: dummyView1.frame.width * (5 / 100), height: dummyView1.frame.width * (5/100))
            menubutton4.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton4.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton4.setTitle(">", for: []);
            menubutton4.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton4)
        }
        
        if title == 40 // Notification list
        {
            var uiv = UIView()
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                uiv = UIView(frame: CGRect(x: frame.width * 25 / 100 + 5,  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) )
            }
            else
            {
                uiv = UIView(frame: CGRect(x: frame.width * ( 2 / 100 ), y: frame.height / 2 - frame.width * ( 7.5 / 100 ), width: frame.width * ( 15 / 100 ), height: frame.width * ( 15 / 100 ) ) )
            }
            
            uiv.layer.masksToBounds = false
            uiv.layer.cornerRadius = uiv.frame.height/2
            uiv.clipsToBounds = true
            uiv.layer.backgroundColor = UIColor(rgb: 0x00AEF4).cgColor
            addSubview(uiv)
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                iView = UIImageView(frame: CGRect(x: uiv.frame.width / 2 - frame.width * ( 2 / 100 ),  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  frame.width * 7 / 100 - 10) )
            }
            else
            {
                iView = UIImageView(frame: CGRect(x: uiv.frame.width / 2 - frame.width * ( 3.5 / 100 ), y: uiv.frame.height / 2 - frame.width * ( 3.5 / 100 ), width: frame.width * ( 7 / 100 ), height: frame.width * ( 7 / 100 ) ) )
            }
            
            iView.image = UIImage(named: "notification_list")
            iView.layer.masksToBounds = false
            iView.clipsToBounds = true
            uiv.addSubview(iView)
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width * (19 / 100), y: frame.height * (15/100), width: frame.width * (80 / 100), height: frame.height * (5/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Congrats, Your Plan is Completed!", for: []);
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            addSubview(menubutton)
            
            // 21
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: frame.width - frame.width * (10 / 100), y: frame.height * (3/100), width: frame.width * (5 / 100), height:  frame.height * (1/100))
            menubutton1.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("...", for: []);
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 16))
            }
            addSubview(menubutton1)
            
            //
            namelabel = UILabel(frame: CGRect(x: frame.width * (19 / 100), y: frame.height * (20/100), width: frame.width * (80 / 100), height: frame.height * (80/100)))
            namelabel.textColor = UIColor.black;
            //namelabel.font = UIFont(name: "Optima", size: 15) //UIFont.systemFontOfSize(namelabel.font.pointSize - 7)
            namelabel.textAlignment = .left
            namelabel.numberOfLines = 0;
            namelabel.text = "Notification text"
            addSubview(namelabel)
            
            let dummyView4 = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
            dummyView4.backgroundColor = UIColor.lightGray
            addSubview(dummyView4)
        }
        
        if title == 41 // Notification list
        {
            //
            namelabel = UILabel(frame: CGRect(x: frame.width * (5/100), y: 0, width: frame.width * (90/100), height: frame.height))
            namelabel.textColor = UIColor.black;
            //namelabel.font = UIFont(name: "Optima", size: 15) //UIFont.systemFontOfSize(namelabel.font.pointSize - 7)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0;
            namelabel.text = "Notification text"
            addSubview(namelabel)
        }
        
        if title == 42 // Notification list
        {
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width * (5 / 100), y: frame.height * (1/100), width: frame.width * (40 / 100), height: frame.height * (98/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);
            menubutton.setTitle("Congrats, Your Plan is Completed!", for: []);
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            addSubview(menubutton)
            
            // 21
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: frame.width * (55 / 100), y: frame.height * (1/100), width: frame.width * (40 / 100), height:  frame.height * (98/100))
            menubutton1.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("...", for: []);
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            addSubview(menubutton1)
            
            let dummyView4 = UIView(frame: CGRect(x: frame.width * (5 / 100), y: menubutton.frame.height - 2, width: frame.width * (90 / 100), height: 2))
            dummyView4.backgroundColor = UIColor.lightGray
            addSubview(dummyView4)
        }
        
        if title == 43 // Workout plans
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView4 = UIView(frame: CGRect(x: frame.width * 5 / 100, y: frame.height * 40 / 100, width: frame.width * 90 / 100, height: 2))
            dummyView4.backgroundColor = UIColor.lightGray
            addSubview(dummyView4)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: frame.width * 5 / 100, y: frame.height * 40 / 100 + 5, width: frame.width * (35 / 100), height: frame.height * (40/100))
            menubutton2.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton2.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton2.setTitle("Completed", for: []);
            menubutton2.titleLabel!.textAlignment = .left
            menubutton2.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            addSubview(menubutton2)
            
            // 21
            menubutton3 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton3.isExclusiveTouch = true
            menubutton3.frame = CGRect(x: frame.width - frame.width * (10/100), y: frame.height * 40 / 100 + 5, width: frame.width * (10 / 100), height: frame.height * (40/100))
            menubutton3.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton3.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton3.setTitle("0%", for: []);
            menubutton3.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            addSubview(menubutton3)
        }
        
        if title == 44 // Workout plans
        {
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            dummyView.backgroundColor = UIColor.white
            addSubview(dummyView)
            
            let dummyView1 = UIView(frame: CGRect(x: dummyView.frame.width * (5/100), y: height * (1/100), width: dummyView.frame.width * (90/100), height: dummyView.frame.height - height * (1/100) ))
            dummyView1.backgroundColor = UIColor.white
            dummyView1.layer.cornerRadius = 5
            dummyView1.layer.borderWidth = 1
            dummyView1.layer.borderColor = UIColor(rgb: 0x00AEF4).cgColor
            dummyView.addSubview(dummyView1)
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                iView = UIImageView(frame: CGRect(x: dummyView1.frame.width / 2 - frame.width * ( 2 / 100 ),  y: frame.height * (55 / 100) + 5, width: frame.width * 7 / 100 - 10, height:  dummyView1.frame.width * 7 / 100 - 10) )
            }
            else
            {
                iView = UIImageView(frame: CGRect(x: dummyView1.frame.width * ( 2.5 / 100 ), y: dummyView1.frame.height / 2 - dummyView1.frame.width * ( 7.5 / 100 ), width: dummyView1.frame.width * ( 15 / 100 ), height: dummyView1.frame.width * ( 15 / 100  ) ) )
            }
            
            iView.image = UIImage(named: "incline__bench_press_thumbnail")
            iView.layer.masksToBounds = false
            iView.clipsToBounds = true
            iView.layer.cornerRadius = iView.frame.height/2
            dummyView1.addSubview(iView)
            
            
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: dummyView1.frame.width * (20/100), y: dummyView1.frame.height * (4/100), width: dummyView1.frame.width * (65 / 100), height: dummyView1.frame.height * (50/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.titleLabel!.textAlignment = .left
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            menubutton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            menubutton.setTitle("1. Incline Bench Press", for: []);
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton)
            
            let dummyView4 = UIView(frame: CGRect(x: 0, y: menubutton.frame.height - 2, width: menubutton.frame.width, height: 2))
            dummyView4.backgroundColor = UIColor.lightGray
            menubutton.addSubview(dummyView4)
            
            // 21
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: dummyView1.frame.width * (20/100), y: dummyView1.frame.height * (70/100), width: dummyView1.frame.width * (34 / 100), height:dummyView1.frame.height * (10/100))
            menubutton2.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton2.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton2.setTitle("Completed", for: []);
            menubutton2.titleLabel!.textAlignment = .left
            menubutton2.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton2)
            
            // 21
            menubutton3 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton3.isExclusiveTouch = true
            menubutton3.frame = CGRect(x: menubutton.frame.width - dummyView1.frame.width * (10/100), y: dummyView1.frame.height * (70/100), width: dummyView1.frame.width * (10 / 100), height:dummyView1.frame.height * (10/100))
            menubutton3.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton3.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton3.setTitle("0%", for: []);
            menubutton3.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            dummyView1.addSubview(menubutton3)
            
            // 21
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            menubutton4.frame = CGRect(x: dummyView1.frame.width * (90/100), y: dummyView1.frame.height / 2 - (dummyView1.frame.width * (2.5/100)), width: dummyView1.frame.width * (5 / 100), height: dummyView1.frame.width * (5/100))
            menubutton4.backgroundColor = UIColor(rgb: 0xffffff);
            menubutton4.setTitleColor(UIColor(rgb: 0x000000), for: []);
            menubutton4.setTitle(">", for: []);
            menubutton4.titleLabel!.textAlignment = .center
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            dummyView1.addSubview(menubutton4)
        }
        
        if title == 45 // Notification list
        {
            // 21
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width * (1 / 100), y: frame.height * (1/100), width: frame.width * (98 / 100), height: frame.height * (98/100))
            menubutton.backgroundColor = UIColor(rgb: 0xffffff); //0x00A78D            menubutton.backgroundColor = UIColor(rgb: 0x00AEF4); //0x00A78D
            menubutton.setTitleColor(UIColor(rgb: 0x00AEF4), for: []);
            menubutton.setTitle("Congrats, Your Plan is Completed!", for: []);
            menubutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            menubutton.titleLabel?.numberOfLines = 0
            menubutton.titleLabel?.lineBreakMode = .byWordWrapping
            //button.titleLabel?.textAlignment = .center
            //menubutton.sizeToFit()
            
            if UIDevice.current.userInterfaceIdiom == .pad
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 12))
            }
            else
            {
                menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: HomeModel.getInstance().get_font_size(font_size: 10))
            }
            addSubview(menubutton)  
            
            let dummyView4 = UIView(frame: CGRect(x: frame.width * (1 / 100), y: menubutton.frame.height - 1, width: frame.width * (98 / 100), height: 1))
            dummyView4.backgroundColor = UIColor.lightGray
            addSubview(dummyView4)
        }
        
        if title == 200
        {
            //All Brands
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: 0, y: 2, width: frame.width * 30 / 100, height: frame.height - 4);
            menubutton.setTitleColor(UIColor.black, for: []);
            //menubutton.setTitleColor backgroundColor = UIColor.blackColor()
            menubutton.setTitle("ALL BRANDS", for: []);
            menubutton.titleLabel!.font = UIFont(name: "GillSans", size: 15) // UIFont(name: "Optima-Bold", size: 15)
            //UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 7)
            
            //All Types
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: frame.width * 30 / 100, y: 2, width: frame.width * 30 / 100, height: frame.height - 4)
            menubutton1.setTitleColor(UIColor.black, for: []);
            //menubutton1.backgroundColor = UIColor.blackColor()
            menubutton1.setTitle("ALL TYPES", for: []);
            menubutton1.titleLabel!.font = UIFont(name: "GillSans", size: 15)  // UIFont(name: "Optima-Bold", size: 15)
            //UIFont.boldSystemFontOfSize(menubutton1.titleLabel!.font.pointSize - 7)
            
            //Deal of the day
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: frame.width * 60 / 100, y: 2, width: frame.width * 40 / 100, height: frame.height - 4)
            menubutton2.setTitleColor(UIColor.black, for: []);
            menubutton2.setTitle("DEAL OF THE DAY", for: []);
            menubutton2.titleLabel!.font = UIFont(name: "GillSans", size: 15)
            
            //Search Textfield
            textfield = UITextField(frame: CGRect(x: frame.width * 58 / 100 + 2, y: 4, width: frame.width * 32 / 100 - 4, height: frame.height - 8))
            textfield.borderStyle = UITextField.BorderStyle.roundedRect
            textfield.autocorrectionType = UITextAutocorrectionType.no
            textfield.keyboardType = UIKeyboardType.default //DecimalPad //.NumberPad
            textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            textfield.layer.borderColor = UIColor.black.cgColor
            textfield.layer.borderWidth = 1
            textfield.inputAccessoryView = doneToolbar
            textfield.font = UIFont.systemFont(ofSize: textfield.font!.pointSize - 5)
            
            //Search Button
            button = UIButton(frame: CGRect(x: frame.width * 91.5 / 100 + 2, y: 4, width: frame.width * 7 / 100 - 4, height: frame.height - 8));
            button.isExclusiveTouch = true
            button.backgroundColor = UIColor.red;                          img = UIImage(named: "search-icon") as UIImage?
            button.setImage(img, for: [])
            //button.layer.borderColor = UIColor.whiteColor().CGColor //UIColor(rgb: 0x00b4ff).CGColor
            button.backgroundColor = UIColor.white //UIColor.redColor() //UIColor(rgb: 0x00b4ff)
            //button.titleLabel!.textAlignment = .Center
            //button.titleLabel!.font = UIFont.boldSystemFontOfSize(button.titleLabel!.font.pointSize)
            
            addSubview(menubutton)
            addSubview(menubutton1)
            
            addSubview(menubutton2)
            
            //addSubview(textfield)
            //addSubview(button)
        }
            
        if title == 300
        {
            button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height)); button.isExclusiveTouch = true
            img = UIImage(named: "success") as UIImage?
            button.backgroundColor = UIColor.white
            button.setImage(img, for: [])
            //button.verticalTextAlignment = .center
            button.contentVerticalAlignment = .bottom;
            //button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            
           addSubview(button)
        }
        
        if title == 9 //4
        {
           iView = UIImageView(frame: CGRect(x: 60, y: 5, width: frame.width * 50 / 100 - 120, height: frame.height * 20 / 100 - 10))
           iView.image = UIImage(named: "happy")
           addSubview(iView)
            
           iView = UIImageView(frame: CGRect(x: frame.width * 50 / 100 + 60, y: 5, width: frame.width * 50 / 100 - 120, height: frame.height * 20 / 100 - 10))
           iView.image = UIImage(named: "happy")
           addSubview(iView)
            
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
           menubutton.frame = CGRect(x: 5, y: frame.height * 20 / 100 - 5, width: frame.width * 50 / 100 - 10, height: frame.height * 10 / 100 - 5)
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Warranty", for: []);
           menubutton.titleLabel!.font =  UIFont(name: "Optima-Bold", size: 15) //UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 7)
            
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
           menubutton1.frame = CGRect(x: frame.width * 50 / 100 + 5, y: frame.height * 20 / 100 - 5, width: frame.width * 50 / 100 - 10, height: frame.height * 10 / 100 - 5)
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("30 Days Money Back", for: []);
           menubutton1.titleLabel!.font =   UIFont(name: "Optima-Bold", size: 15)//UIFont.boldSystemFontOfSize(menubutton1.titleLabel!.font.pointSize - 7)
            
           namelabel = UILabel(frame: CGRect(x: 5, y: frame.height * 30 / 100 - 15, width: frame.width * 50 / 100 - 15, height: frame.height * 70 / 100))
            namelabel.textColor = UIColor.black;      namelabel.font =  UIFont(name: "Optima", size: 15) //UIFont.systemFontOfSize(namelabel.font.pointSize - 7)
            namelabel.textAlignment = .center
           namelabel.numberOfLines = 0;
           namelabel.text = "All products come with a thirty days free hardware warranty which begins the date the product is delivered and 1Yr/ 3Yrs of Extended Warranty."
            
           namelabel1 = UILabel(frame: CGRect(x: frame.width * 50 / 100 + 5, y: frame.height * 30 / 100 - 15, width: frame.width * 50 / 100 - 10, height: frame.height * 70 / 100))
            namelabel1.textColor = UIColor.black;         namelabel1.font =  UIFont(name: "Optima", size: 15) //UIFont.systemFontOfSize(namelabel1.font.pointSize - 7)
            namelabel1.textAlignment = .center
           namelabel1.numberOfLines = 0;
           namelabel1.text = "All products come with a thirty days free hardware warranty which begins the date the product is delivered."
            
           addSubview(menubutton)
           addSubview(menubutton1)
           addSubview(namelabel); addSubview(namelabel1)
        }
            
        if title == 10 //5
        {
            iView = UIImageView(frame: CGRect(x: frame.width * 42.5 / 100, y: 5, width: frame.width * 15 / 100, height: frame.height * 35 / 100 - 10))
            iView.image = UIImage(named: "happy")
            addSubview(iView)
            
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: 5, y: frame.height * 25 / 100 + 5, width: frame.width - 10, height: frame.height * 25 / 100 - 10)
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Support 9 am - 6 pm", for: []);
            menubutton.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15) //UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 7)
            
            namelabel = UILabel(frame: CGRect(x: 5, y: frame.height * 50 / 100 - 5, width: frame.width - 10, height: frame.height * 50 / 100))
            namelabel.textColor = UIColor.black;      namelabel.font = UIFont(name: "Optima", size: 15) //UIFont.systemFontOfSize(namelabel.font.pointSize - 7)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0;
            namelabel.text = "Our TechSupport has resolved number of customer's Computer/Network problems with high success rate and customer satisfaction Levels."
            
            addSubview(menubutton)
            addSubview(namelabel);
        }
            
        if title == 4 //6
        {
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
           menubutton.frame = CGRect(x: frame.width * 25 / 100, y: 2, width: frame.width * 50 / 100, height: frame.height - 4)
            menubutton.backgroundColor = UIColor.red
            menubutton.setTitleColor(UIColor.white, for: []);
            menubutton.setTitle("Browse all Products", for: []);
           menubutton.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15)
            //UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 6)
            
            addSubview(menubutton)
        }
          
        if title == 1 //5 // 7
        {
            //Search Textfield
            textfield = UITextField(frame: CGRect(x: 5, y: 5, width: frame.width - 10, height: frame.height - 10)) //
            textfield.borderStyle = UITextField.BorderStyle.roundedRect
            textfield.autocorrectionType = UITextAutocorrectionType.no
            textfield.keyboardType = UIKeyboardType.default //DecimalPad //.NumberPad
            textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            textfield.layer.borderColor = UIColor.black.cgColor
            textfield.layer.borderWidth = 1
            textfield.inputAccessoryView = doneToolbar
            textfield.font = UIFont.systemFont(ofSize: textfield.font!.pointSize - 5)
            textfield.text = " What are you looking for?"
            textfield.textColor = UIColor.lightGray
            
            addSubview(textfield)
            
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width * 90 / 100, y: 10, width: frame.width * 10 / 100 - 10, height: frame.height - 20)
            //menubutton.backgroundColor = UIColor(rgb: 0x383591);
            img = UIImage(named: "search_icon_black") as UIImage?
            menubutton.setImage(img, for: []) // home fbfeff .blueColor();
            addSubview(menubutton)
            
            //refresh icon
            /* menubutton1 = UIButton(frame: CGRectMake(frame.width * 90 / 100 + 5, height * 1 / 100, frame.width * 10 / 100 - 10, height * 6 / 100));
            menubutton1.exclusiveTouch = true;                // menubutton1.backgroundColor = UIColor(rgb: 0x383591) //UIColor(rgb: 0x00b4ff)
            img = UIImage(named: "refresh") as UIImage?;        menubutton1.setImage(img, forState: .Normal)
            addSubview(menubutton1) */
            
           /* menubutton = UIButton(type: UIButtonType.Custom) as UIButton;                           menubutton.exclusiveTouch = true
           menubutton.frame = CGRectMake(0, 2, frame.width * 25 / 100, frame.height - 4)
           menubutton.backgroundColor = UIColor(rgb: 0x383591);
           menubutton.setTitleColor(UIColor.whiteColor(), forState: .Normal);
           menubutton.setTitle("LAPTOPS", forState: .Normal);
           menubutton.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15)
           UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 7)
           addSubview(menubutton)
            
           //let lineView = UIView(frame: CGRectMake(0, frame.height - 5, frame.width * 20 / 100, 1))
           //lineView.backgroundColor = UIColor.redColor()
           // menubutton.addSubview(lineView)
            
           menubutton1 = UIButton(type: UIButtonType.Custom) as UIButton;                           menubutton1.exclusiveTouch = true
           menubutton1.frame = CGRectMake(frame.width * 25 / 100, 2, frame.width * 25 / 100, frame.height - 4)
           menubutton1.backgroundColor = UIColor(rgb: 0x383591);
           menubutton1.setTitleColor(UIColor.whiteColor(), forState: .Normal);
           menubutton1.setTitle("PCS", forState: .Normal);
           menubutton1.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15)
            addSubview(menubutton1)
            
            menubutton2 = UIButton(type: UIButtonType.Custom) as UIButton;                           menubutton2.exclusiveTouch = true
           menubutton2.frame = CGRectMake(frame.width * 50 / 100, 2, frame.width * 25 / 100, frame.height - 4)
           menubutton2.backgroundColor = UIColor(rgb: 0x383591);
           menubutton2.setTitleColor(UIColor.whiteColor(), forState: .Normal);
           menubutton2.setTitle("TABLETS", forState: .Normal);
           menubutton2.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15)
            addSubview(menubutton2)
            
            menubutton3 = UIButton(type: UIButtonType.Custom) as UIButton;                           menubutton3.exclusiveTouch = true
           menubutton3.frame = CGRectMake(frame.width * 75 / 100, 2, frame.width * 25 / 100 - 4, frame.height - 4)
           menubutton3.backgroundColor = UIColor(rgb: 0x383591);
           menubutton3.setTitleColor(UIColor.whiteColor(), forState: .Normal);
           menubutton3.setTitle("IMACS", forState: .Normal);
           menubutton3.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15)
            addSubview(menubutton3) */
            
           /*  menubutton4 = UIButton(type: UIButtonType.Custom) as UIButton;                           menubutton4.exclusiveTouch = true
           menubutton4.frame = CGRectMake(frame.width - frame.width * 20 / 100 - 2, 4, frame.width * 10 / 100, frame.height - 8)
           menubutton4.backgroundColor = UIColor.redColor()
           menubutton4.setTitleColor(UIColor.whiteColor(), forState: .Normal);
           menubutton4.setTitle("<", forState: .Normal);
           menubutton4.titleLabel!.font = UIFont.boldSystemFontOfSize(menubutton4.titleLabel!.font.pointSize - 6)
            
            menubutton5 = UIButton(type: UIButtonType.Custom) as UIButton;                           menubutton5.exclusiveTouch = true
           menubutton5.frame = CGRectMake(frame.width - frame.width * 10 / 100 + 1, 4, frame.width * 10 / 100 - 2, frame.height - 8)
           menubutton5.backgroundColor = UIColor.redColor()
           menubutton5.setTitleColor(UIColor.whiteColor(), forState: .Normal);
           menubutton5.setTitle(">", forState: .Normal);
           menubutton5.titleLabel!.font = UIFont.boldSystemFontOfSize(menubutton5.titleLabel!.font.pointSize - 6) */
            //addSubview(menubutton4)
            //addSubview(menubutton5)
        }
        
        if title == 2 //5
        {
            //uiview = UIView(frame: CGRectMake(0, 0, frame.width, frame.height))
            //addSubview(uiview)
        }
        
        if title == 3 //6
        {
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: 2, y: 2, width: frame.width + 4, height: frame.height - 4)
            menubutton.backgroundColor = UIColor.red
            menubutton.setTitleColor(UIColor.white, for: []);
            menubutton.setTitle("Load More", for: []);
            menubutton.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15)
            //UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 10)
            
            addSubview(menubutton)
        }
        
        if title == 6 //8
        {
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(scrollView);
            
            //let scroll_x = ((self.width * (50/100)) / 7) * CGFloat(daypos), scroll_y = self.height * (19/100);
            //print("daypos \(daypos)  scroll_x \(scroll_x) scroll_y \(scroll_y)")
            //scrollView.scrollRectToVisible(CGRect(x: x, y: y, width: 1, height: 1), animated: true) or
            //scrollView.setContentOffset(CGPoint(x: scroll_x, y: 0), animated: false)
        }
        
        if title == 7 //9
        {
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
            menubutton.frame = CGRect(x: frame.width * 12.5 / 100, y: 2, width: frame.width * 25 / 100, height: frame.height - 4)
            menubutton.backgroundColor = UIColor.white
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("POPULAR", for: []);
            menubutton.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15) //UIFont.boldSystemFontOfSize(menubutton.titleLabel!.font.pointSize - 7)
            
            // let lineView = UIView(frame: CGRectMake(0, frame.height - 5, frame.width * 25 / 100, 1))
            //lineView.backgroundColor = UIColor.redColor()
            //menubutton.addSubview(lineView)
            
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
            menubutton1.frame = CGRect(x: frame.width * 37.5 / 100, y: 2, width: frame.width * 25 / 100, height: frame.height - 4)
            menubutton1.backgroundColor = UIColor.white
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("FEATURED", for: []);
            menubutton1.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15) // UIFont.boldSystemFontOfSize(menubutton1.titleLabel!.font.pointSize - 7)
            
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
            menubutton2.frame = CGRect(x: frame.width * 62.5 / 100, y: 2, width: frame.width * 25 / 100, height: frame.height - 4)
            menubutton2.backgroundColor = UIColor.white
            menubutton2.setTitleColor(UIColor.black, for: []);
            menubutton2.setTitle("LATEST", for: []);
            menubutton2.titleLabel!.font = UIFont(name: "Optima-Bold", size: 15) //UIFont.boldSystemFontOfSize(menubutton2.titleLabel!.font.pointSize - 7)
            
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            menubutton4.frame = CGRect(x: frame.width - frame.width * 20 / 100 - 2, y: 4, width: frame.width * 10 / 100, height: frame.height - 8)
            menubutton4.backgroundColor = UIColor.red
            menubutton4.setTitleColor(UIColor.white, for: []);
            menubutton4.setTitle("<", for: []);
            menubutton4.titleLabel!.font = UIFont.boldSystemFont(ofSize: menubutton4.titleLabel!.font.pointSize - 6)
            
            menubutton5 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton5.isExclusiveTouch = true
            menubutton5.frame = CGRect(x: frame.width - frame.width * 10 / 100 + 1, y: 4, width: frame.width * 10 / 100 - 2, height: frame.height - 8)
            menubutton5.backgroundColor = UIColor.red
            menubutton5.setTitleColor(UIColor.white, for: []);
            menubutton5.setTitle(">", for: []);
            menubutton5.titleLabel!.font = UIFont.boldSystemFont(ofSize: menubutton5.titleLabel!.font.pointSize - 6)
            
            addSubview(menubutton)
            addSubview(menubutton1)
            addSubview(menubutton2)
            //addSubview(menubutton4)
            //addSubview(menubutton5)
        }
        
        if title == 8 //10
        {
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(scrollView);
        }
        
        if title == 11
        {
            iView = UIImageView(frame: CGRect(x: frame.width * 1 / 100 + 2, y: 2, width: frame.height - 4, height: frame.height - 4))
            iView.image = UIImage(named: "search_icon_black"); addSubview(iView)
            
            namelabel = UILabel(frame: CGRect(x: frame.width * 10 / 100 + 2, y: 2, width: frame.width * 90 / 100 - 4, height: frame.height - 4))
            namelabel.textColor = UIColor.black;
            namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 10)
            namelabel.textAlignment = .left
            namelabel.numberOfLines = 0;
            namelabel.text = "RECENT REVIEWS FROM HAPPY CUSTOMERS"
            addSubview(namelabel)
        }
        
        if title == 12
        {
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(scrollView);
        }
        
        if title == 13
        {
            scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(scrollView);
        }
        
        if title == 14
        {
            namelabel = UILabel(frame: CGRect(x: 2, y: 2, width: frame.width - 4, height: frame.height * 20 / 100 - 4))
            namelabel.textColor = UIColor.black;      namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 10)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0;
            namelabel.text = "SUBSCRIBE OUR NEWSLETTER"
            addSubview(namelabel)
         
            namelabel = UILabel(frame: CGRect(x: 2, y: frame.height * 20 / 100 + 2, width: frame.width - 4, height: frame.height * 40 / 100 - 4))
            namelabel.textColor = UIColor.black;      namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: 12)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0;
            namelabel.text = "Subscribe to our newsletter to receive exclusive offers and the latest news on our products and services!"
            addSubview(namelabel)
            
            textfield = UITextField(frame: CGRect(x: 2, y: frame.height * 60 / 100 + 2, width: frame.width * 70 / 100 - 4, height: frame.height * 40 / 100 - 4))
            textfield.borderStyle = UITextField.BorderStyle.roundedRect
            textfield.autocorrectionType = UITextAutocorrectionType.no
            textfield.keyboardType = UIKeyboardType.decimalPad //.NumberPad
            textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            textfield.layer.borderColor = UIColor.black.cgColor
            textfield.layer.borderWidth = 1
            //textfield.inputAccessoryView = doneToolbar
            textfield.font = UIFont(name: HomeModel.getInstance().font_normal, size: 12)
            
            button = UIButton(frame: CGRect(x: frame.width * 70 / 100, y: frame.height * 60 / 100 + 2, width: frame.width * 30 / 100 - 2, height: frame.height * 40 / 100 - 4));
            button.isExclusiveTouch = true
            button.backgroundColor = UIColor.red
            button.setTitleColor(UIColor.white, for: []);
            button.setTitle("Submit", for: []);
            button.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 12)
            
            addSubview(textfield)
            addSubview(button)
        }
            
        if title == 15
        {
           namelabel = UILabel(frame: CGRect(x: 2, y: 2, width: frame.width * 50 / 100 - 4, height: frame.height * 15 / 100 - 4))
            namelabel.textColor = UIColor.black; namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 12)
            namelabel.textAlignment = .center
           namelabel.numberOfLines = 0
           namelabel.text = "Main Menu"
           addSubview(namelabel)
            
            menubutton = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton.isExclusiveTouch = true
           menubutton.frame = CGRect(x: 2, y: frame.height * 15 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton.backgroundColor = UIColor.white
            menubutton.setTitleColor(UIColor.black, for: []);
            menubutton.setTitle("Home", for: []);
           menubutton.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton1 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton1.isExclusiveTouch = true
           menubutton1.frame = CGRect(x: 2, y: frame.height * 32 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton1.backgroundColor = UIColor.white
            menubutton1.setTitleColor(UIColor.black, for: []);
            menubutton1.setTitle("Our Products", for: []);
           menubutton1.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton2 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton2.isExclusiveTouch = true
           menubutton2.frame = CGRect(x: 2, y: frame.height * 49 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton2.backgroundColor = UIColor.white
            menubutton2.setTitleColor(UIColor.black, for: []);
            menubutton2.setTitle("About Us", for: []);
           menubutton2.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton3 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton3.isExclusiveTouch = true
           menubutton3.frame = CGRect(x: 2, y: frame.height * 66 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton3.backgroundColor = UIColor.white
            menubutton3.setTitleColor(UIColor.black, for: []);
            menubutton3.setTitle("Contact Us", for: []);
           menubutton3.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
           //links
           namelabel = UILabel(frame: CGRect(x: frame.width * 50 / 100 + 2, y: 2, width: frame.width * 50 / 100 - 4, height: frame.height * 15 / 100 - 4))
            namelabel.textColor = UIColor.black; namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 12)
            namelabel.textAlignment = .center
           namelabel.numberOfLines = 0
           namelabel.text = "Links"
           addSubview(namelabel)
            
            menubutton4 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton4.isExclusiveTouch = true
            menubutton4.frame = CGRect(x: frame.width * 50 / 100 + 2, y: frame.height * 15 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton4.backgroundColor = UIColor.white
            menubutton4.setTitleColor(UIColor.black, for: []);
            menubutton4.setTitle("Shipping", for: []);
            menubutton4.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton5 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton5.isExclusiveTouch = true
            menubutton5.frame = CGRect(x: frame.width * 50 / 100 + 2, y: frame.height * 32 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton5.backgroundColor = UIColor.white
            menubutton5.setTitleColor(UIColor.black, for: []);
            menubutton5.setTitle("Returns", for: []);
            menubutton5.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton6 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton6.isExclusiveTouch = true
            menubutton6.frame = CGRect(x: frame.width * 50 / 100 + 2, y: frame.height * 49 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton6.backgroundColor = UIColor.white
            menubutton6.setTitleColor(UIColor.black, for: []);
            menubutton6.setTitle("Warranty", for: []);
            menubutton6.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton7 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton7.isExclusiveTouch = true
            menubutton7.frame = CGRect(x: frame.width * 50 / 100 + 2, y: frame.height * 66 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton7.backgroundColor = UIColor.white
            menubutton7.setTitleColor(UIColor.black, for: []);
            menubutton7.setTitle("Privacy Policy", for: []);
            menubutton7.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            menubutton8 = UIButton(type: UIButton.ButtonType.custom) as UIButton;                           menubutton8.isExclusiveTouch = true
            menubutton8.frame = CGRect(x: frame.width * 50 / 100 + 2, y: frame.height * 83 / 100 + 2, width: frame.width * 50 / 100 - 4, height: frame.height * 17 / 100 - 4)
            menubutton8.backgroundColor = UIColor.white
            menubutton8.setTitleColor(UIColor.black, for: []);
            menubutton8.setTitle("FAQ", for: []);
            menubutton8.titleLabel!.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            
            addSubview(menubutton)
            addSubview(menubutton1)
            addSubview(menubutton2)
            addSubview(menubutton3)
            addSubview(menubutton4)
            addSubview(menubutton5)
            addSubview(menubutton6)
            addSubview(menubutton7)
            addSubview(menubutton8)
        }
            
        if title == 16
        {
            namelabel = UILabel(frame: CGRect(x: 2, y: 2, width: frame.width - 4, height: frame.height * 15 / 100 - 4))
            namelabel.textColor = UIColor.black; namelabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 12)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0
            namelabel.text = "Contact Us"
            addSubview(namelabel)
            
            namelabel = UILabel(frame: CGRect(x: 2, y: frame.height * 15 / 100 + 2, width: frame.width - 4, height: frame.height * 85 / 100 - 4))
            namelabel.textColor = UIColor.black; namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0
            namelabel.text = "5410, Newport Drive, \n Suite #36,Rolling Meadows, \n IL - 60008, USA \n 1(866) 232-7408 \n sales@nettradez.com"
            addSubview(namelabel) 
        }
            
        if title == 17
        {
            iView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            iView.backgroundColor = UIColor.red
            addSubview(iView)
            
            namelabel = UILabel(frame: CGRect(x: 2, y: 2, width: frame.width - 4, height: frame.height - 4))
            namelabel.textColor = UIColor.white; namelabel.font = UIFont(name: HomeModel.getInstance().font_normal, size: 15)
            namelabel.textAlignment = .center
            namelabel.numberOfLines = 0
            namelabel.text = "Nettradez.com \n 2016 Nettradez. All Rights Reserved"
            addSubview(namelabel)
            
            addSubview(namelabel)
        }
    }
    
    @objc func boopla()
    {
        self.textfield.resignFirstResponder();
        /* NSNotificationCenter.defaultCenter().postNotificationName("scrollToBottom", object: nil) */
    }
    
    @objc func hoopla()
    {
        self.textfield.resignFirstResponder();   
        /* NSNotificationCenter.defaultCenter().postNotificationName("scrollToBottom", object: nil)  */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

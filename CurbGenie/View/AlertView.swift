import UIKit

class AlertView : UIView
{
    var iView = UIImageView(), toplabel = UILabel(), messagelabel = UILabel(), closeButton  = UIButton(), button  = UIButton(), textfield = UITextField()
    
    init(frame: CGRect, cas: Int)
    {
        super.init(frame: frame)
        
        let doneToolbar: UIToolbar = UIToolbar()
        
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        doneToolbar.items = [
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.hoopla)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Apply", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.boopla)),
        ]
        
        doneToolbar.sizeToFit()
        
        if cas == 1 // spinner gif
        {
            self.backgroundColor = UIColor.black //UIColor.whiteColor()
            
            //iView = UIImageView(frame: CGRectMake(0, 0, frame.width * 30 / 100, frame.height))
            //iView.image = UIImage.gifWithName("loader")
            //iView.image = UIImage(named: "loader")
            //addSubview(iView)
            
            let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorView.Style.whiteLarge)
            // Position Activity Indicator in the center of the main view
            myActivityIndicator.center = CGPoint(x: frame.width * (15 / 100), y: frame.height / 2)
            // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
            myActivityIndicator.hidesWhenStopped = false
            // Start Activity Indicator
            myActivityIndicator.startAnimating()
            // Call stopAnimating() when need to stop activity indicator
            //myActivityIndicator.stopAnimating()
            addSubview(myActivityIndicator)
            
            toplabel = UILabel(frame: CGRect(x: frame.width * 30 / 100, y: 0, width: frame.width * 70 / 100, height: frame.height))
            toplabel.textColor = UIColor.white
            toplabel.textAlignment = .center
            toplabel.font = UIFont(name: HomeModel.getInstance().font_bold, size: 12)
            //UIFont.boldSystemFontOfSize(toplabel.font.pointSize - 2)
            addSubview(toplabel)
        }
        
        if cas == 2 // error message
        {
            self.backgroundColor = UIColor.black //UIColor(rgb: 0x268bb5)
            
            toplabel = UILabel(frame: CGRect(x: 5, y: 0, width: frame.width - 10, height: frame.height * 20/100)); toplabel.backgroundColor = UIColor.black;
            toplabel.textColor = UIColor.white; //UIColor(rgb: 0x00b4ff)
            toplabel.font = UIFont.boldSystemFont(ofSize: toplabel.font.pointSize)
            self.addSubview(toplabel)
            
            //let image = UIImage(named: "close") as UIImage?; closeButton   = UIButton(type: UIButtonType.Custom) as UIButton
            //closeButton.frame = CGRectMake(frame.width * 80/100, 5, frame.width * 20/100, frame.height * 20/100 - 10)
            //closeButton.setImage(image, forState: .Normal)
            //addSubview(closeButton)
            
            messagelabel = UILabel(frame: CGRect(x: 0, y: frame.height * 20/100, width: frame.width, height: frame.height * 50/100))
            messagelabel.backgroundColor = UIColor.black;  messagelabel.numberOfLines = 0; messagelabel.adjustsFontSizeToFitWidth = true // UIColor(rgb: 0x00b4ff);
            messagelabel.textColor = UIColor.white;        messagelabel.textAlignment = .center;
            messagelabel.font = UIFont.boldSystemFont(ofSize: messagelabel.font.pointSize - 2)
            addSubview(messagelabel)
            
            closeButton  = UIButton(type: UIButton.ButtonType.system) as UIButton;  closeButton.isExclusiveTouch = true
            closeButton.frame = CGRect(x: 0, y: frame.height * 70 / 100, width: frame.width, height: frame.height * 30 / 100)
            closeButton.setTitle("Ok", for: [])
            closeButton.setTitleColor(UIColor.black, for: [])
            closeButton.backgroundColor = UIColor.lightGray
            addSubview(closeButton)
        }
        
        if cas == 3 // search
        {
            self.backgroundColor = UIColor.lightGray //UIColor(rgb: 0x268bb5)
            
            closeButton = UIButton(frame: CGRect(x: 7, y: 7, width: frame.width * 10 / 100 - 14, height: frame.height - 14)); button.isExclusiveTouch = true
            closeButton.setTitleColor(UIColor.white, for: []); var img = UIImage(named: "close") as UIImage?
            closeButton.setImage(img, for: [])
            addSubview(closeButton)
            
            //Search Textfield
            textfield = UITextField(frame: CGRect(x: frame.width * 10 / 100 + 2, y: 2, width: frame.width * 80 / 100 - 4, height: frame.height - 4))
            textfield.borderStyle = UITextField.BorderStyle.roundedRect
            textfield.autocorrectionType = UITextAutocorrectionType.no
            textfield.keyboardType = UIKeyboardType.default //DecimalPad //.NumberPad
            textfield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            textfield.layer.borderColor = UIColor.black.cgColor
            textfield.layer.borderWidth = 1
            textfield.inputAccessoryView = doneToolbar
            textfield.font = UIFont.systemFont(ofSize: textfield.font!.pointSize - 5)
            addSubview(textfield)
            
            button = UIButton(frame: CGRect(x: frame.width * 90 / 100 + 7, y: 7, width: frame.width * 10 / 100 - 14, height: frame.height - 14)); button.isExclusiveTouch = true
            button.setTitleColor(UIColor.white, for: []); img = UIImage(named: "search_icon_black") as UIImage?
            button.setImage(img, for: [])
            addSubview(button)
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
}

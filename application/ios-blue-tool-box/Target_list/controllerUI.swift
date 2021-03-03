import Foundation
import UIKit

/// Controller of user interface for each sensor
class controllerUI: UIViewController {
    var colorBox : String = "#336699"
    var UItext = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
    }
    /// This function allow you to define the the name of sensor of each sensor for the UI
    /// - Parameter str: this string correspond to the display the name at the top of the User Interface
    public func nameSensorUI(str : String)
    {
        let UInameSensor = UITextView()
        UInameSensor.text = str
        UInameSensor.textColor = UIColor.black
        UInameSensor.font = UIFont.systemFont(ofSize: 25.0)
        UInameSensor.isUserInteractionEnabled = false
        UInameSensor.font = UIFont.boldSystemFont(ofSize: 25)
        UInameSensor.frame = CGRect(x: 80, y: 70, width: 350, height: 100)
        UInameSensor.backgroundColor = .none
        self.view.addSubview(UInameSensor)
        self.view.bringSubviewToFront(UInameSensor)
    }
    
    
    /// This function allow you to define the the battery level of each sensor for the UI
    /// - Parameter battery: this string correspond to the display the battery level at the top of the User Interface
    public func batteryUI(battery : Int)
    {
        if(battery != -1)
        {
            
            let UIbatterie = UITextView()
            UIbatterie.text = "Low battery"
            UIbatterie.textColor = UIColor.red
            UIbatterie.font = UIFont.systemFont(ofSize: 25.0)
            UIbatterie.isUserInteractionEnabled = false
            UIbatterie.font = UIFont.boldSystemFont(ofSize: 15)
            UIbatterie.frame = CGRect(x: 170, y: 560, width: 350, height: 100)
            UIbatterie.backgroundColor = .none
            self.view.addSubview(UIbatterie)
            self.view.bringSubviewToFront(UIbatterie)
            
            
            let imagelowBattery = "lowBattery"
            let UIimagelowBattery = UIImage(named: imagelowBattery)
            let btn = UIButton()
            btn.frame = CGRect(x: 120, y: 560, width: 45, height: 45)
            btn.blink()
            btn.setImage(UIimagelowBattery, for: .normal)
            self.view.addSubview(btn)
        }
    }
    
 
    
    /// This function allow you to define the logo of each sensor for the UI
    /// - Parameter picture: logo picture at the top of the user interface
    public func logoUI(picture : String)
    {
        let imageTemp = picture
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
    }
    
  
   
    
    /// function allow you to define value or state of sensor at top of the top of the user interface
    /// - Parameters:
    ///   - x: margin-left
    ///   - size: size of the text
    func textUI(x : Int,size : Float)
    {
        UItext.text = ""
        UItext.textColor = UIColor.black
        UItext.font = UIFont.systemFont(ofSize: CGFloat(size))
        UItext.isUserInteractionEnabled = false
        UItext.font = UIFont.boldSystemFont(ofSize: CGFloat(size))
        UItext.frame = CGRect(x: x, y: 150, width: 350, height: 100)
        UItext.backgroundColor = .none
        self.view.addSubview(UItext)
        self.view.bringSubviewToFront(UItext)
    }
    
    
    func line()
    {
        let line = UIView(frame: CGRect(x: 40, y: 150, width: 290, height: 3))
        line.backgroundColor =  UIColor(hexString: colorBox)
        self.view.addSubview(line)
        
        let lineBack = UIView(frame: CGRect(x: 40, y: 200, width: 290, height: 3))
        lineBack.backgroundColor = UIColor(hexString: colorBox)
        self.view.addSubview(lineBack)
    }
}

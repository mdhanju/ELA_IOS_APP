import UIKit

class ConnectViewController: UIViewController {
    
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [displayData]
    private let displayObject : [DisplayObject]
    
    
    init(nameSensor : String,RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array: [displayData],displayObject : [DisplayObject]) {
        self.nameSensor = nameSensor
        self.RSSI = RSSI
        self.identifier = identifier
        self.battery = battery
        self.typedata = typedata
        self.array = array
        self.displayObject = displayObject
        super.init(nibName : nil , bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        
        UIimage(nameOfPicture: "btn_light_on", x: 300, y: 250, width: 45, height: 45)
        UIimage(nameOfPicture: "btn_light_off", x: 300, y: 320, width: 45, height: 45)
   
        
        UIimage(nameOfPicture: "buzz_on", x: 300, y: 400, width: 45, height: 45)
        UIimage(nameOfPicture: "buzz_off", x: 300, y: 470, width: 45, height: 45)
        UIimage(nameOfPicture: "connection", x: 270, y: 100, width: 45, height: 45)
        UIimage(nameOfPicture: "temp", x: 20, y: 70, width: 45, height: 45)
        UIimage(nameOfPicture: "batt_ask", x: 300, y: 540, width: 45, height: 45)
    
        
        
        UItext(str: "In progress ...", text_size: 25.0, x: 80, y: 170, width: 350, height: 100)
        UItext(str: "Send a buzz On on command :", text_size: 15.0, x: 20, y: 400, width: 350, height: 100)
        UItext(str: nameSensor, text_size: 25, x: 80, y: 70, width: 350, height: 100)
        UItext(str: "Connect/Disconnect", text_size: 15, x: 80, y: 100, width: 350, height: 100)
        UItext(str: "Send a buzz Off on command :", text_size: 15, x: 20, y: 470, width: 350, height: 100)
        UItext(str: "battery level :" + String(battery) + " mV", text_size: 15, x: 20, y: 550, width: 350, height: 100)
        UItext(str: "Send a led On on command :", text_size: 15, x: 20, y: 330, width: 350, height: 100)
        UItext(str: "Send a led Off on command :", text_size: 15, x: 20, y: 250, width: 350, height: 100)
        
    }
    
    /// UItext the text UI dispaly on the page
    /// - Parameters:
    ///   - str: label of text
    ///   - text_size: text size
    ///   - x: position in x
    ///   - y: posiiton in y
    ///   - width: the width size of text
    ///   - height: the height size of text
    func UItext(str : String,text_size : Float, x : Int,y : Int,width : Int,height : Int )
    {
        let UIstate = UITextView()
        UIstate.text = str
        UIstate.textColor = UIColor.black
        UIstate.font = UIFont.systemFont(ofSize: CGFloat(text_size))
        UIstate.isUserInteractionEnabled = false
        UIstate.font = UIFont.boldSystemFont(ofSize: CGFloat(text_size))
        UIstate.frame = CGRect(x: x, y: y, width: width, height: height)
        UIstate.backgroundColor = .none
        self.view.addSubview(UIstate)
        self.view.bringSubviewToFront(UIstate)
    }
    /// UIimage picture
    /// - Parameters:
    ///   - nameOfPicture: string name of the picture
    ///   - x: position in x
    ///   - y: position in y
    ///   - width: width of the picture
    ///   - height: height of the picture
    func UIimage(nameOfPicture :String,x : Int,y: Int,width : Int, height : Int)
    {
        let imageBattery = nameOfPicture
        let UIBattery = UIImage(named: imageBattery)
        let imageViewBattery = UIImageView(image: UIBattery!)
        imageViewBattery.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(imageViewBattery)
        self.view.bringSubviewToFront(imageViewBattery)
    }
    
}

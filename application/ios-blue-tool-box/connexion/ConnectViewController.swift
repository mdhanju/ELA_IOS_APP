import UIKit

class ConnectViewController: UIViewController {
    
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]
    private var scanner: sendScanner!
    
    init(nameSensor : String,RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array: [Capteur.Cap],displayObject : [Capteur.DisplayObject]) {
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
        
        
        
        //scanner = sendScanner()
        //scanner.initializeScanner()
        
        
        let UInameSensor = UITextView()
        UInameSensor.text = nameSensor
        UInameSensor.textColor = UIColor.black
        UInameSensor.font = UIFont.systemFont(ofSize: 25.0)
        UInameSensor.isUserInteractionEnabled = false
        UInameSensor.font = UIFont.boldSystemFont(ofSize: 25)
        UInameSensor.frame = CGRect(x: 80, y: 50, width: 350, height: 100)
        UInameSensor.backgroundColor = .none
        self.view.addSubview(UInameSensor)
        self.view.bringSubviewToFront(UInameSensor)
        
        
        let UIconnecter = UITextView()
        UIconnecter.text = "Connect / Disconnect"
        UIconnecter.textColor = UIColor.black
        UIconnecter.font = UIFont.systemFont(ofSize: 25.0)
        UIconnecter.isUserInteractionEnabled = false
        UIconnecter.font = UIFont.boldSystemFont(ofSize: 15)
        UIconnecter.frame = CGRect(x: 80, y: 100, width: 350, height: 100)
        UIconnecter.backgroundColor = .none
        self.view.addSubview(UIconnecter)
        self.view.bringSubviewToFront(UIconnecter)
        
        
        
        let UIstate = UITextView()
        UIstate.text = "State : In progress..."
        UIstate.textColor = UIColor.black
        UIstate.font = UIFont.systemFont(ofSize: 25.0)
        UIstate.isUserInteractionEnabled = false
        UIstate.font = UIFont.boldSystemFont(ofSize: 28)
        UIstate.frame = CGRect(x: 80, y: 170, width: 350, height: 100)
        UIstate.backgroundColor = .none
        self.view.addSubview(UIstate)
        self.view.bringSubviewToFront(UIstate)
        
        
        
        let UIledOn = UITextView()
        UIledOn.text = "Send a led On on command :"
        UIledOn.textColor = UIColor.black
        UIledOn.font = UIFont.systemFont(ofSize: 25.0)
        UIledOn.isUserInteractionEnabled = false
        UIledOn.font = UIFont.boldSystemFont(ofSize: 15)
        UIledOn.frame = CGRect(x: 20, y: 250, width: 350, height: 100)
        UIledOn.backgroundColor = .none
        self.view.addSubview(UIledOn)
        self.view.bringSubviewToFront(UIledOn)
        
        let imageLightOn = "btn_light_on"
        let UIightOn = UIImage(named: imageLightOn)
        let imageViewLightOn = UIImageView(image: UIightOn!)
        imageViewLightOn.frame = CGRect(x: 300, y: 250, width: 45, height: 45)
        self.view.addSubview(imageViewLightOn)
        
        
        let UIledOff = UITextView()
        UIledOff.text = "Send a led Off on command :"
        UIledOff.textColor = UIColor.black
        UIledOff.font = UIFont.systemFont(ofSize: 25.0)
        UIledOff.isUserInteractionEnabled = false
        UIledOff.font = UIFont.boldSystemFont(ofSize: 15)
        UIledOff.frame = CGRect(x: 20, y: 320, width: 350, height: 100)
        UIledOff.backgroundColor = .none
        self.view.addSubview(UIledOff)
        self.view.bringSubviewToFront(UIledOff)
        
        let imageLightOff = "btn_light_off"
        let UIightOff = UIImage(named: imageLightOff)
        let imageViewLightOff = UIImageView(image: UIightOff!)
        imageViewLightOff.frame = CGRect(x: 300, y: 320, width: 45, height: 45)
        self.view.addSubview(imageViewLightOff)
        
        
        let UIbuzzOn = UITextView()
        UIbuzzOn.text = "Send a buzz On on command :"
        UIbuzzOn.textColor = UIColor.black
        UIbuzzOn.font = UIFont.systemFont(ofSize: 25.0)
        UIbuzzOn.isUserInteractionEnabled = false
        UIbuzzOn.font = UIFont.boldSystemFont(ofSize: 15)
        UIbuzzOn.frame = CGRect(x: 20, y: 400, width: 350, height: 100)
        UIbuzzOn.backgroundColor = .none
        self.view.addSubview(UIbuzzOn)
        self.view.bringSubviewToFront(UIbuzzOn)
        
        let UIBuzzOn = UIImage(named: "buzz_on")
        let imageViewBuzzOn = UIImageView(image: UIBuzzOn!)
        imageViewBuzzOn.frame = CGRect(x: 300, y: 400, width: 45, height: 45)
        self.view.addSubview(imageViewBuzzOn)
        
        let UIbuzzOff = UITextView()
        UIbuzzOff.text = "Send a buzz Off on command :"
        UIbuzzOff.textColor = UIColor.black
        UIbuzzOff.font = UIFont.systemFont(ofSize: 25.0)
        UIbuzzOff.isUserInteractionEnabled = false
        UIbuzzOff.font = UIFont.boldSystemFont(ofSize: 15)
        UIbuzzOff.frame = CGRect(x: 20, y: 470, width: 350, height: 100)
        UIbuzzOff.backgroundColor = .none
        self.view.addSubview(UIbuzzOff)
        self.view.bringSubviewToFront(UIbuzzOff)
        
        let imageBuzzOff = "buzz_off"
        let UIBuzzOff = UIImage(named: imageBuzzOff)
        let imageViewBuzzOff = UIImageView(image: UIBuzzOff!)
        imageViewBuzzOff.frame = CGRect(x: 300, y: 470, width: 45, height: 45)
        self.view.addSubview(imageViewBuzzOff)
        
        let UIbattery = UITextView()
        UIbattery.text = "battery level :" + String(battery) + " mV"
        UIbattery.textColor = UIColor.black
        UIbattery.font = UIFont.systemFont(ofSize: 25.0)
        UIbattery.isUserInteractionEnabled = false
        UIbattery.font = UIFont.boldSystemFont(ofSize: 15)
        UIbattery.frame = CGRect(x: 20, y: 550, width: 350, height: 100)
        UIbattery.backgroundColor = .none
        self.view.addSubview(UIbattery)
        self.view.bringSubviewToFront(UIbattery)
        
        let imageBattery = "batt_ask"
        let UIBattery = UIImage(named: imageBattery)
        let imageViewBattery = UIImageView(image: UIBattery!)
        imageViewBattery.frame = CGRect(x: 300, y: 550, width: 45, height: 45)
        self.view.addSubview(imageViewBattery)
        
        let imageConnect = "connection"
        let UIconnect = UIImage(named: imageConnect)
        let imageVIewConnect = UIImageView(image: UIconnect!)
        imageVIewConnect.frame = CGRect(x: 270, y: 100, width: 45, height: 45)
        self.view.addSubview(imageVIewConnect)
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
    }
}

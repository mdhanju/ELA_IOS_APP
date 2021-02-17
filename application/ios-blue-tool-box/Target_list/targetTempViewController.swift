import UIKit
import Charts

// MARK: Extension

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}



extension UIButton {
    func blink() {
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.6, //Time duration you want,
                       delay: 0.0,
                       options: [.curveEaseInOut, .autoreverse, .repeat],
                       animations: { [weak self] in self?.alpha = 1.0 },
                       completion: { [weak self] _ in self?.alpha = 0.0 })
    }
    
    func stopBlink() {
        self.layer.removeAllAnimations()
        self.alpha = 1.0;
        self.isHidden = false
        // [self.layer removeAllAnimations];
    }
}

extension UIView {
    func blink(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, alpha: CGFloat = 0.0) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
            self.alpha = alpha
        })
    }
}

// MARK: Class



class targetTempViewController: UIViewController,ChartViewDelegate {
    
    
    private let data1 = LineChartData()
    private var entries = [ChartDataEntry]()
    private var entries1 = [ChartDataEntry]()
    private var lineChart = LineChartView()
    private var numberTemperature = 25
   var UItemperature = UITextView()
    
    
    // Compteur graphe entries
    private var compteur = 0
    // Compteur graphe umdite
    private var compHum = 0
    
    private var UIimagelowBattery = UIImage()
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]
    private var scanner: Scanner1!
    private var sensorT : SensorTypes? = nil
    
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
    

    
    
    @objc func imageTapTemp() {
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata:typedata, array: array, displayObject: displayObject), animated: true)
        view.layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        updateSensorUI(data: data)
    }
    
    func updateSensorUI(data: ([String : Sensor])) -> Capteur.DisplayObject {
        
        let objectTemp1 = Capteur.Temp(temp: 0)
        
        let newobject : Capteur.DisplayObject = Capteur.DisplayObject(name: "null", RSSI: 0, identifier: "",battery : 0, typedata : SensorTypes.SensorID, array: [objectTemp1])
        
        for (key,value) in data
        {
            
            if(key == identifier)
            {
                if(value is SensorTemperature)
                {
                    if let tempHum = value as? SensorTemperature
                    {
                        UItemperature.text = String(tempHum.getTemp()) + "°C"
                        entries.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getTemp())))
                        compteur = compteur + 1
                        compHum = compHum + 1
                        
                        let set = LineChartDataSet(entries: entries, label: "temperature")
                        set.setColor(UIColor(hexString: "#336699"))
                        set.setCircleColor(UIColor(hexString: "#336699"))
                        let data = LineChartData(dataSet: set)
                        lineChart.data = data
                       
                    }
                    
                }
            }
        }
        if(entries.count >= 8)
        {
            entries.removeFirst(1)
        }
        
        
        return newobject
    }
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        let line = UIView(frame: CGRect(x: 40, y: 150, width: 290, height: 3))
        line.backgroundColor =  UIColor(hexString: "#336699")
        self.view.addSubview(line)
        
        let lineBack = UIView(frame: CGRect(x: 40, y: 200, width: 290, height: 3))
        lineBack.backgroundColor = UIColor(hexString: "#336699")
        self.view.addSubview(lineBack)
        
        view.backgroundColor = .white
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        
        let UInameSensor = UITextView()
        UInameSensor.text = nameSensor
        UInameSensor.textColor = UIColor.black
        UInameSensor.font = UIFont.systemFont(ofSize: 25.0)
        UInameSensor.isUserInteractionEnabled = false
        UInameSensor.font = UIFont.boldSystemFont(ofSize: 25)
        UInameSensor.frame = CGRect(x: 80, y: 70, width: 350, height: 100)
        UInameSensor.backgroundColor = .none
        self.view.addSubview(UInameSensor)
        self.view.bringSubviewToFront(UInameSensor)
        
        
        
        UItemperature.text = String("")
        UItemperature.textColor = UIColor.black
        UItemperature.font = UIFont.systemFont(ofSize: 25.0)
        UItemperature.isUserInteractionEnabled = false
        UItemperature.font = UIFont.boldSystemFont(ofSize: 25)
        UItemperature.frame = CGRect(x: 150, y: 150, width: 350, height: 100)
        UItemperature.backgroundColor = .none
        self.view.addSubview(UItemperature)
        self.view.bringSubviewToFront(UItemperature)
        

        
        
        

        
        
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
        
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
        
        let imageArray = "sklia"
        let UIarray = UIImage(named: imageArray)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(image: UIarray, landscapeImagePhone: .none, style: .done, target: self, action: #selector(imageTapTemp)))
        items.append(UIBarButtonItem(title: "Connexion", style: .plain, target: self,action: .none))
        
        self.navigationItem.setRightBarButtonItems(items, animated: true)
        
        lineChart.delegate = self
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: 350, height:200)
        lineChart.center = view.center
        
        view.addSubview(lineChart)
        
       
        for cle in displayObject {
            if( cle.identifier == identifier)
            
            {
                if let temp : [Capteur.Temp] = cle.array as? [Capteur.Temp]
                {
                  
                    for x in 0..<cle.array.count
                    {
                        entries.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getTemp())))
                        compteur = compteur + 1
                    }
                    
                }
            }
        }
        let set = LineChartDataSet(entries: entries, label: "temperature")
        set.setColor(UIColor(hexString: "#336699"))
        set.setCircleColor(UIColor(hexString: "#336699"))
        let data = LineChartData(dataSet: set)
        lineChart.data = data
        
        
    }
    
    
}



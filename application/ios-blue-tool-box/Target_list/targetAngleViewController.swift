import UIKit
import Charts

class targetAngleViewController: UIViewController,ChartViewDelegate {
    
    private var lineChart = LineChartView()
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]
    
    var entries = [ChartDataEntry]()
    var entries1 = [ChartDataEntry]()
    var entries2 = [ChartDataEntry]()
    
    // Compteur graphe entries
    private var compteur = 0
    // Compteur graphe umdite
    private var compHum = 0
    
    let data1 = LineChartData()
    
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
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata: typedata, array: array, displayObject: displayObject), animated: true)
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
                if(value is SensorAngle)
                {
                    if let tempHum = value as? SensorAngle
                    {
                        entries.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getX())))
                        entries1.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getY())))
                        entries2.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getZ())))
                        compteur = compteur + 1
                        compHum = compHum + 1
                        
                        let line2 = LineChartDataSet(entries: entries, label: "X")
                        line2.setColor(.red)
                        line2.setCircleColor(.red)
                        let line1 = LineChartDataSet(entries: entries1, label: "Y")
                        line1.setColor(.green)
                        line1.setCircleColor(.green)
                        let line3 = LineChartDataSet(entries: entries2, label: "Z")
                        
                        
                       
                        let data = LineChartData(dataSet: line1)
                       
                    
                        data.addDataSet(line2)
                        data.addDataSet(line3)
                        lineChart.data = data
                       
                    }
                    
                }
            }
        }
        return newobject
    }
    
    
    
    override func viewDidLoad() {
        
        
        
        
        
        super.viewDidLoad()
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
        UInameSensor.frame = CGRect(x: 80, y: 50, width: 350, height: 100)
        UInameSensor.backgroundColor = .none
        self.view.addSubview(UInameSensor)
        self.view.bringSubviewToFront(UInameSensor)
    
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
            
            //   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        }
        
        
        
        
        let imageAngle = "angle"
        let UIimageAngle = UIImage(named: imageAngle)
        let imageViewAngle = UIImageView(image: UIimageAngle!)
        imageViewAngle.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewAngle)
        
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
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: self.view.frame.size.width, height:self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        

        
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let temp : [Capteur.Angle] = cle.array as? [Capteur.Angle]
                {
                    for x in 0..<cle.array.count
                    {
                        entries.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getX())))
                        compteur = compteur + 1
                    }
                    
                }
                
                if let temp : [Capteur.Angle] = cle.array as? [Capteur.Angle]
                {
                    for x in 0..<cle.array.count
                    {
                        entries1.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getY())))
                    }
                    
                }
                if let temp : [Capteur.Angle] = cle.array as? [Capteur.Angle]
                {
                    for x in 0..<cle.array.count
                    {
                        entries2.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getZ())))
                    }
                }
            }
        }
        
    
        let line2 = LineChartDataSet(entries: entries, label: "X")
        line2.setColor(.red)
        line2.setCircleColor(.red)
        let line1 = LineChartDataSet(entries: entries1, label: "Y")
        line1.setColor(.green)
        line1.setCircleColor(.green)
        let line3 = LineChartDataSet(entries: entries2, label: "Z")
        
        
       
        let data = LineChartData(dataSet: line1)
       
    
        data.addDataSet(line2)
        data.addDataSet(line3)
        lineChart.data = data
        
        
        let imageArray = "sklia"
        let UIarray = UIImage(named: imageArray)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(image: UIarray, landscapeImagePhone: .none, style: .done, target: self, action: #selector(imageTapTemp)))
        items.append(UIBarButtonItem(title: "Connexion", style: .plain, target: self,action: .none))
        
        self.navigationItem.setRightBarButtonItems(items, animated: true)
           
       }
       
   }

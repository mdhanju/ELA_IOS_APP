import UIKit
import Charts


class targetTempViewController: controllerGrapheUI,ChartViewDelegate {
    
    
    private let data1 = LineChartData()
    private var entries = [ChartDataEntry]()
    private var entries1 = [ChartDataEntry]()
    private var lineChart = LineChartView(frame: CGRect(x: 0, y: 500,width: 350, height:250))
    private var donnee : String = ""
    
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
                       // UItemperature.text = String(tempHum.getTemp()) + "°C"
                        //donnee = String(tempHum.getTemp()) + "°C"
                    valueUI(donnees: String(tempHum.getTemp()) + "°C")
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
        

        
       // view.backgroundColor = .white
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        
        nameSensorUI(str: nameSensor)
        batteryUI(battery: battery)
        logoUI(picture: "temp")
        textUI(size: 150)

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
        
        
        lineChart.frame = CGRect(x: 0, y: 300,width: 350, height:250)
      //  lineChart.center = view.center
        
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



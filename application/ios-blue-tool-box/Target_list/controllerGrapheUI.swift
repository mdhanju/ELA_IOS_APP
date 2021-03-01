import UIKit
import Charts
class controllerGrapheUI: controllerUI, ChartViewDelegate {
    
    private let data1 = LineChartData()
    private var entries = [ChartDataEntry]()
    private var entries1 = [ChartDataEntry]()
    private var entries2 = [ChartDataEntry]()
    var UItext = UITextView()
    private var lineChart = LineChartView()
    
    var donnee : String = ""
    
    // Compteur graphe entries
    private var compteur = 0
    // Compteur graphe umdite
    private var compHum = 0
    
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
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata: typedata, array: array, displayObject: displayObject), animated: true)
        view.layoutIfNeeded()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        print("test 1940")
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
                        valueUI(donnees: "x : " + String( tempHum.getX()) + "mg  y :" + String(tempHum.getY()) + "mg  z : " +  String(tempHum.getZ()) + "mg ")
                        
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
                
                
                
                if(value is SensorTemperatureHumidity)
                {
                    if let tempHum = value as? SensorTemperatureHumidity
                    {
                        valueUI(donnees: String(tempHum.getTemp()) + "°C   " + String(tempHum.getHum()) + "%")
                        
                        
                        entries.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getTemp())))
                        entries1.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getHum())))
                        compteur = compteur + 1
                        compHum = compHum + 1
                        let line2 = LineChartDataSet(entries: entries, label: "temperature")
                        line2.setColor(.red)
                        line2.setCircleColor(.red)
                        let line1 = LineChartDataSet(entries: entries1, label: "humidite")
                        
                        
                        
                        let data = LineChartData(dataSet: line1)
                        
                        
                        data.addDataSet(line2)
                        lineChart.data = data
                        
                        
                    }
                    
                }
                
                
            }
        }
        if(entries.count >= 8)
        {
            entries.removeFirst(1)
            
        }
        if(entries1.count >= 8)
        {
            entries1.removeFirst(1)
        }
        
        if(entries2.count >= 8)
        {
            entries2.removeFirst(1)
        }
        return newobject
    }
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
    
    
    
    func valueUI(donnees : String)
    {
        UItext.text = donnees
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        
        
        
        
        nameSensorUI(str: nameSensor)
        batteryUI(battery: battery)
        if( typedata == SensorTypes.SensorTemperatureHumidity)
        {
            logoUI(picture: "humidite_blue")
            textUI(x: 110,size: 25.0)
        }
        
        if( typedata == SensorTypes.SensorTemperature)
        {
            logoUI(picture: "temp")
            textUI(x: 130,size : 25.0)
        }
        
        if( typedata == SensorTypes.SensorAngle)
        {
            logoUI(picture: "angle")
            textUI(x: 30,size : 22.0)
        }
        
        
        
        
        
        let imageArray = "sklia"
        let UIarray = UIImage(named: imageArray)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(image: UIarray, landscapeImagePhone: .none, style: .done, target: self, action: #selector(imageTapTemp)))
        items.append(UIBarButtonItem(title: "Connexion", style: .plain, target: self,action: .none))
        
        self.navigationItem.setRightBarButtonItems(items, animated: true)
        
        var item = [UIBarButtonItem]()
        item.append(UIBarButtonItem(title: "Blue T", style: .plain, target: self,action: .none))
    
        
        
        lineChart.delegate = self
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        lineChart.frame = CGRect(x: 0, y: 300,width: 350, height:250)
        //     lineChart.center = view.center
        view.addSubview(lineChart)
        
        let line = UIView(frame: CGRect(x: 40, y: 150, width: 290, height: 3))
        line.backgroundColor =  UIColor(hexString: "#336699")
        self.view.addSubview(line)
        
        let lineBack = UIView(frame: CGRect(x: 40, y: 200, width: 290, height: 3))
        lineBack.backgroundColor = UIColor(hexString: "#336699")
        self.view.addSubview(lineBack)
        
        
        
        for cle in displayObject {
            if( cle.identifier == identifier)
            
            {
                if( cle.typedata is SensorAngle)
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
                
                if(cle is SensorTemperatureHumidity)
                {
                    
                    if let temp : [Capteur.TempHum] = cle.array as? [Capteur.TempHum]
                    {
                        for x in 0..<cle.array.count
                        {
                            print("la val de x = " + String(x))
                            print("la val de compteur = " + String(compteur))
                            
                            entries.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getTemp())))
                            entries1.append(ChartDataEntry(x: Double(x),y: Double(temp[x].getHum())))
                            compteur = compteur + 1
                            compHum = compHum + 1
                        }
                        
                    }
                }
                
                if(cle is SensorTemperature)
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
        }
        
        
        let line1 = LineChartDataSet(entries: entries1, label: "Humidity")
        
        let line2 = LineChartDataSet(entries: entries, label: "Temperature")
        line2.setColor(.red)
        line2.setCircleColor(.red)
        let data = LineChartData(dataSet: line1)
        data.addDataSet(line2)
        //   data1.addDataSet(line1)
        // data1.addDataSet(line2)
        lineChart.data = data
        
    }
    
}

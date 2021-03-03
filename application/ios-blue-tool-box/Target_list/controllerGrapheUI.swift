import UIKit
import Charts
/// controller for the sensor temperature, humidity and angle
class controllerGrapheUI: controllerUI, ChartViewDelegate {
    
    private let data1 = LineChartData()
    private var entries = [ChartDataEntry]()
    private var entries1 = [ChartDataEntry]()
    private var entries2 = [ChartDataEntry]()
    private var entries4 = [ChartDataEntry]()
   
    private var lineChart = LineChartView()
    
    var donnee : String = ""
    
    private var MaxValueInGraph : Int = 8
    
    // Compteur graphe entries
    private var compteur = 0
    // Compteur graphe umdite
    private var compHum = 0
    
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Cap]
    private let displayObject : [DisplayObject]
    
    private var scanner: Scanner1!
    
    private var sensorT : SensorTypes? = nil
    
    init(nameSensor : String,RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array: [Cap],displayObject : [DisplayObject]) {
        self.nameSensor = nameSensor
        self.RSSI = RSSI
        self.identifier = identifier
        self.battery = battery
        self.typedata = typedata
        self.array = array
        self.displayObject = displayObject
        
        
        super.init(nibName : nil , bundle : nil)
    }
    
    
    /// Navigate to the page for give order to tag.
    @objc func imageTapTemp() {
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata: typedata, array: array, displayObject: displayObject), animated: true)
        view.layoutIfNeeded()
    }
    
    func grapheColorLabel(label : String)
    {
        let set = LineChartDataSet(entries: entries, label: label)
        set.setColor(UIColor(hexString: colorBox))
        set.setCircleColor(UIColor(hexString: colorBox))
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// retrieve  dictionnary of sensor from scanner1.swift
    /// - Parameter data: dictionnary[key,value]
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        updateSensorUI(data: data)
    }
    /// Update the UICircular bar value with the value of sensor
    /// - Parameter data: dtictionnary of sensor the key is peripheral.identifier and Sensor is define in the factory
    /// - Returns: DisplayObject  that store the information of sensor
    func updateSensorUI(data: ([String : Sensor])) -> DisplayObject {
        
        
        let objectTemp1 = Temp(temp: 0)
        
        let newobject : DisplayObject = DisplayObject(name: "null", RSSI: 0, identifier: "",battery : 0, typedata : SensorTypes.SensorID, array: [objectTemp1])
        
        for (key,value) in data
        {
            
            if(key == identifier)
            {
           
                switch value {
                
                case is SensorAngle:
                    if let angle = value as? SensorAngle
                    {
                        valueUI(donnees: "x : " + String( angle.getX()) + "mg  y :" + String(angle.getY()) + "mg  z : " +  String(angle.getZ()) + "mg ")
                        
                        entries.append(ChartDataEntry(x: Double(compteur),y: Double(angle.getX())))
                        entries1.append(ChartDataEntry(x: Double(compteur),y: Double(angle.getY())))
                        entries2.append(ChartDataEntry(x: Double(compteur),y: Double(angle.getZ())))
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
                
                
                case is SensorTemperature:
                   
                    if let temp = value as? SensorTemperature
                    {
                        valueUI(donnees: String(temp.getTemp()) + "°C")
                        entries.append(ChartDataEntry(x: Double(compteur),y: Double(temp.getTemp())))
                        compteur = compteur + 1
                        compHum = compHum + 1
                        grapheColorLabel(label: "temperature")
                    }
                    
                    
                    
                    
                case is SensorID:
                
                        if let ID = value as? SensorID
                        {
                            valueUI(donnees: String(ID.RSSI) + " dbm")
                            entries.append(ChartDataEntry(x: Double(compteur),y: Double(ID.RSSI)))
                            compteur = compteur + 1
                            compHum = compHum + 1
                            
                            grapheColorLabel(label: "dbm")
                        }
                    
                case is SensorTemperatureHumidity:
                    
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
                    
                
                    
                    
                default : print("this is not a Sensor controllerGrapheUI")
                    
                }
                
                
                
                
                
            
                
                
            }
        }
        // delete first value of array for keep only 8 value on the graph
        if(entries.count >= MaxValueInGraph)
        {
            entries.removeFirst(1)
            
        }
        if(entries1.count >= MaxValueInGraph)
        {
            entries1.removeFirst(1)
        }
        
        if(entries2.count >= MaxValueInGraph)
        {
            entries2.removeFirst(1)
        }
        return newobject
    }

    
    
    
    /// take the value of graph and print it on title
    /// - Parameter donnees: the string data on top of the user interface screen
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
        line()
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
        
        if( typedata == SensorTypes.SensorID)
        {
            logoUI(picture: "blue")
            textUI(x: 110,size : 25.0)
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
    
    /// Design of UICharts the graph with color and label, size set  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        lineChart.frame = CGRect(x: 0, y: 300,width: 350, height:250)
        //     lineChart.center = view.center
        view.addSubview(lineChart)
        
        
     
        
    }
    
}



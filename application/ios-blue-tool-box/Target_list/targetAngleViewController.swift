import UIKit
import Charts

class targetAngleViewController: controllerGrapheUI,ChartViewDelegate {
    
    private var lineChart = LineChartView()
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]
    var donnee : String = ""
    
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
                        valueUI(donnees: String(tempHum.getX()) + "mg  " + String(tempHum.getY()) + "mg  " +  String(tempHum.getZ()) + "mg ")
                     
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
        if(entries.count >= 8)
        {
            entries.removeFirst(1)
            entries1.removeFirst(1)
            entries2.removeFirst(1)
        }
        return newobject
    }
    
    
    
    override func viewDidLoad() {
        
        
        
        
        
        super.viewDidLoad()
        view.backgroundColor = .white
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        nameSensorUI(str: nameSensor)
        batteryUI(battery: battery)
        logoUI(picture: "angle")
    

        
        
        
  
        
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
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: 350, height:250)
        lineChart.center = view.center
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

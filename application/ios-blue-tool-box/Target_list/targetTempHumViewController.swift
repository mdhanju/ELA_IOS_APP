import UIKit
import Charts
class targetTempHumViewController: UIViewController,ChartViewDelegate {
    
    private let data1 = LineChartData()
    private var entries = [ChartDataEntry]()
    private var entries1 = [ChartDataEntry]()
    
    private var lineChart = LineChartView()
    
    
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
                
                
                
                
                
                if(value is SensorTemperatureHumidity)
                {
                    if let tempHum = value as? SensorTemperatureHumidity
                    {
                       
                        entries.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getTemp())))
                        entries1.append(ChartDataEntry(x: Double(compteur),y: Double(tempHum.getHum())))
                        compteur = compteur + 1
                        compHum = compHum + 1
                        let line2 = LineChartDataSet(entries: entries, label: .none)
                        let line1 = LineChartDataSet(entries: entries1, label: .none)
                        
                        
                        line1.setColor(.purple)
                        line1.setCircleColor(.purple)
                        line2.setColor(.red)
                        line2.setCircleColor(.red)
                        data1.addDataSet(line2)
                        data1.addDataSet(line1)
                        lineChart.data = data1
                        
                        
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
        }
        
        
        
        
        let imageTempHum = "humidite_blue"
        let UIimageTempHum = UIImage(named: imageTempHum)
        let imageViewTemp = UIImageView(image: UIimageTempHum!)
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
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: self.view.frame.size.width, height:self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        
        
        for cle in displayObject {
            if( cle.identifier == identifier)
                
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
        }
        
        
        let line1 = LineChartDataSet(entries: entries1, label: "Humidity")
        
        let line2 = LineChartDataSet(entries: entries, label: "Temperature")
        line1.setColor(.purple)
        line1.setCircleColor(.purple)
        line2.setColor(.red)
        line2.setCircleColor(.red)
        data1.addDataSet(line1)
        data1.addDataSet(line2)
        lineChart.data = data1
        
    }
    
}

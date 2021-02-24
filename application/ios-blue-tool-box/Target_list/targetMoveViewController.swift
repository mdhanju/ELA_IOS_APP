import UIKit
import Charts
import UICircularProgressRing
class targetMoveViewController: controllerEtat,ChartViewDelegate {
    
    private var capteur: Capteur!
   
    private let UIimagelowPerson = UIImage(named: "PersonRunning")
    private let UIimagelowPersonStatic = UIImage(named: "Person")
    private let progressRing = UICircularProgressRing(frame:  CGRect(x: 100, y: 350, width: 230, height: 230))
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private var displayObject : [Capteur.DisplayObject]
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
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata: typedata,array: array, displayObject: displayObject), animated: true)
        view.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor]))
    {
    print("test 1930")
    updateSensorUI(data: data)
                                                                
    }
    
    func updateSensorUI(data: ([String : Sensor])) -> Capteur.DisplayObject {
        
        let objectTemp1 = Capteur.Temp(temp: 0)
        
        let newobject : Capteur.DisplayObject = Capteur.DisplayObject(name: "null", RSSI: 0, identifier: "",battery : 0, typedata : SensorTypes.SensorID, array: [objectTemp1])
        
        for (key,value) in data
        {
            
            if(key == identifier)
            {
                if(value is SensorMove)
                {
                    if let move = value as? SensorMove
                    {
                       
                        progressRing.value = CGFloat(move.getNbrPas())
                        print("progress ring" + String(move.getNbrPas()) + "son nom " + move.name )
                        if(move.getEtat() == true)
                        {
                       
                            
                            setEtat(image : UIimagelowPerson!,str : "Etat : déplacement")
                        }
                        else {
                            
                            setEtat(image : UIimagelowPersonStatic!,str : "Etat : statique")
                        }
                    }
                    
                }
                
                displayObject.append(newobject)
            }

        }
        return newobject
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)

        nameSensorUI(str: nameSensor)
        batteryUI(battery: battery)
        logoUI(picture: "mouvement_blue")
        
              
   
        
      
        let imageArray = "sklia"
        let UIarray = UIImage(named: imageArray)
        
        var items = [UIBarButtonItem]()
        items.append(UIBarButtonItem(image: UIarray, landscapeImagePhone: .none, style: .done, target: self, action: #selector(imageTapTemp)))
        items.append(UIBarButtonItem(title: "Connexion", style: .plain, target: self,action: .none))
        
        self.navigationItem.setRightBarButtonItems(items, animated: true)
        
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let Move : [Capteur.Move] = cle.array as? [Capteur.Move]
                {
                    
                    
                    print(Move[array.count-1].getEtat() == false)
                    if(Move[array.count-1].getEtat() == true)
                    {
                        
                        
                        
                        setEtat(image : UIimagelowPerson!,str : "Etat : déplacement")
                    }
                    else {
                        
                    
                        setEtat(image : UIimagelowPersonStatic!,str : "Etat : statique")
                        
                        
                    }
                    
                }
            }
        }
        progressRing.minValue = 1
        progressRing.maxValue = 32000
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let temp : [Capteur.Move] = cle.array as? [Capteur.Move]
                {
                    for x in 0..<cle.array.count
                        
                    {
                        progressRing.value = CGFloat(temp[x].getNbrPas())
                    }
                }
            }
        }
        progressRing.innerRingColor = UIColor.orange
        
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " mouvements", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
        
        self.view.addSubview(progressRing)
    }
    
    
    func initializeInfoSensor(sensor : SensorTypes)
    {
        sensorT = sensor
    }
    
    
    
    
}

import UIKit
import Charts
import UICircularProgressRing
class targetMoveViewController: controllerUI,ChartViewDelegate {
    
    private var capteur: Capteur!
    private let btnPerson = UIButton()
    private let UIimagelowPerson = UIImage(named: "PersonRunning")
    private let UIimagelowPersonStatic = UIImage(named: "Person")
    private let progressRing = UICircularProgressRing(frame:  CGRect(x: 150, y: 200, width: 100, height: 100))
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private var displayObject : [Capteur.DisplayObject]
    private var scanner: Scanner1!
    private var sensorT : SensorTypes? = nil
    private var UInameseuil = UITextView()
    
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
                            btnPerson.setImage(UIimagelowPerson, for: .normal)
                            
                            UInameseuil.text = "Etat : en déplacement"
                        }
                        else {
                            
                            btnPerson.setImage(UIimagelowPersonStatic, for: .normal)
                            
                            UInameseuil.text = "Etat : position statique"
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
        view.backgroundColor = .white
        
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)

        nameSensorUI(str: nameSensor)
        batteryUI(battery: battery)
        logoUI(picture: "mouvement_blue")
        
              
        self.UInameseuil = UITextView()
        self.UInameseuil.text = "Etat : position statique"
        self.UInameseuil.textColor = UIColor.black
        self.UInameseuil.font = UIFont.systemFont(ofSize: 15)
        self.UInameseuil.isUserInteractionEnabled = false
        self.UInameseuil.font = UIFont.boldSystemFont(ofSize: 15)
        self.UInameseuil.frame = CGRect(x: 80, y: 150, width: 350, height: 100)
        self.UInameseuil.backgroundColor = .none
        self.view.addSubview(UInameseuil)
        self.view.bringSubviewToFront(UInameseuil)
        
      
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
                        
                        
                        
                        btnPerson.frame = CGRect(x: 250, y: 130 ,width: 45, height: 45)
                        btnPerson.blink()
                        btnPerson.setImage(UIimagelowPerson, for: .normal)
                        self.view.addSubview(btnPerson)
                    }
                    else {
                        
                    
                        btnPerson.frame = CGRect(x: 300, y: 130 ,width: 45, height: 45)
                        btnPerson.blink()
                        btnPerson.setImage(UIimagelowPersonStatic, for: .normal)
                        self.view.addSubview(btnPerson)
                        
                        
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
        
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " pas", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
        
        self.view.addSubview(progressRing)
    }
    
    
    func initializeInfoSensor(sensor : SensorTypes)
    {
        sensorT = sensor
    }
    
    
    
    
}

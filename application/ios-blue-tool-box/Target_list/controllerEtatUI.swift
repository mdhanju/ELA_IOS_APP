import UIKit
import UICircularProgressRing

/**
    This class is usefull to display a windows with graphical values plot.
    This object ihnerit from controllerUI Object

*/
class controllerEtatUI: controllerUI {
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: 180, y: 250), radius: CGFloat(20), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
    
    let shapeLayer = CAShapeLayer()
    
   
    
    
    var stateStatic : String = "Etat : statique"
    var stateMove : String = "Etat : déplacement"

    let nameSensor : String
    let RSSI : Int
    let identifier : String
    let battery : Int
    let typedata : SensorTypes
    let  array : [Cap]
    var  displayObject : [DisplayObject]
    

    private var capteur: Capteur!
    
    private let UIimagelowPerson = UIImage(named: "PersonRunning")
    private let UIimagelowPersonStatic = UIImage(named: "Person")
    private let progressRing = UICircularProgressRing(frame:  CGRect(x: 70, y: 350, width: 230, height: 230))
    
    private var scanner: Scanner1!
    private var sensorT : SensorTypes? = nil
    
    
    private var UInameState = UITextView()
    private let btnPerson = UIButton()
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        nameSensorUI(str: nameSensor)
        UItextState()
        batteryUI(battery: battery)
        if( typedata == SensorTypes.SensorMove)
        {
            logoUI(picture: "mouvement_blue")
        }
        
        if( typedata == SensorTypes.SensorMagnetic)
        {
            logoUI(picture: "porte_blue")
        }
        
        // declare scanner to scan bluetooth devices
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        super.viewDidLoad()
        
        line()
        

        

        
        // Do any additional setup after loading the view.
        
        for cle in displayObject {
            if( cle.identifier == identifier)
            
            {
                
                if let Move : [Move] = cle.array as? [Move]
                {

                    if(Move[array.count-1].getEtat() == true)
                    {
       
                        setEtat(image : UIimagelowPerson!,str : stateMove)
                   
                    }
                    else {
                        

                        setEtat(image : UIimagelowPersonStatic!,str : stateStatic)
                        
                    }
                    
                }
            }
        }
        progressRing.minValue = 1
        progressRing.maxValue = 32000
        progressRing.innerRingColor = UIColor.orange
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " step", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
        
        self.view.addSubview(progressRing)
    }
    
    
    /// retrieve  dictionnary of sensor from scanner1.swift
    /// - Parameter data: dictionnary[key,value]
    func handleNewObjectAvailable(data: ([String : Sensor]))
    {
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
            // A REFACTORISER POUR FAIRE QU'UNE FONCTION
            if(key == identifier)
            {
                var state = false
                if(value is SensorMove)
                {
                    if let move = value as? SensorMove
                    {
                        
                        progressRing.value = CGFloat(move.getNbrPas())
                        print("progress ring" + String(move.getNbrPas()) + "son nom " + move.name )
                        state = move.getEtat()
                    }
                    
                }
                if(value is SensorMagnetic)
                {
                    if let magnetic = value as? SensorMagnetic
                    {
                        
                        progressRing.value = CGFloat(magnetic.getNbrObject())
                        print("progress ring" + String(magnetic.getNbrObject()) + "son nom " + magnetic.name )
                        state = magnetic.getEtat()
                    }
                    
                }
                
                displayObject.append(newobject)
                if(state == true)
                {
                    setEtat(image : UIimagelowPerson!,str : stateMove)
                }
                else {
                
                    setEtat(image : UIimagelowPersonStatic!,str : stateStatic)
                }
            }
            
        }
        return newobject
    }
    
    /// Display on screen the state  on/off by a picture
    /// - Parameters:
    ///   - image: picture show the sensor is moving
    ///   - str: update the number inside UIprogressBar
    func setEtat(image : UIImage,str : String)
    {
        btnPerson.setImage(image, for: .normal)
        UInameState.text = str
        
        btnPerson.frame = CGRect(x: 170, y: 250 ,width: 45, height: 45)
        
        
        self.view.addSubview(btnPerson)
    }
    
    /// statique ou deplacement
    func UItextState()
    {
        self.UInameState.text = stateStatic
        self.UInameState.textColor = UIColor.black
        self.UInameState.font = UIFont.systemFont(ofSize: 25)
        self.UInameState.isUserInteractionEnabled = false
        self.UInameState.font = UIFont.boldSystemFont(ofSize: 25)
        self.UInameState.frame = CGRect(x: 110, y: 150, width: 350, height: 100)
        self.UInameState.backgroundColor = .none
        self.view.addSubview(UInameState)
        self.view.bringSubviewToFront(UInameState)
    }
    
    func initializeInfoSensor(sensor : SensorTypes)
    {
        sensorT = sensor
    }
}

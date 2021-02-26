import UIKit
import UICircularProgressRing
class controllerEtatUI: controllerUI {
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: 180, y: 250), radius: CGFloat(20), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
    let shapeLayer = CAShapeLayer()
    

     let nameSensor : String
     let RSSI : Int
     let identifier : String
     let battery : Int
     let typedata : SensorTypes
     let  array : [Capteur.Cap]
     var  displayObject : [Capteur.DisplayObject]
    
    
    private var capteur: Capteur!
   
    private let UIimagelowPerson = UIImage(named: "PersonRunning")
    private let UIimagelowPersonStatic = UIImage(named: "Person")
    private let progressRing = UICircularProgressRing(frame:  CGRect(x: 70, y: 350, width: 230, height: 230))

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    private var UInameseuil = UITextView()
    private let btnPerson = UIButton()
    
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
                       
                         /*   shapeLayer.fillColor = UIColor.yellow.cgColor
                            let animation = CABasicAnimation(keyPath: "strokeEnd")
                            animation.fromValue = 0
                            animation.toValue = 1
                            animation.duration = 2
                            animation.autoreverses = true
                            animation.repeatCount = .infinity
                          shapeLayer.add(animation, forKey: "line")
                            */
                            
                            setEtat(image : UIimagelowPerson!,str : "Etat : déplacement")
                         //   btnPerson.blink()
                        }
                        else {
                       //     shapeLayer.removeAllAnimations()
                     //       shapeLayer.fillColor = UIColor.clear.cgColor
                            setEtat(image : UIimagelowPersonStatic!,str : "Etat : statique")
                           // btnPerson.stopBlink()
                           
                        }
                    }
                    
                }
                
                if(value is SensorMagnetic)
                {
                    if let move = value as? SensorMagnetic
                    {
                       
                        progressRing.value = CGFloat(move.getNbrObject())
                        print("progress ring" + String(move.getNbrObject()) + "son nom " + move.name )
                        if(move.getEtat() == true)
                        {
                       
                          //  shapeLayer.fillColor = UIColor.yellow.cgColor
                            setEtat(image : UIimagelowPerson!,str : "Etat : déplacement")
                           
                        }
                        else {
                            //shapeLayer.fillColor = UIColor.clear.cgColor
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
        
        
     
       /* shapeLayer.path = circlePath.cgPath
        
        // Change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        // You can change the stroke color
        shapeLayer.strokeColor = UIColor.systemBlue.cgColor
       // shapeLayer.backgroundColor = UIColor.red.cgColor
     
        // You can change the line width
        shapeLayer.lineWidth = 3.0
            
        view.layer.addSublayer(shapeLayer)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.autoreverses = false
        animation.repeatCount = .infinity
        shapeLayer.add(animation, forKey: "line")
        
        */
        
        nameSensorUI(str: nameSensor)
        batteryUI(battery: battery)
        if( typedata == SensorTypes.SensorMove)
        {
            logoUI(picture: "mouvement_blue")
        }
        
        if( typedata == SensorTypes.SensorMagnetic)
        {
            logoUI(picture: "porte_blue")
        }
       
        
        scanner = Scanner1()
        scanner.initializeScanner()
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        
        super.viewDidLoad()
        
        
        let line = UIView(frame: CGRect(x: 40, y: 150, width: 290, height: 3))
        line.backgroundColor =  UIColor(hexString: "#336699")
        self.view.addSubview(line)
        
        let lineBack = UIView(frame: CGRect(x: 40, y: 200, width: 290, height: 3))
        lineBack.backgroundColor = UIColor(hexString: "#336699")
        self.view.addSubview(lineBack)
        
        self.UInameseuil.text = "Etat : statique"
        self.UInameseuil.textColor = UIColor.black
        self.UInameseuil.font = UIFont.systemFont(ofSize: 25)
        self.UInameseuil.isUserInteractionEnabled = false
        self.UInameseuil.font = UIFont.boldSystemFont(ofSize: 25)
        self.UInameseuil.frame = CGRect(x: 110, y: 150, width: 350, height: 100)
        self.UInameseuil.backgroundColor = .none
        self.view.addSubview(UInameseuil)
        self.view.bringSubviewToFront(UInameseuil)

        // Do any additional setup after loading the view.
        
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                
                if let Move : [Capteur.Move] = cle.array as? [Capteur.Move]
                {
                    
                    
                    print(Move[array.count-1].getEtat() == false)
                    if(Move[array.count-1].getEtat() == true)
                    {
                        
                    //    shapeLayer.fillColor = UIColor.yellow.cgColor
                        
                        setEtat(image : UIimagelowPerson!,str : "Etat : déplacement")
                //        btnPerson.blink()
                    }
                    else {
                        
                    //    shapeLayer.fillColor = UIColor.clear.cgColor
                        setEtat(image : UIimagelowPersonStatic!,str : "Etat : statique")
                  //      btnPerson.stopBlink()
                        
                    }
                    
                }
            }
        }
        progressRing.minValue = 1
        progressRing.maxValue = 32000
     /*   for cle in displayObject {
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
 */
        progressRing.innerRingColor = UIColor.orange
        
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " step", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
        
        self.view.addSubview(progressRing)
    }
    
    func setEtat(image : UIImage,str : String)
    {
        btnPerson.setImage(image, for: .normal)
        UInameseuil.text = str
        
        btnPerson.frame = CGRect(x: 170, y: 250 ,width: 45, height: 45)
                
        
            self.view.addSubview(btnPerson)
    }
    
    func initializeInfoSensor(sensor : SensorTypes)
    {
        sensorT = sensor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

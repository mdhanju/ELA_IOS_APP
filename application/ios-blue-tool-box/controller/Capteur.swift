import UIKit
import CoreBluetooth
import SwiftUI


class Capteur:  UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private var scanner: Scanner1!
    private var display: [ DisplayObject] = []
    private var isStartButton : Bool = true
    private var sensorT : SensorTypes? = nil
    private var buttonStart : UIButton? = nil
    private var buttonStop : UIButton? = nil
    private var isStopButton = false
    
    public var dictionnarySensorSacond : Event<([String : Sensor])>? = nil

    public class Cap
    {
        
    }
    
    public class Move : Cap
    {
       private var nbrPas: Int = 0
       private var etat : Bool = false
        
      init(nbrPas : Int, etat : Bool) {
        self.nbrPas = nbrPas
        self.etat = etat
        }
      func getNbrPas()-> Int
      {
        return nbrPas
      }
      
      func getEtat()-> Bool
      {
        return etat
      }
    
    }
    
    
    public class Mag : Cap
    {
       private var nbrMagnet: Int = 0
       private var etat : Bool = false
        
      init(nbrMagnet : Int, etat : Bool) {
        self.nbrMagnet = nbrMagnet
        self.etat = etat
        }
        
        func getNbrMagnet()-> Int
        {
          return nbrMagnet
        }
        
        func getEtat()-> Bool
        {
          return etat
        }
    }
    
    public class Angle : Cap
    {
       private var x : Int = 0
       private  var y : Int = 0
       private var z : Int = 0
        
        init(x: Int,y:Int, z:Int) {
            self.x = x
            self.y = y
            self.z = z
        }
        func getX()-> Int
        {
          return x
        }
        
        func getY()-> Int
        {
          return y
        }
        func getZ()-> Int
        {
          return z
        }
        
    }
    
    
    public class TempHum : Cap
    {
        private var temp : Float
        private var hum : Int
        init(temp : Float,hum : Int) {
            self.hum = hum
            self.temp = temp
        }
        func getTemp()->Float
        {
            return temp
        }
        
        func getHum()->Int
        {
            return hum
        }
        
    }
    
    public class Temp : Cap
    {
        private var temp : Float
        init(temp : Float) {
            self.temp = temp
        }
        func getTemp()->Float
        {
            return temp
        }
    }
    
    
    class DisplayObject {
        
        public var name: String
        public var RSSI: Int
        public var identifier : String
        public var battery : Int
        public var typedata : SensorTypes
        public var array : [Cap]
        
        init(name : String, RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array : [Cap] = [Cap.init()])
        {
            self.name = name
            self.RSSI = RSSI
            self.identifier = identifier
            self.battery = battery
            self.typedata = typedata
            self.array = array
        }
        
   
        public func addData(data : Cap)
        {
            self.array.append(data)
            if(self.array.count > 20)
            {
                self.array.remove(at: 0)
            }
        }
    }
    
    
    
    func showToast(message: String, font: UIFont) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let maxWidthPercentage: CGFloat = 0.8
        let maxTitleSize = CGSize(width: view.bounds.size.width * maxWidthPercentage, height: view.bounds.size.height * maxWidthPercentage)
        var titleSize = toastLabel.sizeThatFits(maxTitleSize)
        titleSize.width += 20
        titleSize.height += 10
        toastLabel.frame = CGRect(x: view.frame.size.width / 2 - titleSize.width / 2, y: view.frame.size.height - 50, width: titleSize.width, height: titleSize.height)
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        let objectDiplay = display[indexPath.row]
        cell.textLabel?.text = objectDiplay.name
        cell.textLabel?.textAlignment = .left
        
        let label1 = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
        label1.text = String(objectDiplay.RSSI ) + " (dBm)"
        cell.accessoryView = label1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let string1 = display[indexPath.row].name
        let RSSI = display[indexPath.row].RSSI
        let identifier = display[indexPath.row].identifier
        let battery = display[indexPath.row].battery
        let typedata = display[indexPath.row].typedata
        let arr : [Cap] = display[indexPath.row].array
        
        
        // si c'est un capteur de temperature
        if(typedata == SensorTypes.SensorTemperature)
                   {
        
        self.navigationController?.pushViewController(targetTempViewController(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
         self.navigationController?.navigationBar.tintColor = .black
        }
        
        
        if(typedata == SensorTypes.SensorTemperatureHumidity)
                   {
        
        self.navigationController?.pushViewController(targetTempHumViewController(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
         self.navigationController?.navigationBar.tintColor = .black
        }
        
        
        if(typedata == SensorTypes.SensorMove)
                    {
         
         self.navigationController?.pushViewController(targetMoveViewController(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
          self.navigationController?.navigationBar.tintColor = .black
         }
        
        
        if(typedata == SensorTypes.SensorMagnetic)
                     {
          
          self.navigationController?.pushViewController(targetMagViewController(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
           self.navigationController?.navigationBar.tintColor = .black
          }
        
       if(typedata == SensorTypes.SensorAngle)
                     {
          
          self.navigationController?.pushViewController(targetAngleViewController(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
           self.navigationController?.navigationBar.tintColor = .black
          }
        
        if(typedata == SensorTypes.SensorID)
                      {
           
           self.navigationController?.pushViewController(targetAngleViewController(nameSensor: string1 ,RSSI: RSSI, identifier : identifier, battery : battery, typedata : typedata,array : arr,displayObject : display), animated: true)
            self.navigationController?.navigationBar.tintColor = .black
           }
        //
 
    }
    

    private let tableview : UITableView =
    {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableview.estimatedRowHeight = 0
        tableview.estimatedSectionHeaderHeight = 0
        tableview.estimatedSectionFooterHeight = 0
        tableview.rowHeight = 70
        tableview.frame.size.height = tableview.contentSize.height
        tableview.allowsMultipleSelection = false
        tableview.allowsMultipleSelectionDuringEditing = false
        tableview.allowsSelectionDuringEditing = false
        
        
        return tableview
        
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        
        let uiScrollView = UIScrollView()
        uiScrollView.frame = CGRect(x: 10 * UIScreen.main.bounds.width/100, y: 15 * UIScreen.main.bounds.width/100, width: 80 * UIScreen.main.bounds.width/100, height: 100 * UIScreen.main.bounds.height/100)
        uiScrollView.backgroundColor = .green
        self.view.addSubview(uiScrollView)
        
        scanner = Scanner1()
        scanner.initializeScanner()
        tableview.contentInset = UIEdgeInsets(top: 80,left: 0,bottom: 0,right: 0)
        //  tableview.backgroundColor = .green
        tableview.dataSource = self
        view.addSubview(tableview)
        
        let uiView = UIView()
        uiView.frame = CGRect(x: 0 * UIScreen.main.bounds.height/100, y: 6 * UIScreen.main.bounds.width/100, width: 100 * UIScreen.main.bounds.width/100, height:  17 * UIScreen.main.bounds.height/100)
        uiView.backgroundColor = .white
        self.view.addSubview(uiView)
        
        buttonStart = UIButton(frame: CGRect(x: 32 * UIScreen.main.bounds.width/100, y:  12 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        buttonStart!.setImage(UIImage(named: "start"), for: .normal)
        buttonStart!.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        
        view.addSubview(buttonStart!)
        
        let labelStart = UITextView(frame: CGRect(x: 33 * UIScreen.main.bounds.width/100, y: 17 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        labelStart.text = "start"
        labelStart.backgroundColor = .none
        labelStart.isUserInteractionEnabled = false
        view.addSubview(labelStart)
        
        buttonStop =  UIButton(frame: CGRect(x: 55 * UIScreen.main.bounds.width/100, y: 12 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        buttonStop!.setImage(UIImage(named: "stop"), for: .normal)
        buttonStop!.addTarget(self, action: #selector(self.buttonTappedStop), for: .touchUpInside)
        view.addSubview(buttonStop!)
        
        let labelStop = UITextView(frame: CGRect( x: 55 * UIScreen.main.bounds.width/100, y: 17 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        labelStop.text = "stop"
        labelStop.isUserInteractionEnabled = false
        labelStop.backgroundColor = .none
        view.addSubview(labelStop)
        
    }
    
    @objc func buttonTapped(sender : UIButton) {
        if (isStartButton == true)
        {
            buttonStart!.setImage(UIImage(named: "start_s"), for: .normal)
            scanner = Scanner1()
            scanner.initializeScanner()
            
            scanner.defineFilterType(sensor: sensorT!)
            scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
            print("El toro de Mardid")
            
            self.showToast(message: "Le scan a démarré", font: .systemFont(ofSize: 12.0))
            
            isStartButton = false
            isStopButton = false
            buttonStop!.setImage(UIImage(named: "stop"), for: .normal)
        }
        
    }
    
    @objc func buttonTappedStop(sender : UIButton) {
        isStopButton = true
        if( isStopButton == true)
        {
            buttonStop!.setImage(UIImage(named: "stop_s"), for: .normal)
        }
        
        buttonStart!.setImage(UIImage(named: "start"), for: .normal)
        scanner.stopScanner()
        
        print("El toro de Mardid")
        self.showToast(message: "Le scan est terminé", font: .systemFont(ofSize: 12.0))
        
        self.display.removeAll()
        tableview.reloadData()
        isStartButton = true
        
    }
    
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    func initializeInfoSensor(sensor : SensorTypes)
    {
        sensorT = sensor
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        updateSensorUI(data: data)
    }
    
    func updateSensorUI(data: ([String : Sensor])) -> DisplayObject {
        
        var trouve = true
        let objectTemp1 = Temp(temp: 0)
        
        var newobject : DisplayObject = DisplayObject(name: "null", RSSI: 0, identifier: "",battery : 0, typedata : SensorTypes.SensorID, array: [objectTemp1])
        
        for (key,value) in data
        {
            for cle in display
            {
                if(key == cle.identifier)
                {
                    cle.RSSI = value.RSSI
                    
                    
                    if(value is SensorTemperature)
                    {
                        if let temp = value as? SensorTemperature
                        {
                            let objectTemp = Temp(temp: temp.getTemp())
                          //  newobject = DisplayObject(name : cle.name, RSSI : cle.RSSI, identifier:  cle.identifier, battery: cle.battery, typedata : cle.typedata,array: [objectTemp] )
                            //  display.addData(data: objectTemp)
                            cle.addData(data: objectTemp)
                        }
                    }
                    
                  
                    
                    if(value is SensorTemperatureHumidity)
                    {
                        if let hum = value as? SensorTemperatureHumidity
                        {
                            let objectTempHum = TempHum(temp: hum.getTemp(), hum: hum.getHum())
 
                            cle.addData(data: objectTempHum)
                        }
                    }
                    
                    if(value is SensorMove)
                    {
                        if let move = value as? SensorMove
                        {
                            let objectMove =
                                Move(nbrPas: move.getNbrPas(), etat: move.getEtat())
    
                            cle.addData(data: objectMove)
                        }
                    }
                    
                    if(value is SensorMagnetic)
                    {
                        if let mag = value as? SensorMagnetic
                        {
                            let objectMove =
                                Mag(nbrMagnet: mag.getNbrObject(), etat: mag.getEtat())
              
                            cle.addData(data: objectMove)
                        }
                    }
                    
                    if(value is SensorAngle)
                    {
                        if let angle = value as? SensorAngle
                        {
                            let objectMove =
                                Angle(x: angle.getX(), y: angle.getY(), z: angle.getZ())
                            cle.addData(data: objectMove)
                        }
                    }
                    
           
                    
              
                    
                    
           trouve  = false
                }
            }
            if(trouve == true)
            {
                if(value is SensorID)
                {
                    
                  
                       
                        newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes )
                    
                }
            
                
                if(value is SensorTemperature)
                {
                    
                    if let temp = value as? SensorTemperature
                    {
                        let objectTemp = Temp(temp: temp.getTemp())
                        newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectTemp] )
                    }
                }
                
                if(value is SensorTemperatureHumidity)
                {
                    
                    if let tempHum = value as? SensorTemperatureHumidity
                    {
                        let objectTempHum = TempHum(temp: tempHum.getTemp(), hum: tempHum.getHum())
                        newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectTempHum] )
                    }
                }
                
                
                if(value is SensorMove)
                {
                    
                    if let move = value as? SensorMove
                    {
                          let objectMove =
                                                     Move(nbrPas: move.getNbrPas(), etat: move.getEtat())
                        newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectMove] )
                    }
                }
                
                
                if(value is SensorMagnetic)
                {
                    
                    if let mag = value as? SensorMagnetic
                    {
                          let objectMove =
                            Mag(nbrMagnet: mag.getNbrObject(), etat: mag.getEtat())
                        newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectMove] )
                    }
                }
                
                
                if(value is SensorAngle)
                {
                    
                    if let angle = value as? SensorAngle
                    {
                          let objectMove =
                            Angle(x: angle.getX(), y: angle.getY(), z: angle.getZ())
                        newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier: value.idenfitfier, battery: value.batterylevel, typedata : value.sensorTypes,array: [objectMove] )
                    }
                }
                
                
                
                display.append(newobject)
                
                
            }
            
            
            
            
            
            self.tableview.reloadData()
        }
        return newobject
    }
}


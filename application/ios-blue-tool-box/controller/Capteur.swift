import UIKit
import CoreBluetooth
import SwiftUI


class Capteur:  UIViewController, UITableViewDataSource{
    
    private var scanner: Scanner1!
    var display: [ DisplayObject] = []
    var isStartButton : Bool = true
   var sensorT : SensorTypes? = nil
    
    
    
    
   
   
    
    class DisplayObject {
        
        public var name: String
        public var RSSI: Int
        public var identifier : String
        public var displaytext : String
        
        init(name : String, RSSI: Int, identifier : String, displaytext : String)
        {
            self.name = name
            self.RSSI = RSSI
            self.identifier = identifier
            self.displaytext = displaytext
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
       
 // cell.textLabel?.text = String(objectDiplay.RSSI)
        cell.textLabel?.textAlignment = .left

    //    let _:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ChatCell")
        
        cell.textLabel?.text = objectDiplay.name
    //   cell.detailTextLabel?.text = "lll"
       let label = UILabel.init(frame: CGRect(x:0,y:0,width:100,height:20))
       label.text = String(objectDiplay.RSSI)
       cell.accessoryView = label
       
        return cell
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
        
        
        
        let imageView01 = UIScrollView()
          //    imageView0.text = "Blue Tool Box"
           //   imageView0.textColor = UIColor.red
           //   imageView0.font = UIFont.systemFont(ofSize: 25.0)
          //    imageView0.font = UIFont.boldSystemFont(ofSize: 25)
                  imageView01.frame = CGRect(x: 10 * UIScreen.main.bounds.width/100, y: 15 * UIScreen.main.bounds.width/100, width: 80 * UIScreen.main.bounds.width/100, height: 100 * UIScreen.main.bounds.height/100)
              imageView01.backgroundColor = .green
                self.view.addSubview(imageView01)
        
        scanner = Scanner1()
        scanner.initializeScanner()
        tableview.contentInset = UIEdgeInsets(top: 80,left: 0,bottom: 0,right: 0)
      //  tableview.backgroundColor = .green
        tableview.dataSource = self
        
        
        
       //https://stackoverflow.com/questions/33292427/how-to-make-the-scroll-of-a-tableview-inside-scrollview-behave-naturally
        
        //https://www.youtube.com/watch?v=INkeINPZddo
       // view.addSubview(imageView0)
        
        

        
        
        
        
        
        view.addSubview(tableview)
        
        

      
        
        
        
        let scrollView = UIView()
    //    imageView0.text = "Blue Tool Box"
     //   imageView0.textColor = UIColor.red
     //   imageView0.font = UIFont.systemFont(ofSize: 25.0)
    //    imageView0.font = UIFont.boldSystemFont(ofSize: 25)
           scrollView.frame = CGRect(x: 0 * UIScreen.main.bounds.height/100, y: 6 * UIScreen.main.bounds.width/100, width: 100 * UIScreen.main.bounds.width/100, height:  17 * UIScreen.main.bounds.height/100)
        scrollView.backgroundColor = .systemBlue
          self.view.addSubview(scrollView)
      

  
       /*  let img = "start"
          let image1 = UIImage(named: img)
          let imageView1 = UIImageView(image: image1!)
          imageView1.frame = CGRect(x: 50, y: 70, width: 45, height: 45)
          imageView1.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        self.view.addSubview(imageView1)
        */
        
        let button = UIButton(frame: CGRect(x: 32 * UIScreen.main.bounds.width/100, y:  12 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        button.setImage(UIImage(named: "start"), for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        
        view.addSubview(button)
        
        let button1 = UITextView(frame: CGRect(x: 33 * UIScreen.main.bounds.width/100, y: 17 * UIScreen.main.bounds.height/100, width: 40, height: 40))
    
        button1.text = "start"
        button1.backgroundColor = .none
            button1.isUserInteractionEnabled = false
        view.addSubview(button1)
        
        let buttonStop =  UIButton(frame: CGRect(x: 55 * UIScreen.main.bounds.width/100, y: 12 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
        buttonStop.setImage(UIImage(named: "stop"), for: .normal)
        buttonStop.addTarget(self, action: #selector(self.buttonTappedStop), for: .touchUpInside)
        view.addSubview(buttonStop)
        
           let button2 = UITextView(frame: CGRect( x: 55 * UIScreen.main.bounds.width/100, y: 17 * UIScreen.main.bounds.height/100, width: 40, height: 40))
        
            button2.text = "stop"
        button2.isUserInteractionEnabled = false
            button2.backgroundColor = .none
            view.addSubview(button2)
 
    }
    
    @objc func buttonTapped(sender : UIButton) {
        
        if (isStartButton == true)
        {
            scanner = Scanner1()
            scanner.initializeScanner()
            
            scanner.defineFilterType(sensor: sensorT!)
            scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
            print("El toro de Mardid")
            
            self.showToast(message: "Le scan a démarré", font: .systemFont(ofSize: 12.0))
            
            isStartButton = false
        }
    }
    
    @objc func buttonTappedStop(sender : UIButton) {
        
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
      //  let vartype = SensorTypes.SensorTemperature
//        handleNewObjectAvailable(
        sensorT = sensor
        
    scanner.defineFilterType(sensor: sensor)
    scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        

    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        
        updateSensorUI(data: data)
        
        
    }
    
    func updateSensorUI(data: ([String : Sensor])) -> DisplayObject {
    
        var trouve = true
        var newobject : DisplayObject = DisplayObject(name: "null", RSSI: 0, identifier: "", displaytext: "")
        
       // let vartype = SensorTypes.SensorTemperature
        for (key,value) in data
        {
         //   if(value is SensorTemperature)
            for var cle in display
            {
                if(key == cle.identifier)
                {
                    cle.RSSI = value.RSSI
                    cle = DisplayObject(name : cle.name, RSSI : cle.RSSI, identifier:  cle.identifier, displaytext: cle.name + " " + String(cle.RSSI))
                    trouve  = false
                }
            }
            if(trouve == true)
            {
                newobject = DisplayObject(name: value.name, RSSI: value.RSSI, identifier:  value.idenfitfier, displaytext: "")
                display.append(newobject)
            }
            self.tableview.reloadData()
        }
        return newobject
    }
}


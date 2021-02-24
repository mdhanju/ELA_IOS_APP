//
//  controllerCircularRingUI.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 22/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit

class controllerEtat: controllerUI {
    private let UIimagelowPerson = UIImage(named: "PersonRunning")
    private let UIimagelowPersonStatic = UIImage(named: "Person")
    private var UInameseuil = UITextView()
    private let btnPerson = UIButton()

    override func viewDidLoad() {
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
    }
    
    func setEtat(image : UIImage,str : String)
    {
        btnPerson.setImage(image, for: .normal)
        UInameseuil.text = str
        
        btnPerson.frame = CGRect(x: 180, y: 250 ,width: 45, height: 45)
                
        
            self.view.addSubview(btnPerson)
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

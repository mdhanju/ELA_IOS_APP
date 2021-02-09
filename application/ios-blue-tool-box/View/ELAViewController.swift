//
//  ELAViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import SideMenu
import UIKit



class ELAViewController: UIViewController, UINavigationControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    public var delegate: MenuControllerDelegate?
    
    
    @objc func imageTapID() {
        
        
        
        self.navigationController?.pushViewController(BlueIDViewController(), animated: true)
        view.layoutIfNeeded()
        
        
        // https://www.youtube.com/watch?v=gw3vWyNTkSg
        //https://www.youtube.com/watch?v=UVIQ7fkw_N8
    }
    
    
    @objc func imageTapTemp() {
        self.navigationController?.pushViewController(BlueTViewController(), animated: true)
        view.layoutIfNeeded()
    }
    
    @objc func imageTapRHT() {
        self.navigationController?.pushViewController(BlueRHTViewController(), animated: true)
        view.layoutIfNeeded()
    }
    
    
    @objc func imageTapMOV() {
        self.navigationController?.pushViewController(BlueMOVViewController(), animated: true)
        view.layoutIfNeeded()
    }
    
    @objc func imageTapMAG() {
        self.navigationController?.pushViewController(BlueMAGViewController(), animated: true)
        view.layoutIfNeeded()
    }
    
    
    
    @objc func imageTapANG() {
        self.navigationController?.pushViewController(BlueANGViewController(), animated: true)
        view.layoutIfNeeded()}
    
    @objc func imageTapApropos() { self.navigationController?.pushViewController(AproposViewController(), animated: true)
        view.layoutIfNeeded()
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back_main")!.scalePreservingAspectRatio(targetSize: CGSize(width: UIScreen.main.bounds.height, height:100 * UIScreen.main.bounds.height/100)))
        
        
        let imageView0 = UITextView()
        imageView0.text = "Blue Tool Box"
        imageView0.textColor = UIColor.red
        imageView0.font = UIFont.systemFont(ofSize: 25.0)
        imageView0.isUserInteractionEnabled = false
        imageView0.font = UIFont.boldSystemFont(ofSize: 25)
        imageView0.frame = CGRect(x: 80, y: 300, width: 350, height: 100)
        imageView0.backgroundColor = .none
        self.view.addSubview(imageView0)
        self.view.bringSubviewToFront(imageView0)
        
        
        let imageName = "log"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
        
        self.view.addSubview(imageView)
        
        self.view.bringSubviewToFront(imageView)
        
        let imageID = "blue"
        let UIimageID = UIImage(named: imageID)
        let imageViewID = UIImageView(image: UIimageID!)
        imageViewID.frame = CGRect(x: 50, y: 450, width: 45, height: 45)
        imageViewID.isUserInteractionEnabled = true
        let imageTapGestureRecognizerID = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapID))
        imageViewID.addGestureRecognizer(imageTapGestureRecognizerID)
        self.view.addSubview(imageViewID)
        
        
        
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 150, y: 450, width: 45, height: 45)
        imageViewTemp.isUserInteractionEnabled = true
        let imageTapGestureRecognizerTemp = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapTemp))
        imageViewTemp.addGestureRecognizer(imageTapGestureRecognizerTemp)
        self.view.addSubview(imageViewTemp)
        
        
        let imageRHT = "humidite_blue"
        let UIimageRHT = UIImage(named: imageRHT)
        let imageViewRHT = UIImageView(image: UIimageRHT!)
        imageViewRHT.frame = CGRect(x: 250, y: 450, width: 45, height: 45)
        self.view.addSubview(imageViewRHT)
        imageViewRHT.isUserInteractionEnabled = true
        let imageTapGestureRecognizerRHT = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapRHT))
        imageViewRHT.addGestureRecognizer(imageTapGestureRecognizerRHT)
        //Imageview on Top of View
        self.view.bringSubviewToFront(imageViewRHT)
        
        
        let imageMOV = "mouvement_blue"
        let UIimageMOV = UIImage(named: imageMOV)
        let imageViewMOV = UIImageView(image: UIimageMOV!)
        imageViewMOV.frame = CGRect(x: 50, y: 520, width: 45, height: 45)
        self.view.addSubview(imageViewMOV)
        imageViewMOV.isUserInteractionEnabled = true
        let imageTapGestureRecognizerMOV = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapMOV))
        imageViewMOV.addGestureRecognizer(imageTapGestureRecognizerMOV)
        self.view.bringSubviewToFront(imageViewMOV)
        
        
        
        let imageMAG = "porte_blue"
        let UIimageMAG = UIImage(named: imageMAG)
        let imageViewMAG = UIImageView(image: UIimageMAG!)
        imageViewMAG.frame = CGRect(x: 150, y: 520, width: 45, height: 45)
        self.view.addSubview(imageViewMAG)
        imageViewMAG.isUserInteractionEnabled = true
        let imageTapGestureRecognizerMAG = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapMAG))
        imageViewMAG.addGestureRecognizer(imageTapGestureRecognizerMAG)
        self.view.bringSubviewToFront(imageViewMAG)
        
        
        let imageANG = "angle"
        let UIimageANG = UIImage(named: imageANG)
        let imageViewANG = UIImageView(image: UIimageANG!)
        imageViewANG.frame = CGRect(x: 250, y: 520, width: 45, height: 45)
        self.view.addSubview(imageViewANG)
        imageViewANG.isUserInteractionEnabled = true
        let imageTapGestureRecognizerANG = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapANG))
        imageViewANG.addGestureRecognizer(imageTapGestureRecognizerANG)
        self.view.bringSubviewToFront(imageViewANG)
        
        
        
        
        
        let UIimageApropos = UITextView()
        UIimageApropos.text = "A propos"
        UIimageApropos.textColor = UIColor.white
        UIimageApropos.font = UIFont.systemFont(ofSize: 3.0)
        UIimageApropos.isUserInteractionEnabled = false
        UIimageApropos.font = UIFont.boldSystemFont(ofSize: 15)
        UIimageApropos.frame = CGRect(x: 135, y: 600, width: 300, height: 45)
        UIimageApropos.backgroundColor = .none
        UIimageApropos.isUserInteractionEnabled = true
        let imageTapGestureRecognizerApropos = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapApropos))
        UIimageApropos.addGestureRecognizer(imageTapGestureRecognizerApropos)
        self.view.addSubview( UIimageApropos)
        
    }
    
    
}

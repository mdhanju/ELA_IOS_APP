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

        UImenuImage(namePicture: "blue", size_x: 50, size_y: 450, size_width: 45, size_height: 45, selector: #selector(ELAViewController.imageTapID))
        UImenuImage(namePicture: "temp", size_x: 150, size_y: 450, size_width: 45, size_height: 45, selector: #selector(ELAViewController.imageTapTemp))
        UImenuImage(namePicture: "humidite_blue", size_x: 250, size_y: 450, size_width: 45, size_height: 45, selector: #selector(ELAViewController.imageTapRHT))
        UImenuImage(namePicture: "mouvement_blue", size_x: 50, size_y: 520, size_width: 45, size_height: 45, selector: #selector(ELAViewController.imageTapMOV))
        UImenuImage(namePicture: "porte_blue", size_x: 150, size_y: 520, size_width: 45, size_height: 45, selector: #selector(ELAViewController.imageTapMAG))
        UImenuImage(namePicture: "angle", size_x: 250, size_y: 520, size_width: 45, size_height: 45, selector: #selector(ELAViewController.imageTapANG))
        
        
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
    
    /// The picture on the menu for change page
    /// - Parameters:
    ///   - namePicture: name of the picture
    ///   - size_x: position in x
    ///   - size_y: position in y
    ///   - size_width: width of the picture
    ///   - size_height: height of the picture
    ///   - selector: function selector
    func UImenuImage(namePicture : String,size_x : Int,size_y :Int,size_width : Int,size_height : Int, selector : Selector?)
    {
        let imageID = namePicture
        let UIimageID = UIImage(named: imageID)
        let imageViewID = UIImageView(image: UIimageID!)
        imageViewID.frame = CGRect(x: size_x, y: size_y, width: size_width, height: size_height)
        self.view.addSubview(imageViewID)
        imageViewID.isUserInteractionEnabled = true
        let imageTapGestureRecognizerID = UITapGestureRecognizer(target: self, action: selector)
        imageViewID.addGestureRecognizer(imageTapGestureRecognizerID)
        //self.view.addSubview(imageViewID)
        self.view.bringSubviewToFront(imageViewID)
    }
    
}

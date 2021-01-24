//
//  BlueIDViewController.swift
//
//
//  Created by ELA Innovation on 14/01/2021.
//

import UIKit





class BlueIDViewController: UIViewController {

    private let progressView: UIProgressView =
    {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .systemBlue
        return progressView
    }()
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(progressView)
        progressView.frame = CGRect(x: 10, y: 100, width: view.frame.width-20, height: 20)
        progressView.setProgress(0.5, animated: true)
        
        
        
        
       
    }
}

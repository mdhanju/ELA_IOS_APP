import SideMenu
import UIKit

class ViewController:UIViewController,MenuControllerDelegate
{

    private var sideMenu: SideMenuNavigationController?
    private let ELAController = ELAViewController()
    private let blueIDController = BlueIDViewController()
    private let blueTController = BlueTViewController()
    private let blueRHTController = BlueRHTViewController()
    private let blueMOVController = BlueMOVViewController()
    private let blueMAGController = BlueMAGViewController()
    private let blueANGController = BlueANGViewController()
    private let debugController = DebugViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = MenuController(with: SideMenuItem.allCases)
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        menu.delegate = self
        sideMenu?.leftSide = true;
        
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.rightMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        addChildControllers()
    }
    
    public func addChildControllers() {
        addChild(ELAController)
        addChild(blueIDController)
        addChild(blueTController)
        addChild(blueRHTController)
        addChild(blueMOVController)
        addChild(blueMAGController)
        addChild(blueANGController)
        addChild(debugController)
        
        view.addSubview(ELAController.view)
        view.addSubview(blueIDController.view)
        view.addSubview(blueTController.view)
        view.addSubview(blueRHTController.view)
        view.addSubview(blueMOVController.view)
        view.addSubview(blueMAGController.view)
        view.addSubview(blueANGController.view)
        view.addSubview(debugController.view)
        
        ELAController.view.frame = view.bounds
        blueIDController.view.frame = view.bounds
        blueTController.view.frame = view.bounds
        blueRHTController.view.frame = view.bounds
        blueMOVController.view.frame = view.bounds
        blueMAGController.view.frame = view.bounds
        blueANGController.view.frame = view.bounds
        debugController.view.frame = view.bounds
        
        ELAController.didMove(toParent: self)
        blueIDController.didMove(toParent: self)
        blueTController.didMove(toParent: self)
        blueRHTController.didMove(toParent: self)
        blueMOVController.didMove(toParent: self)
        blueMAGController.didMove(toParent: self)
        blueANGController.didMove(toParent: self)
        debugController.didMove(toParent: self)
        
        blueIDController.view.isHidden = true
        blueTController.view.isHidden = true
        blueRHTController.view.isHidden = true
        blueMOVController.view.isHidden = true
        blueMAGController.view.isHidden = true
        blueANGController.view.isHidden = true
        debugController.view.isHidden = true
        
    }
    
    @IBAction func Menu(_ sender: Any) {
        present(sideMenu!,animated: true)
    }
    
    
    func didSelectMenuItem(named: SideMenuItem) {
    sideMenu?.dismiss(animated: true, completion: nil)
        
        title = named.rawValue

        switch named
        {
        case.ELA:
            blueIDController.view.isHidden = true
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = true
            debugController.view.isHidden = true
            ELAController.view.isHidden = false 
            
        case.blueID:
            blueIDController.view.isHidden = false
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = true
            debugController.view.isHidden = true
            ELAController.view.isHidden = true
        case.blueT:
            blueIDController.view.isHidden = true
            blueTController.view.isHidden = false
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = true
            debugController.view.isHidden = true
            ELAController.view.isHidden = true
            
        case .blueRHT:
            blueIDController.view.isHidden = true
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = false
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = true
            debugController.view.isHidden = true
            ELAController.view.isHidden = true
        case .blueMOV:
            blueIDController.view.isHidden = true
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = false
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = true
            debugController.view.isHidden = true
            ELAController.view.isHidden = true
        case .blueMAG:
            blueIDController.view.isHidden = true
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = false
            blueANGController.view.isHidden = true
            debugController.view.isHidden = true
            ELAController.view.isHidden = true
        case .blueANG:
            blueIDController.view.isHidden = true
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = false
            debugController.view.isHidden = true
            ELAController.view.isHidden = true
        case .debug:
            blueTController.view.isHidden = true
            blueRHTController.view.isHidden = true
            blueMOVController.view.isHidden = true
            blueMAGController.view.isHidden = true
            blueANGController.view.isHidden = true
            debugController.view.isHidden = false
            ELAController.view.isHidden = true
        }
        
    }
    
}












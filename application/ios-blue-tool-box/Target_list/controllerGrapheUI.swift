import UIKit



class controllerGrapheUI: controllerUI {
    
    
    
    
    
    var UItext = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let line = UIView(frame: CGRect(x: 40, y: 150, width: 290, height: 3))
        line.backgroundColor =  UIColor(hexString: "#336699")
        self.view.addSubview(line)
        
        let lineBack = UIView(frame: CGRect(x: 40, y: 200, width: 290, height: 3))
        lineBack.backgroundColor = UIColor(hexString: "#336699")
        self.view.addSubview(lineBack)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    func textUI(size : Int)
    {
        UItext.text = ""
        UItext.textColor = UIColor.black
        UItext.font = UIFont.systemFont(ofSize: 25.0)
        UItext.isUserInteractionEnabled = false
        UItext.font = UIFont.boldSystemFont(ofSize: 25)
        UItext.frame = CGRect(x: size, y: 150, width: 350, height: 100)
        UItext.backgroundColor = .none
        self.view.addSubview(UItext)
        self.view.bringSubviewToFront(UItext)
    }
    
    
    
    func valueUI(donnees : String)
    {
        UItext.text = donnees
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

//
//  userdetailsViewController.swift
//  machintest19Jan
//
//  Created by STC on 19/01/24.
//

import UIKit

class userdetailsViewController: UIViewController {
    
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longlabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var streetLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var lat1: String?
    var long1:String?
    
    var city1: String?
    var street1: String?
    var number1: String?
    var email1: String?

    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        latLabel.text = lat1
        longlabel.text = long1
        cityLabel.text = city1
        streetLabel.text = street1
        numberLabel.text = number1
        emailLabel.text = email1

        
        
        
        
        
        
        
        
        
        
        
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

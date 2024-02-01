//
//  ViewController.swift
//  machintest19Jan
//
//  Created by STC on 19/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var userTableView: UITableView!
    //MARK - User Array .
    var UserArray = [UserApiResponce]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //MARK - Delegate And DetaSource Table View
        userTableView.delegate = self
        userTableView.dataSource = self
        //Mark - Register Nib For TableView
        regnib()
        
        
        //Api calling
        apiuserfetch {
            self.userTableView.reloadData()
        }
    }
    //Mark - Register Nib For TableView func
    func regnib(){
        let nibname1 = UINib(nibName: "userTableViewCell", bundle: nil)
        self.userTableView.register(nibname1, forCellReuseIdentifier: "userTableViewCell")
    }
    //Api calling Func ..
    func apiuserfetch(completed : @escaping() ->()){
        let apiUrl = "https://fakestoreapi.com/users"
        guard let url = URL(string: apiUrl) else {
            print("data not found")
            return
        }
        URLSession.shared.dataTask(with: url){ data ,  responce, error in
            if(error == nil)
            {
                do{
                    
                    let jsondecoder = JSONDecoder()
            //Mark - decoding responce..
                    let json = try! jsondecoder.decode([UserApiResponce].self, from: data!)
                    //MArk - store data in array
                    self.UserArray = json

                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    completed()
                }
            }
            
        }.resume()
    }
}

//Extension
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = userTableView.dequeueReusableCell(withIdentifier: "userTableViewCell", for: indexPath)as! userTableViewCell
        userCell.firstName.text = UserArray[indexPath.row].name.firstname
        userCell.lastnameLAbel.text = UserArray[indexPath.row].name.lastname
        userCell.usernameLabel.text = UserArray[indexPath.row].username
        return userCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier:"userdetailsViewController")as! userdetailsViewController
        nav.lat1  = UserArray[indexPath.row].address.geolocation.lat
        nav.long1  = UserArray[indexPath.row].address.geolocation.long
        nav.city1 = UserArray[indexPath.row].address.city
        nav.street1 = UserArray[indexPath.row].address.street
        nav.number1 = String(UserArray[indexPath.row].address.number)
        nav.email1 = UserArray[indexPath.row].email

        navigationController?.pushViewController(nav, animated: true)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

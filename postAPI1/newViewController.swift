//
//  newViewController.swift
//  postAPI1
//
//  Created by Jenith on 29/11/22.
//

import UIKit

class newViewController: UIViewController {
    
    @IBOutlet weak var usernameTF: UILabel!
    @IBOutlet weak var passwordTF: UILabel!
    var getdata = NSMutableData ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTF(_ sender: Any) {
        let urll = URL(string:"http://iroidtechnologies.in/Fressery/Fressery_Api/login")
        var req = URLRequest(url:urll!)
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        req.httpMethod="post"
        let poststring="username=\(usernameTF.text!)&password=\(passwordTF.text!)"

        print("poststring >>",poststring)
        req.httpBody=poststring.data(using: .utf8)
        let task=URLSession.shared.dataTask(with: req){(data,response,error)in
            let mydata = data
            do{
                print("mydata__>>",mydata! )
                do{

                    self.getdata.append(mydata!)
                    let jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: [])
                    print("jsondata__>>",jsondata)
                    
                 
                }
            }
            catch{
                print("error",error.localizedDescription)
            }
            
        }
    
        task.resume()
        
        
    }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



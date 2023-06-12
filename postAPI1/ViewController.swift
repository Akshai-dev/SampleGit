//
//  ViewController.swift
//  postAPI1
//
//  Created by Jenith on 29/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameL: UITextField!
    @IBOutlet weak var emailL: UITextField!
    @IBOutlet weak var mobileL: UITextField!
    @IBOutlet weak var passwordL: UITextField!
    var getdata = NSMutableData ()
    
    @IBAction func registerB(_ sender: Any) {
        let url1 = URL(string:"http://iroidtechnologies.in/Fressery/Fressery_Api/register")
        var req = URLRequest(url:url1!)
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content_type")
        req.httpMethod="post"
        let poststring = "name=\(nameL.text!)&email=\(emailL.text!)&mobile=\(mobileL.text!)&password=\(passwordL.text!)"
        print("poststring__>>",poststring)
        req.httpBody=poststring.data(using: .utf8)
        let task=URLSession.shared.dataTask(with: req){(data,response,error)in
            let mydata = data
            do{
                print("mydata__>>",mydata)
                do{
                    self.getdata.append(mydata!)
                    let jsondata = try JSONSerialization.jsonObject(with: self.getdata as Data, options: [])
                    print("jsondata__>>",jsondata)
                    
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let newView = storyboard.instantiateViewController(withIdentifier: "second")as! newViewController; self.navigationController?.pushViewController(newView, animated: true)
                    }
                    
                }
            }
            catch{
                print("error",error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    
    @IBAction func loginB(_ sender: Any) {
        let storyboard1 = UIStoryboard(name: "Main", bundle: nil)
                let newView = storyboard1.instantiateViewController(withIdentifier: "second")as! newViewController; self.navigationController?.pushViewController(newView, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }




}

//
//  ViewController.swift
//  WebAPI_POST
//
//  Created by KoKang Chu on 2019/7/12.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet weak var item_text: UITextField!
    @IBOutlet weak var id_text: UITextField!
    @IBOutlet weak var item_text: UITextField!
    @IBOutlet weak var price_text: UITextField!
    @IBOutlet weak var amount_text: UITextField!
    @IBOutlet weak var shipping_text: UITextField!
    @IBOutlet weak var purchase_date: UITextField!
    @IBOutlet weak var location_text: UITextField!
    @IBOutlet weak var payment_text: UITextField!
    @IBOutlet weak var Btn_SEND: UIButton!
    @IBOutlet weak var memo_text: UITextView!
    //@IBOutlet weak var item_text: UITextField!
    //@IBOutlet weak var price_text: UITextField!
    //@IBOutlet weak var location_text: UITextField!
    //@IBOutlet weak var payment_text: UITextField!
    //@IBOutlet weak var Btn_SEND: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func BtnSend(_ sender: Any) {
        //defining parameters
        //let url = URL(string: "http://www.apple.com")
        //let url = URL(string: "http://127.0.0.1/insert_database1_table1.php");
        //let url = URL(string: "http://192.168.100.2/insert_database1_table1.php");
        //let url = URL(string: "http://192.168.100.4/insert_database1_purchase_list.php");
        let url = URL(string: "http://220.136.62.137/insert_database1_purchase_list.php");
        //let url = URL(string: "http://localhost/insert_database1_purchase_list.php");
        
        let id1:String = id_text.text!;
        let item1:String = item_text.text!;
        let price1:Int16 = Int16(price_text.text!)!;
        let amount1:Int16 = Int16(amount_text.text!)!;
        let shipping1:Int16 = Int16(shipping_text.text!)!;
        let purchase_date1:String = "2021-06-20";
        let location1:String = location_text.text!;
        let payment1:String = payment_text.text!;
        let memo1:String = memo_text.text!;
        //let memo1:String =
        
        
        //Uses APIs
        var request = URLRequest(
            url: url!,
            cachePolicy:.reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 30);
        
        //request.httpBody = "x=5&y=3".data(using: .utf8)
        request.httpBody = "id=\(id1)&item=\(item1)&price=\(price1)&shipping=\(shipping1)&location=\(location1)&payment=\(payment1)&amount=\(amount1)&shipping=\(shipping1)&today=\(purchase_date1)&memo=\(memo1)".data(using: .utf8);
        request.httpMethod = "POST";
        
        let session = URLSession(configuration: .default);
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let html = String(data: data, encoding: .utf8)
                print(html!)
                print("success on connection");
            }
            else {
                print("failed on connection");
            }
        }
        
        dataTask.resume()
    }
    
    #if false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0) {
            self.view.endEditing(true)
        }
    }
    #else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    #endif

}


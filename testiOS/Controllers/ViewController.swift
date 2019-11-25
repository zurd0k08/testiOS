//
//  ViewController.swift
//  testiOS
//
//  Created by Jose Pablo Perez Estrada on 11/25/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var page = 1
    var datos : modelData = modelData()
    var total = 0
    @IBOutlet weak var tbar: UINavigationBar!
    @IBOutlet weak var totalR: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datos.hits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsTableViewCell
        
        cell.tittle.text = datos.hits[indexPath.row].title
        cell.date.text = datos.hits[indexPath.row].created_at
        //create model and query
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       getData(page: page)
      
        
    }
    
    
    
    func getData(page : Int){
      
        let params : Parameters = ["tags":"story","page":page]
        Alamofire.request("https://hn.algolia.com/api/v1/search_by_date",method : .get, parameters:params).responseObject{(response:DataResponse<modelData>) in
            if let result = response.result.value{
                self.datos = result
                print (result)
                self.tableView.reloadData()
                
                 self.totalR.text = "Total post " + String(self.datos.hits.count)
            }
            else{
                print ("Error")
            }
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        page = page + 1
        getData(page: page)
    }
    
    
}


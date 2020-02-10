//
//  ViewController.swift
//  COBSCCOMP182p-003-Wikipedia
//
//  Created by user161121 on 2/9/20.
//  Copyright © 2020 surainfdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate{

    @IBOutlet weak var searchBox: UISearchBar!
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
     var filteredData: [String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tempFunc1()
        searchBox.delegate = self
        filteredData = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tempfunctionbtn(_ sender: Any) {
      //  let k=filteredData.count
        print("----------------------------------------------------------")
       for name in filteredData
       {print(name)}
    }
    
    func apiCallfunction(_ searchContent:String)
    {
        print("Log !1111")
        let tempclass=NetworkClient()
        tempclass.execute(searchContent)
    }
    func searchBar(_ searchBox: UISearchBar,
                   textDidChange searchText: String)
    {
        apiCallfunction(searchText)
    }
   
    func searchBoxTextDidBeginEditing(searchBox: UISearchBar) {
        
    }
    
}


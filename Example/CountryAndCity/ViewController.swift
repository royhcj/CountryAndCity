//
//  ViewController.swift
//  CountryAndCity
//
//  Created by boyroyh@gmail.com on 10/12/2018.
//  Copyright (c) 2018 boyroyh@gmail.com. All rights reserved.
//

import UIKit
import CountryAndCity

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    
    
  }
  @IBAction func clickedLoadJSONData(_ sender: Any) {
    if let url = Bundle.main.url(forResource: "countryCity_en", withExtension: "txt"),
      let data = try? Data.init(contentsOf: url) {
      
      if CountryAndCity.shared.load(jsonData: data) {
        print(CountryAndCity.shared)
      }
    }
  }
  
}



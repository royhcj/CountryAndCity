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
    CountryCity.languageCode = "zh-Hant"
    CountryCity.shared.fetchCountries { countries in
      print(countries.count)
      
      CountryCity.shared.fetchCities(for: "CHE", completion: { cities in
        print("Cities in CHE: \(cities.count)")
      })
    }
  }
}



//
//  ViewController.swift
//  CountryAndCity
//
//  Created by boyroyh@gmail.com on 10/12/2018.
//  Copyright (c) 2018 boyroyh@gmail.com. All rights reserved.
//

import UIKit
import CountryAndCity

class ViewController: UIViewController, LocalizationDelegate {
  
  func localizedURL(for file: String, extension fileExtension: String, bundle: Bundle) -> URL? {
    guard let subBundleName = bundle.infoDictionary?["CFBundleExecutable"] as? String,
          let subBundleURL = Bundle.main.resourceURL?.appendingPathComponent(
                                "Frameworks/\(subBundleName).framework"),
          let subBundle = Bundle(url: subBundleURL)
    else { return nil }
    return subBundle.url(forResource: file, withExtension: fileExtension)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  @IBAction func clickedLoadJSONData(_ sender: Any) {
    //CountryAndCity.shared.localizationDelegate = self
    
    CountryAndCity.shared.fetchCountries { countries in
      print(countries.count)
      
      CountryAndCity.shared.fetchCities(for: "CHE", completion: { cities in
        print("Cities in CHE: \(cities.count)")
      })
    }
  }
}



//
//  CountryAndCity.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/15.
//

import Foundation

public class CountryAndCity {
  
  public static var shared: CountryAndCity = {
    let cc = CountryAndCity()
    
    let bundle = Bundle(for: CountryAndCity.self)
    let url = bundle.url(forResource: "countryCity_en", withExtension: "txt")
    if let url = url,
       let data = try? Data(contentsOf: url) {
      
      cc.load(jsonData: data)
    }
    return cc
  }()
  
  // Members
  public var countries: [Country] = []
  
  // Load Methods
  @discardableResult
  public func load(jsonData data: Data) -> Bool {
    do {
      let decoder = JSONDecoder()
      let world = try decoder.decode(World.self, from: data)
      countries = world.location.countries
    } catch (let error) {
      print(error)
      return false
    }
    return true
  }
  
}

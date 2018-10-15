//
//  CountryAndCity.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/15.
//

import Foundation

public class CountryAndCity {
  
  public static var shared = CountryAndCity()
  
  // Members
  public var countries: [Country] = []
  
  // Load Methods
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

//
//  World.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/12.
//

import Foundation

public struct World: Decodable {
  var location: Location
  
  enum CodingKeys: String, CodingKey {
    case location = "Location"
  }
}

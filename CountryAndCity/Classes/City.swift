//
//  City.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/12.
//

import Foundation

public struct City: Decodable {
  public var name: String
  public var code: String
  
  enum CodingKeys: String, CodingKey {
    case name = "Name"
    case code = "Code"
  }
  
}

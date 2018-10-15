//
//  CountryList.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/15.
//

import Foundation

public struct Location: Decodable {
  public var countries: [Country]
  
  enum CodingKeys: String, CodingKey {
    case countries = "CountryRegion"
  }
}

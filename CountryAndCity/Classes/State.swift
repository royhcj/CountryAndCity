//
//  State.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/12.
//

import Foundation

public struct State: Decodable {
  public var cities: [City]?

  enum CodingKeys: String, CodingKey {
    case cities = "City"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let cities = try? container.decode([City].self, forKey: .cities) {
      self.cities = cities
    } else if let city = try? container.decode(City.self, forKey: .cities) {
      self.cities = [city]
    }
  }
}

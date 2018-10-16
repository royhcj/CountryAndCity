//
//  CountryCity.swift
//  CountryCity
//
//  Created by Roy Hu on 2018/10/15.
//

import Foundation

public class CountryCity {
  
  public static var shared = CountryCity()
  
  // Fetch Functions
  public func fetchCountries(completion: @escaping ([Country]) -> Void) {
    if let countries = self.countries {
      completion(countries)
    } else {
      loadDefaultData {
        if let countries = self.countries {
          completion(countries)
        }
      }
    }
  }
  
  public func fetchCities(for countryCode: String,
                   completion: @escaping ([City]) -> Void) {
    fetchCountries { countries in
      guard let country = countries.first(where: {
        $0.code == countryCode
      }) else { completion([])
        return
      }
      
      let cities = country.states?.flatMap({ state in
        state.cities ?? []
      })
      completion(cities ?? [])
    }
  }
  
  // Members
  private var countries: [Country]?
  
  // Load Methods
  public func loadDefaultData(asyncCompletion: (() -> Void)?) {
    let bundle = Bundle(for: CountryCity.self)
    let url = bundle.url(forResource: "countryCity",
                         withExtension: "json")
    if let url = url,
       let data = try? Data(contentsOf: url) {
      load(jsonData: data, asyncCompletion: asyncCompletion)
    }
  }
  
  public func load(jsonData data: Data,
                   asyncCompletion: (() -> Void)?) {
    DispatchQueue.global(qos: .default).async {
      self.load(jsonData: data)
      DispatchQueue.main.async {
        asyncCompletion?()
      }
    }
  }
  
  private func load(jsonData data: Data) {
    do {
      let decoder = JSONDecoder()
      let world = try decoder.decode(World.self, from: data)
      countries = world.location.countries
    } catch (let error) {
      print(error)
    }
  }
  
}

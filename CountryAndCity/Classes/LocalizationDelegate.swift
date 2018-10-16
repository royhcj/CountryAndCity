//
//  LocalizationDelegate.swift
//  CountryAndCity
//
//  Created by Roy Hu on 2018/10/12.
//

import Foundation

public protocol LocalizationDelegate: class {
  func localizedURL(for file: String, extension: String, bundle: Bundle) -> URL?
}

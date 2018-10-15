import Foundation

public struct Country: Decodable {
  
  public var name: String
  public var code: String
  
  public var states: [State]?
  
  enum CodingKeys: String, CodingKey {
    case name = "Name"
    case code = "Code"
    case states = "State"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let states = try? container.decode([State].self, forKey: .states) {
      self.states = states
    } else if let state = try? container.decode(State.self, forKey: .states) {
      self.states = [state]
    }
    
    name = try container.decode(String.self, forKey: .name)
    code = try container.decode(String.self, forKey: .code)
  }
}


import Foundation

public struct iiRandom {
  public static var randomBetween0And1: Double {
    return Double(arc4random()) / Double(UINT32_MAX)
  }

  public static func random<T>(array: [T]) -> T? {
    if array.isEmpty { return nil }
    let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
    return array[randomIndex]
  }
}
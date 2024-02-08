import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///This extenstion used to remap the float value
extension CGFloat {
  func Remap(from1: CGFloat, to1: CGFloat, from2: CGFloat, to2: CGFloat) -> CGFloat {
    return (self - from1) / (to1 - from1) * (to2 - from2) + from2
  }
}

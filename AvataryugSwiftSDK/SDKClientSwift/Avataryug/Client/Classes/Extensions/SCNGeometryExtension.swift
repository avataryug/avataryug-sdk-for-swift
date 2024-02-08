import Foundation
import SceneKit
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///This extenstion used for geometry
extension SCNGeometry {

  func GetVertices() -> [SCNVector3]? {
    let sources = self.sources(for: .vertex)
    guard let source = sources.first else { return nil }
    let stride = source.dataStride / source.bytesPerComponent
    let offset = source.dataOffset / source.bytesPerComponent
    let vectorCount = source.vectorCount
    return source.data.withUnsafeBytes { (buffer: UnsafePointer<Float>) -> [SCNVector3] in
      var result = [SCNVector3]()
      for i in 0...vectorCount - 1 {
        let start = i * stride + offset
        let x = buffer[start]
        let y = buffer[start + 1]
        let z = buffer[start + 2]
        result.append(SCNVector3(x, y, z))
      }
      return result
    }
  }
}

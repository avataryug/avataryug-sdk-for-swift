import CommonCrypto
import Foundation

//This class Handles Decrypt downloaded model data
class ModelDecryptionHandler {
  static let shared = ModelDecryptionHandler()

  init() {}

  // Method to take data iput and secrect and iv key input
  func GetModelData(data: Data, completionHandler: @escaping (Data) -> Void) {
    do {
      let keys = Data(stringToByteKey(ProjectSettings.shared.secretKey))
      let ivs = Data(stringToByteKey(ProjectSettings.shared.secretIv))

      do {
        let decryptedData = try aesDecrypt(data: data, key: keys, iv: ivs)
        completionHandler(decryptedData)
      } catch {
          if(ProjectSettings.shared.isDebug)
          {
              print("Error: \(error)")
          }
      }
    }
  }

  // This methos convert string key to Data format
  func stringToByteKey(_ key: String) -> [UInt8] {
    var byteArray = [UInt8]()
    for i in stride(from: 0, to: key.count, by: 2) {
      let startIndex = key.index(key.startIndex, offsetBy: i)
      let endIndex = key.index(startIndex, offsetBy: 2, limitedBy: key.endIndex) ?? key.endIndex
      let byteString = String(key[startIndex..<endIndex])
      if let byte = UInt8(byteString, radix: 16) {
        byteArray.append(byte)
      }
    }
    return byteArray
  }

  // This method take data input and decrypt model data and return it
  func aesDecrypt(data: Data, key: Data, iv: Data) throws -> Data {
    let bufferSize = data.count + kCCBlockSizeAES128
    var buffer = [UInt8](repeating: 0, count: bufferSize)
    var numBytesDecrypted = 0

    let cryptStatus = key.withUnsafeBytes { keyBytes in
      iv.withUnsafeBytes { ivBytes in
        data.withUnsafeBytes { dataBytes in
          CCCrypt(
            CCOperation(kCCDecrypt),
            CCAlgorithm(kCCAlgorithmAES),
            CCOptions(kCCOptionPKCS7Padding),
            keyBytes.baseAddress, key.count,
            ivBytes.baseAddress,
            dataBytes.baseAddress, data.count,
            &buffer, bufferSize,
            &numBytesDecrypted
          )
        }
      }
    }

    guard cryptStatus == kCCSuccess else {
      throw CryptoError.decryptFailed(cryptStatus)
    }

    let decryptedData = Data(bytes: buffer, count: numBytesDecrypted)
    return decryptedData
  }

  enum CryptoError: Error {
    case decryptFailed(CCStatus)
  }
}

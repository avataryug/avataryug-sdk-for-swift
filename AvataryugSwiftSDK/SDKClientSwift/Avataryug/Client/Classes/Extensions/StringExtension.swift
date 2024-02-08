import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
///This extenstion used to String Encode
extension Encodable {
    var stringified: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

///This extenstion used to String Decode
extension Decodable {
    static func from(jsonString: String) -> Self? {
        guard let data = jsonString.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        do {
            let instance = try decoder.decode(Self.self, from: data)
            return instance
        } catch {
            if(ProjectSettings.shared.isDebug)
            {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
            return nil
        }
    }
}

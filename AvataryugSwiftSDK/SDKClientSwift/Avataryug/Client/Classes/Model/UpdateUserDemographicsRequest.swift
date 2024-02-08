import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UpdateUserDemographicsRequest: Codable, JSONEncodable, Hashable {

    public enum Gender: Int, Codable, CaseIterable {
        case _1 = 1
        case _2 = 2
    }
    public enum AgeRange: String, Codable, CaseIterable {
        case _1824 = "18-24"
        case _2534 = "25-34"
        case _3544 = "35-44"
        case _4554 = "45-54"
        case _5564 = "55-64"
        case _65Plus = "65+"
    }
    public enum Race: String, Codable, CaseIterable {
        case european = "European"
        case asian = "Asian"
        case indian = "Indian"
        case african = "African"
        case nativeAmerican = "Native American"
        case pacificIslander = "Pacific Islander"
        case custom = "Custom"
    }
    /** Gender of the user. Male = 1, Female = 2 */
    public var gender: String?
    /** Age Range of the user. */
    public var ageRange: String?
    /** Race of the user. */
    public var race: String?

    public init(gender: String? , ageRange: String? , race: String?) {
        self.gender = gender
        self.ageRange = ageRange
        self.race = race
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case gender = "Gender"
        case ageRange = "AgeRange"
        case race = "Race"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(ageRange, forKey: .ageRange)
        try container.encodeIfPresent(race, forKey: .race)
    }
}


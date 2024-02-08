import Foundation

struct Configs :Codable
{
    ///Get or Set isNormalUpload
    var isNormalUpload: Int = 0
    
    ///Get or Set isOpacityUpload
    var isOpacityUpload: Int = 0
    
    ///Get or Set isMetallicUpload
    var isMetallicUpload: Int = 0
    
    ///Get or Set isEmissionUpload
    var isEmissionUpload: Int = 0
    
    ///Get or Set isRoughnessUpload
    var isRoughnessUpload: Int = 0
    
    ///Get or Set isZipUpload
    var isZipUpload: Int = 0
    
    ///Get or Set isTwoD
    var isTwoD: Int = 0
    
    ///Get or Set isTransparent
    var isTransparent: Int = 0
    
    ///Get or Set isGrid
    var isGrid: Int = 0
    
    ///Get or Set isDiffuse
    var isDiffuse: Int = 0
    
    public init(isNormalUpload: Int, isOpacityUpload: Int, isMetallicUpload: Int, isEmissionUpload: Int, isRoughnessUpload: Int, isZipUpload: Int, isTwoD: Int, isTransparent: Int, isGrid: Int, isDiffuse: Int) {
        self.isNormalUpload = isNormalUpload
        self.isOpacityUpload = isOpacityUpload
        self.isMetallicUpload = isMetallicUpload
        self.isEmissionUpload = isEmissionUpload
        self.isRoughnessUpload = isRoughnessUpload
        self.isZipUpload = isZipUpload
        self.isTwoD = isTwoD
        self.isTransparent = isTransparent
        self.isGrid = isGrid
        self.isDiffuse = isDiffuse
    }
    
    public enum CodingKeys: String,CodingKey,CaseIterable {
        case isNormalUpload = "isNormalUpload"
        case isOpacityUpload = "isOpacityUpload"
        case isMetallicUpload = "isMetallicUpload"
        case isEmissionUpload = "isEmissionUpload"
        case isRoughnessUpload = "isRoughnessUpload"
        case isZipUpload = "isZipUpload"
        case isTwoD = "isTwoD"
        case isTransparent = "isTransparent"
        case isGrid = "isGrid"
        case isDiffuse = "isDiffuse"
    }
    
    ///Encodable protocols methods
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.isNormalUpload, forKey: .isNormalUpload)
        try container.encode(self.isOpacityUpload, forKey: .isOpacityUpload)
        try container.encode(self.isMetallicUpload, forKey: .isMetallicUpload)
        try container.encode(self.isEmissionUpload, forKey: .isEmissionUpload)
        try container.encode(self.isRoughnessUpload, forKey: .isRoughnessUpload)
        try container.encode(self.isZipUpload, forKey: .isZipUpload)
        try container.encode(self.isTwoD, forKey: .isTwoD)
        try container.encode(self.isTransparent, forKey: .isTransparent)
        try container.encode(self.isGrid, forKey: .isGrid)
        try container.encode(self.isDiffuse, forKey: .isDiffuse)
    }
}

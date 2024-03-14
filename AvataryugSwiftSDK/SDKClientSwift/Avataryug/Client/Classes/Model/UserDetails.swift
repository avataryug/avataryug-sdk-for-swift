import Foundation

struct UserDetails
{
    /// Gets or Sets userID
    public var userID:String
    
    /// Gets or Sets AccessToken
    public var AccessToken:String
    
    /// Gets or Sets DisplayName
    public var DisplayName:String
    
    /// Gets or Sets CreatedAt
    public var CreatedAt:String
    
    /// Gets or Sets emailId
    public var emailId:String
    
    /// Gets or Sets currentDevice
    public var currentDevice:Platforms
    
    /// Gets or Sets Genders
    public var Genders : Gender

    
    /// Gets or Sets linkedAccounts
    public var linkedAccounts: [LinkedAccounts] = []
    
    /// Gets or Sets wallets
    public var wallets : [Wallet] = []
    
    /// Gets or Sets currentUserSelectedAvatar
    public var currentUserSelectedAvatar : UserAllAvatar
    
    /// Gets or Sets avatarID
    public var avatarID: String
    
    /// Gets or Sets allavatar
    public var allavatar: [UserAllAvatar]
    
    /// Gets or Sets defaultavatarid
    public var defaultavatarid:String = ""
    
    public init(userID:String, AccessToken:String, DisplayName:String, CreatedAt:String, emailId:String , currentDevice:Platforms,
                Genders : Gender, linkedAccounts: [LinkedAccounts] = [], wallets : [Wallet] = [], UserAvatarThumb:String,
                UserAvatarMeshUrl:String, currentUserSelectedAvatar : UserAllAvatar, avatarID: String , avatarUrl: String,
                thumbUrl: String, allavatar: [UserAllAvatar] ,  defaultavatarid:String) {

        self.userID =  userID
        self.AccessToken =  AccessToken
        self.DisplayName =  DisplayName
        self.CreatedAt =  CreatedAt
        self.emailId =  emailId
        self.currentDevice =  currentDevice
        self.Genders  =  Genders
        self.linkedAccounts =  linkedAccounts
        self.wallets  =  wallets
        self.currentUserSelectedAvatar  =  currentUserSelectedAvatar
        self.avatarID =  avatarID
        self.allavatar =  allavatar
        self.defaultavatarid =  defaultavatarid
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userID = "userID"
        case AccessToken = "AccessToken"
        case DisplayName = "DisplayName"
        case CreatedAt = "CreatedAt"
        case emailId = "emailId"
        case Genders = "Genders"
        case linkedAccounts = "linkedAccounts"
        case wallets = "wallets"
        case currentUserSelectedAvatar = "currentUserSelectedAvatar"
        case avatarID = "avatarID"
        case avatarUrl = "avatarUrl"
        case thumbUrl = "thumbUrl"
        case allavatar = "allavatar"
        case defaultavatarid = "defaultavatarid"
        case currentDevice = "currentDevice"
    }

    // Encodable protocol methods

//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(userID, forKey: .userID)
//        try container.encode(AccessToken, forKey: .AccessToken)
//        try container.encode(DisplayName, forKey: .DisplayName)
//        try container.encode(CreatedAt, forKey: .CreatedAt)
//        try container.encode(Genders, forKey: .Genders)
//        try container.encode(linkedAccounts, forKey: .linkedAccounts)
//        try container.encode(wallets, forKey: .wallets)
//        try container.encode(currentUserSelectedAvatar, forKey: .currentUserSelectedAvatar)
//        try container.encode(avatarID, forKey: .avatarID)
//        try container.encode(allavatar, forKey: .allavatar)
//        try container.encode(defaultavatarid, forKey: .defaultavatarid)
//        try container.encode(currentDevice.rawValue ?? 0, forKey: .currentDevice)
//    }
}

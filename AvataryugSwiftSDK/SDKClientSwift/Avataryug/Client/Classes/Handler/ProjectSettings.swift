import Foundation
///Warning: Please refrain from modifying or editing these classes as it may potentially result in breaking the SDK functionality.
/// The "ProjectSettings" class is designed to retrieve project settings from the "AvatarProjectSettings.plist" file and provide a convenient interface to access these settings whenever needed throughout the app.
class ProjectSettings {
  static let shared = ProjectSettings()
  private init() {}

  var projectid: String = GetProjectID()
  var secretKey: String = GetSecretKey()
  var secretIv: String = GetIVSecretKey()
  var isDebug: Bool = GetIsDebug()
  var Platfrom: Platforms = Platforms.iOS

  ///Load Project Settings from plist file AvatarProjectSettings.plist as string
  static func LoadProjectSettingsStringFromPlist() -> [String: Any]? {
    if let plistPath = Bundle.main.path(forResource: "AvatarProjectSettings", ofType: "plist"),
      let settingsDict = NSDictionary(contentsOfFile: plistPath) as? [String: Any]
    {
      return settingsDict
    }
    return nil
  }

  ///Load Project Settings from plist file AvatarProjectSettings.plist as bool
  static func LoadProjectSettigngsBoolFromPlist() -> [String: Bool]? {
    if let plistPath = Bundle.main.path(forResource: "AvatarProjectSettings", ofType: "plist"),
      let settingsDict = NSDictionary(contentsOfFile: plistPath) as? [String: Bool]
    {
      return settingsDict
    }
    return nil
  }

  ///Load Project Settings from plist file AvatarProjectSettings.plist as int
  static func LoadProjectSettigngsIntFromPlist() -> [String: Int]? {
    if let plistPath = Bundle.main.path(forResource: "AvatarProjectSettings", ofType: "plist"),
      let settingsDict = NSDictionary(contentsOfFile: plistPath) as? [String: Int]
    {
      return settingsDict
    }
    return nil
  }

  ///Get Value from AvatarProjectSettings Plist
  static func GetProjectID() -> String {
    var localValue = ""
    if let settingsDict = ProjectSettings.LoadProjectSettingsStringFromPlist() {
      localValue = settingsDict["ProjectID"] as? String ?? ""
      return localValue.lowercased()
    }
    return localValue
  }

  ///Get Value from AvatarProjectSettings Plist
  static func GetSecretKey() -> String {
    var localValue = ""
    if let settingsDict = ProjectSettings.LoadProjectSettingsStringFromPlist() {
      localValue = settingsDict["SecretKey"] as? String ?? ""
      return localValue
    }
    return localValue
  }

  ///Get Value from AvatarProjectSettings Plist
  static func GetIVSecretKey() -> String {
    var localValue = ""
    if let settingsDict = ProjectSettings.LoadProjectSettingsStringFromPlist() {
      localValue = settingsDict["IVSecretKey"] as? String ?? ""
      return localValue
    }
    return localValue
  }

  ///Get Value from AvatarProjectSettings Plist
  static func GetIsDebug() -> Bool {
    var localValue = false
    if let settingsDict = ProjectSettings.LoadProjectSettigngsBoolFromPlist() {
      localValue = settingsDict["isDebug"] ?? false
      return localValue
    }
    return localValue
  }
}

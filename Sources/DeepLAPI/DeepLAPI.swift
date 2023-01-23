//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import Foundation
import WebClient
import URLStringBuilder

/// API Client for DeepL (Free) API.
public struct DeepLAPI {
    
    private init() {}  // prevent instantiation
    
    private static let authKey = loadAuthKey()
    private static let authorizationKeyValue = [
        "Authorization" : "DeepL-Auth-Key \(authKey)"
    ]
    private struct API {
        private static let host = "https://api-free.deepl.com/v2"
        static let translate = "\(host)/translate"
        static let usage     = "\(host)/usage"
        static let languages = "\(host)/languages"
    }
    
    /// Requests translation.
    /// - Parameters:
    ///   - list: list of text to be translated.
    ///   - sourceLang: Language of the text to be translated. (default: Auto Detection).
    ///   - targetLang: The language into which the text should be translated.
    /// - Returns: response of the API.
    /// - Attention: The total request body size must not exceed 128 KiB (128 · 1024 bytes).
    /// - Note: https://www.deepl.com/docs-api/translate-text/
    public static func translate(_ list: [String],
                                 from sourceLang: SourceLang = .auto,
                                 to   targetLang: TargetLang) async throws -> TranslateResponse {
        let urlString = URLStringBuilder(baseURL: API.translate)
            .appendIf(sourceLang != .auto, key: "source_lang", value: sourceLang.rawValue)
            .append(key: "target_lang", value: targetLang.rawValue)
            .append(key: "text", values: list, with: .urlEncoding)
            .build()
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = authorizationKeyValue
        
        return try await WebClient.fetch(TranslateResponse.self, for: request)
    }
    
    /// Retrieves usage information.
    /// - Returns: response of the API.
    /// - Note: https://www.deepl.com/docs-api/general/get-usage/
    public static func getUsage() async throws -> UsageResponse {
        var request = URLRequest(url: URL(string: API.usage)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = authorizationKeyValue
        
        return try await WebClient.fetch(UsageResponse.self, for: request)
    }
    
    /// Sets whether source or target languages should be listed.
    private enum LanguagesType: String {
        /// For languages that can be used in the source_lang parameter of translate requests.
        case source
        /// For languages that can be used in the target_lang parameter of translate requests.
        case target
    }
    
    /// Retrieves Supported Languages (Source)
    /// - Returns: response of the API.
    /// - Note: https://www.deepl.com/docs-api/general/get-languages/
    public static func getSourceLanguages() async throws -> [LanguagesResponse] {
        try await getLanguages(of: .source)
    }
    
    /// Retrieve Supported Languages (Target)
    /// - Returns: response of the API.
    /// - Note: https://www.deepl.com/docs-api/general/get-languages/
    public static func getTargetLanguages() async throws -> [LanguagesResponse] {
        try await getLanguages(of: .target)
    }
    
    /// Retrieves Supported Languages.
    /// - Parameters:
    ///   - type: Sets whether source or target languages should be listed.
    /// - Returns: response of the API.
    /// - Note: https://www.deepl.com/docs-api/general/get-languages/
    private static func getLanguages(of type: LanguagesType) async throws -> [LanguagesResponse] {
        let urlString = URLStringBuilder(baseURL: API.languages)
            .append(key: "type", value: type.rawValue)
            .build()
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = authorizationKeyValue
        
        return try await WebClient.fetch([LanguagesResponse].self, for: request)
    }
    
    /// Loads a value for "DeepL-Auth-Key" from DeepL-API.plist.
    /// DeepL-API.plistから"DeepL-Auth-Key"の値を取得する。
    private static func loadAuthKey() -> String {
        guard
            let url  = configurationURL,
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization
                .propertyList(from: data, format: nil) as? [String : Any],
            let value = dict["DeepL-Auth-Key"] as? String
        else {
            fatalError("Error on loading DeepL-API.plist")
        }
        return value
    }

    /// Returns the URL of a configuration file.
    private static let configurationURL: URL? =
        findConfigurationInMainBundle() ?? findConfigurationInModuleBundle()
    
    /// Finds a configuration file in the Main Bundle.
    private static func findConfigurationInMainBundle() -> URL? {
        Bundle.main.url(forResource: "DeepL-API", withExtension: "plist")
    }

    /// Finds a configuration file in the Module Bundle.
    private static func findConfigurationInModuleBundle() -> URL? {
        if let bundle  = altBundleModule,
           let fileURL = bundle.url(forResource: "DeepL-API", withExtension: "plist") {
            return fileURL
        }
        return nil
    }

    /// Returns Bundle.module by alternative method.
    static var altBundleModule: Bundle? {
        class BundleFinder {}
        let bundle = Bundle(for: BundleFinder.self)
        if let subBundleURL = bundle.url(forResource: "", withExtension: "bundle") {
           return Bundle(url: subBundleURL)
        }
        return nil
    }
}

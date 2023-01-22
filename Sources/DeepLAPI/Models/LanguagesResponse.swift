//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import Foundation

/// Represents a supported language.
public struct LanguagesResponse: Codable {
    /// The language code of the given language.
    public var language: String
    /// Name of the language in English.
    public var name: String
    /// Denotes formality support in case of a target language listing.
    public var supportsFormality: Bool {
        _supportsFormality ?? false
    }
    var _supportsFormality: Bool?
    
    enum CodingKeys: String, CodingKey {
        case language
        case name
        case _supportsFormality = "supportsFormality"
    }
}

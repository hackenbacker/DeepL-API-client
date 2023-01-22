//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import Foundation

/// The account's usage and limits.
public struct UsageResponse: Codable {
    /// Characters translated so far in the current billing period.
    public var characterCount: Int
    /// Current maximum number of characters that can be translated per billing period.
    public var characterLimit: Int
    
    // only includes document translations, and is measured in individual documents.
    /// Documents translated so far in the current billing period.
    public var documentCount: Int {
        _documentCount ?? 0
    }
    var _documentCount: Int?
    /// Current maximum number of documents that can be translated per billing period.
    public var documentLimit: Int {
        _documentLimit ?? 0
    }
    var _documentLimit: Int?

    // for team accounts only
    /// Documents translated by all users in the team so far in the current billing period.
    public var teamDocumentCount: Int {
        _teamDocumentCount ?? 0
    }
    var _teamDocumentCount: Int?
    /// Current maximum number of documents that can be translated by the team per billing period.
    public var teamDocumentLimit: Int {
        _teamDocumentLimit ?? 0
    }
    var _teamDocumentLimit: Int?

    enum CodingKeys: String, CodingKey {
        case characterCount
        case characterLimit
        case _documentCount = "documentCount"
        case _documentLimit = "documentLimit"
        case _teamDocumentCount = "teamDocumentCount"
        case _teamDocumentLimit = "teamDocumentLimit"
    }
}

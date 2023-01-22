//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import Foundation

/// Represents translated texts.
public struct TranslateResponse: Codable {
    public var translations: [Translation]

    public struct Translation: Codable {
        /// The language detected in the source text.
        public var detectedSourceLanguage: String
        /// The translated text.
        public var text: String
    }
}

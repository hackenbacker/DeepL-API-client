//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import Foundation

/// Sets whether the translated text should lean towards formal or informal language.
public enum Formality: String {
    /// default formality.
    case `default`
    /// for a more formal language.
    case more
    /// for a more informal language.
    case less
    /// for a more formal language if available, otherwise fallback to default formality.
    case prefer_more
    /// for a more informal language if available, otherwise fallback to default formality.
    case prefer_less
}

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
// Copyright (c) 2023 Hackenbacker.
//
// This software is released under the MIT License.
// http://opensource.org/licenses/mit-license.php
//
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

import Foundation

/// Language of the text to be translated.
public enum SourceLang: String, CaseIterable {
    /// Auto Detection
    case auto = ""
    /// English  英語
    case EN
    /// Chinese (simplified)  中国語 (簡体字)
    case ZH
    /// Japanese  日本語
    case JA
    /// Spanish  スペイン語
    case ES
    /// French  フランス語
    case FR
    /// German  ドイツ語
    case DE
    /// Russian  ロシア語
    case RU
    /// Portuguese  ポルトガル語
    case PT
    /// Italian  イタリア語
    case IT
    /// Korean  韓国語
    case KO
    /// Turkish  トルコ語
    case TR
    /// Dutch  オランダ語
    case NL
    /// Swedish  スウェーデン語
    case SV
    /// Danish  デンマーク語
    case DA
    /// Norwegian (Bokmål) ノルウェー語  (ブークモール)
    case NB
    /// Polish  ポーランド語
    case PL
    /// Finnish  フィンランド語
    case FI
    /// Indonesian  インドネシア語
    case ID
    /// Greek  ギリシャ語
    case EL
    /// Romanian  ルーマニア語
    case RO
    /// Hungarian  ハンガリー語
    case HU
    /// Czech  チェコ語
    case CS
    /// Slovak  スロバキア語
    case SK
    /// Ukrainian  ウクライナ語
    case UK
    /// Bulgarian  ブルガリア語
    case BG

    /// Estonian  エストニア語
    case ET
    /// Lithuanian  リトアニア語
    case LT
    /// Latvian  ラトビア語
    case LV
    /// Slovenian  スロベニア語
    case SL
}

extension SourceLang: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto: return "Auto Detection"
        case .BG: return "Bulgarian"
        case .CS: return "Czech"
        case .DA: return "Danish"
        case .DE: return "German"
        case .EL: return "Greek"
        case .EN: return "English"
        case .ES: return "Spanish"
        case .ET: return "Estonian"
        case .FI: return "Finnish"
        case .FR: return "French"
        case .HU: return "Hungarian"
        case .ID: return "Indonesian"
        case .IT: return "Italian"
        case .JA: return "Japanese"
        case .KO: return "Korean"
        case .LT: return "Lithuanian"
        case .LV: return "Latvian"
        case .NB: return "Norwegian (Bokmål)"
        case .NL: return "Dutch"
        case .PL: return "Polish"
        case .PT: return "Portuguese"
        case .RO: return "Romanian"
        case .RU: return "Russian"
        case .SK: return "Slovak"
        case .SL: return "Slovenian"
        case .SV: return "Swedish"
        case .TR: return "Turkish"
        case .UK: return "Ukrainian"
        case .ZH: return "Chinese (simplified)"
        }
    }
}

extension SourceLang: Identifiable {
    public var id: Self {
        self
    }
}

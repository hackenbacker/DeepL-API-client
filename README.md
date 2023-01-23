# <img src="https://static.deepl.com/img/logo/DeepL_Logo_darkBlue_v2.svg" width=28> DeepL-API-client

<table bgcolor=#fff><tr><td><img style="vertical-align:middle" src="https://www.deepl.com/img/press/logo_DeepL.png" width=256></td><td><span style="vertical-align:middle; font-size:24pt;color:#0F2B46">Translator</span></td></tr><table>

[![Swift](https://img.shields.io/badge/Swift-5.7-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.7-Orange?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2015.0%20or%20lator-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS%2015.0%20or%20lator-yellowgreen?style=flat-square)


DeepL API client library for iOS

---
## Initial Setup
1. You have to get a authentication key from [here](https://www.deepl.com/pro-api).<br>
2. Make a following file as **DeepL-API.plist**.
```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>DeepL-Auth-Key</key>
	<string>YOUR AUTHENTICATION KEY</string>
</dict>
</plist>
```
3. Add *DeepL-API.plist* to your project. (Put it into the main bundle.)

## Usage

### Requests translation
```Swift
import DeepLAPI

// texts to be translated.
let list: [String] = [
    "What are those?",
    "Those are two cows.",
    "You have two cows.",
    "You have to give one to your neighbor."
]

// translate the list to Japanese using auto-detection.
let response = try await DeepLAPI.translate(list, to: .JA)

// translate the list from English to Japanese
let response = try await DeepLAPI.translate(list, from: .EN, to: .JA)

// print translated texts.
for translation in response.transrations {
    print(translation.text)
}
// "あれは何？"
// "2頭の牛だ"
// "2頭いるでしょ？"
// "1頭はお隣さんにあげなきゃね。"
```
[API document](https://www.deepl.com/docs-api/translate-text/)
<br>
<br>


### Retrieves usage information
```Swift
import DeepLAPI

let usage = try await DeepLAPI.getUsage()

print(usage.characterCount) // Characters translated
print(usage.characterLimit) // Current maximum number of characters

print(usage.documentCount)  // Documents translated
print(usage.documentLimit)  // Current maximum number of documents

// for team accounts only
print(usage.teamDocumentCount  // Documents translated by all users in the team
print(usage.teamDocumentLimit) // Current maximum number of documents
```
[API document](https://www.deepl.com/docs-api/general/get-usage/)
<br>
<br>


### Retrieves Supported Languages (Source)
```Swift
import DeepLAPI

let languages = try await getSourceLanguages()

for language in languages {
    print("\(language.name) [\(language.language)]) // "Japanese [JA]"
}
```
[API document](https://www.deepl.com/docs-api/general/get-languages/)
<br>
<br>

### Retrieves Supported Languages (Target)

```Swift
import DeepLAPI

let languages = try await getTargetLanguages()

for language in languages {
    let support = language.supportsFormality ? "(Support Formality)" : ""
    print("\(language.name) [\(language.language)] \(support)")
    // "German [DE] (Support Formality)"
}
```
[API document](https://www.deepl.com/docs-api/general/get-languages/)
<br>
<br>

## Requirements
* Xcode 14.2 or later
* iOS 15.0 or later

## Dependencies
* [WebClient](https://github.com/hackenbacker/WebClient)<br>
Web Client to get data from an API endpoint.
* [URLStringBuilder](https://github.com/hackenbacker/URLStringBuilder)<br>
Utility to simplify making a URL String with parameters.
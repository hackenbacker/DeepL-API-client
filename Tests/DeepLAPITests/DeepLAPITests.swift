import XCTest
@testable import DeepLAPI

final class DeepLAPITests: XCTestCase {

    /// Tests to translate.
    /// translate()のテスト.
    func testTranslate() async throws {
        do {
            let list: [String] = [
                "English",
                "Japanese"
            ]
            
            let result = try await DeepLAPI.translate(list, from: .EN,to: .JA)
            XCTAssertEqual(result.translations.count, list.count)
            for translation in result.translations {
                XCTAssertFalse(translation.detectedSourceLanguage.isEmpty, "detected source language is empty.")
                XCTAssertFalse(translation.text.isEmpty, "text is empty.")
            }
        } catch {
            print(error)
            XCTFail("Unexpected exception occurred.")
        }
    }
    
    /// Tests to retrieve usage information.
    /// getUsage()のテスト.
    func testGetUsage() async throws {
        do {
            let usage = try await DeepLAPI.getUsage()
            XCTAssertGreaterThanOrEqual(usage.characterCount, 0)
            XCTAssertGreaterThanOrEqual(usage.characterLimit, 0)
            XCTAssertGreaterThanOrEqual(usage.documentCount, 0)
            XCTAssertGreaterThanOrEqual(usage.documentLimit, 0)
            XCTAssertEqual(usage.teamDocumentCount, 0)
            XCTAssertEqual(usage.teamDocumentLimit, 0)
        } catch {
            print(error)
            XCTFail("Unexpected exception occurred.")
        }
    }
    
    /// Tests to get source languages.
    /// getSourceLanguages()のテスト.
    func testGetSourceLanguages() async throws {
        do {
            let languages = try await DeepLAPI.getSourceLanguages()
            XCTAssertFalse(languages.isEmpty, "no source languages.")
            for language in languages {
                XCTAssertFalse(language.language.isEmpty)
                XCTAssertFalse(language.name.isEmpty)
                XCTAssertFalse(language.supportsFormality)
            }
        } catch {
            print(error)
            XCTFail("Unexpected exception occurred.")
        }
    }

    /// Tests to get target languages.
    /// getTargetLanguages()のテスト.
    func testGetTargetLanguages() async throws {
        do {
            let languages = try await DeepLAPI.getTargetLanguages()
            XCTAssertFalse(languages.isEmpty, "no target languages.")
            for language in languages {
                XCTAssertFalse(language.language.isEmpty)
                XCTAssertFalse(language.name.isEmpty)
            }
        } catch {
            print(error)
            XCTFail("Unexpected exception occurred.")
        }
    }

    /// Tests enum SourceLang.
    /// enum SourceLangのテスト.
    func testSourceLang() async throws {
        for source in SourceLang.allCases {
            XCTAssertFalse(source.description.isEmpty)
            XCTAssertEqual(source.id, source)
        }
    }

    /// Tests enum TargetLang.
    /// enum TargetLangのテスト.
    func testTargetLang() async throws {
        for target in TargetLang.allCases {
            XCTAssertFalse(target.description.isEmpty)
            XCTAssertEqual(target.id, target)
        }
    }
}

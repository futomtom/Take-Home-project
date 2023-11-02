import Danger
import Foundation

func getFirstMatch(from string: String, forRegexPattern pattern: String) -> String? {
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
        let stringRange = NSRange(location: 0, length: string.utf16.count)
        return regex.matches(in: string, range: stringRange).reduce(into: [String]()) {
            guard let range = Range($1.range, in: string) else {
                return
            }
            $0.append(String(string[range]))
        }.first
    } catch {
        return nil
    }
}

extension String {
    func getBracketsContent() -> String {
        String(self[String.Index(utf16Offset: 1, in: self) ..< String.Index(utf16Offset: count - 1, in: self)])
    }
}

let danger = Danger()

let prTitle = danger.github.pullRequest.title
let compareBranch = danger.github.pullRequest.head.ref
let createdFiles = danger.git.createdFiles
let modifiedFiles = danger.git.modifiedFiles
let editedFiles = modifiedFiles + createdFiles
let deletedFiles = danger.git.deletedFiles
let additions = danger.github.pullRequest.additions!
let deletions = danger.github.pullRequest.deletions!
let changedFiles = danger.github.pullRequest.changedFiles!
let jiraTicketRegexPattern = #"^\[\w{2,4}-\d{1,6}\]"#
let keywordRegexPattern = #"^\[\w{2,}\]"#
let titleFormat = "`[LEGO-000] Your feature title`"
let bigPRThreshold = 1000
let acceptedKeywords: Set<String> = ["release", "hotfix", "enhancement"]

// MARK: - Checking PR Threeshold

if additions + deletions > bigPRThreshold {
    warn("PR size seems relatively large. ✂️ If this PR contains multiple changes, please split each into separate PR will helps faster, easier review.")
}

// MARK: - Checking Additions and Deletions

if deletions > additions {
    message("👍 Great work! It seems you have removed more code than you added.")
}

// MARK: - Pull Request Body Validaiton

if danger.github.pullRequest.body == nil || danger.github.pullRequest.body!.isEmpty {
    warn("PR has no description. 📝 You should provide a description of the changes that have made.")
}

// MARK: - Pull Request Title Validation

if prTitle.count < 5 {
    warn("PR title is too short. 🙏 Please use this format \(titleFormat) and replace `000` with Jira task number.")
}

// MARK: - Checking Localizable files

if editedFiles.contains(where: { $0.contains("Localizable") && $0.fileType == nil }) {
    message("🌐 This PR requires or modifies localization files.")
}

// MARK: - Checking Unit Tests

let testFiles = editedFiles.filter { ($0.contains("Tests") || $0.contains("Test")) && ($0.fileType == .swift || $0.fileType == .m) }
if testFiles.isEmpty {
    warn("PR does not contain any files related to unit tests ✅ (ignore if your changes do not require tests)")
}

// MARK: - Checking Copyright files

let swiftFilesWithCopyright = createdFiles.filter {
    $0.fileType == .swift && danger.utils.readFile($0).contains("//  Created by")
}

if !swiftFilesWithCopyright.isEmpty {
    let files = swiftFilesWithCopyright.joined(separator: ", ")
    warn("In this project we don't include copyright headers, found them in: \(files)")
}

// MARK: - Checking Deleted Files

let swiftDeletedFiles = deletedFiles.filter { $0.fileType == .swift }

if !swiftDeletedFiles.isEmpty {
    warn("This PR deletes the following swift files: \(swiftDeletedFiles.joined(separator: ", ")). Are you sure?")
}

// MARK: - Final Message

message("🎉 The PR added \(additions) and removed \(deletions) lines. 🗂 \(changedFiles) files changed.")

// swift 6 오류 있음

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum ResponsError: Error {
    case requestFailed
    case unexpectedResponseStructure
}

//func fetchRepos(forUsername username: String) async throws {
func fetchRepos(forUsername username: String,
                completionHandler: @escaping ([[String: Any]]?, ResponsError?) -> Void) async {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
//    request.setValue("SwiftPlayground", forHTTPHeaderField: "User-Agent")
    
    do {
        // 비동기 실행 이전
        let (data, _) = try await URLSession.shared.data(for: request)
        // 비동기 실행 이후
        let deserialized = try JSONSerialization.jsonObject(with: data, options: [])
//        print(deserialized)
        
        guard let repos = deserialized as? [[String: Any]] else {
                    completionHandler(nil, .unexpectedResponseStructure)
                    return
                }
        completionHandler(repos, nil)
    } catch {
        print(error)
        completionHandler(nil, .requestFailed)
    }
}
Task {
//    try await fetchRepos(forUsername: "apple")
    await fetchRepos(forUsername: "apple") { repos, error in
            if let error {
                print("Error: \(error)")
                return
            }
            print("Repos: \(repos!.count)")
        }
}
//resume() 는 GCD 쓰는 함수에서 쓰는 메서드구용
//Task { } 는 async/await 전용 실행블록이에용

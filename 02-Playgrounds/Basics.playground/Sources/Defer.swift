//
//  Defer.swift
//  
//
//  Created by Sean on 1/2/25.
//

// Defer
enum VideoGameReviewClass {
    case bad
    case average
    case good
    case brilliant
}
enum ClassificationState {
    case initial
    case classifying
    case complete
}
class VideoGameReviewClassifier {
    var state: ClassificationState = .initial
    func classify(forStarsOutOf10 stars: Int) async -> VideoGameReviewClass {
        state = .classifying
        print("1")
        defer {
            print("3")
            state = .complete
        }
        // 오래 걸리는 작업
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        print("2")
        if stars > 8 {
            return .brilliant // 9 또는 10
        } else if stars > 6 {
            return .good // 7 또는 8
        } else if stars > 3 {
            return .average // 4, 5 또는 6
        } else {
            return .bad // 1, 2 또는 3
        }
    }
}
let classifier = VideoGameReviewClassifier()
let review1 = await classifier.classify(forStarsOutOf10: 9)
print(review1) // brilliant

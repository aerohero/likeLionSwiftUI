import Foundation

func normalizedStarRating(forRating rating: Float, ofPossibleTotal total: Float) -> (Int, String) {
    let fraction = rating / total
    let ratingOutOf5 = fraction * 5
    let roundedRating = round(ratingOutOf5) // 반올림해서 상수에 넣어라.
    let numberOfStars = Int(roundedRating)
    let ratingString = "\(numberOfStars) Star Movie"
    return (numberOfStars, ratingString)
}

let ratingAndDisplayString = normalizedStarRating(forRating: 5, ofPossibleTotal: 10)
let ratingNumber = ratingAndDisplayString.0
let ratingString = ratingAndDisplayString.1
print("Rating: \(ratingNumber), Rating String: \(ratingString)")

// 배열 array
var moviesToWatch: Array<String> = Array() // Array 객체 + 제네릭
moviesToWatch.append("Star Wars")
moviesToWatch.append("The Lion King")
moviesToWatch.append("The Incredibles")

print(moviesToWatch)
print(moviesToWatch[0])
print(moviesToWatch[1])
print(moviesToWatch[2])
// print(moviesToWatch[3])
print(moviesToWatch.count)

// for (int i = 0; i < 10; i++) 0부터 시작하는 이유. 관례적, 반복문에서 사용하기 편리.

moviesToWatch.insert("The Avengers", at: 1)

let removedItem = moviesToWatch.remove(at: 2)
print(removedItem) // 삭제된 아이템 반환


print(moviesToWatch[2]) // 뒤에 있던 아이템이 당겨짐

print(moviesToWatch)
print(moviesToWatch.count)

let firstMovieToWatch = moviesToWatch.first
print(firstMovieToWatch ?? "No movie")

let lastMovieToWatch = moviesToWatch.last
print(lastMovieToWatch as Any)

let spyMovieSuggestions: [String] = ["The Bourne Identity", "Casino Royale", "Mission Impossible"]
// [String] == Array<String>
moviesToWatch += spyMovieSuggestions
print(moviesToWatch)
print(moviesToWatch.count)

var starWarsTrilogy = Array<String>(repeating: "Star Wars: ", count: 3)
starWarsTrilogy[0] = starWarsTrilogy[0] + "A New Hope"


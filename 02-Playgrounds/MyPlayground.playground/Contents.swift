
let phrase: String = "The quick brown fox jumps over the lazy dog"
let numberOfFoxes: Int = (1+1) // 2
let numberOfAnimals: Int = 2

let averageCharactersPerWord: Float = (3+5+5+3+5+4+3+4+3) / 9
print(averageCharactersPerWord)

// 상수는 수정이 불가능
// pharase = "The quick yellow fox jumps over the lazy dog"

var anotherPhrase: String = phrase
anotherPhrase = "The quick yellow fox jumps over the lazy dog"
print(phrase)
print(anotherPhrase)

var phraseInfo = "The phrase"  +  " has: "

phraseInfo += "\(numberOfFoxes) foxes"
// 다음과 동일하다. phraseInfo = phraseInfo + "\(numberOfFoxes) foxes"

var i = 1
i += 1
print(i)

print("Number of charaters: \(phrase.count)")

let multillineExplanation  = """
Why is the following phrase often used?
"The quick brown fox jumps over the lazy dog"
This phrase contains every letter in the alphaber.
"""

let phraseAreEqual = phrase == anotherPhrase
print(phraseAreEqual)

let phraseHas43Characters = phrase.count == 40 + 3
print(phraseHas43Characters)

let phraseHasMoreThan43Characters = phrase.count > 40 + 3
print(phraseHasMoreThan43Characters)



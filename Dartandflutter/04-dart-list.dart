void main() {
// String 타입의
  List<String> months = ['Jan', 'Feb', 'Mar'];

  months.add('Apr');

  months.forEach(print);

  print(months[0]);

  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.insert(2, 10); // 1, 2, 10, 3, 4, 5
  print(numbers); // 1, 2, 10, 3, 4, 5

  // 값 제거
  numbers.remove(4); // 1, 2, 10, 3, 5
  print(numbers); // 1, 2, 10, 3, 5

  // 값 제거 (인덱스 사용)
  numbers.removeAt(2); // 1, 2, 3, 5
  print(numbers); // 1, 2, 3, 5

  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  print(evenNumbers); // 2

  List<int> squareNumbers = numbers.map((number) => number * number).toList();
  print(squareNumbers); // 1, 4, 9, 25

  Map<String, dynamic> filmStarWars = {'title': 'Star Wars', 'year': 1977};

  Map<String, dynamic> filmEmpire = {
    'title': 'The Empire Strikes Back',
    'year': 1980
  };

  Map<String, dynamic> filmJedi = {
    'title': 'The Return of the Jedi',
    'year': 1983
  };

  List listFilms = [filmStarWars, filmEmpire, filmJedi];

  Map<String, dynamic> currentFilm = listFilms[0];

  var currentFilmTitle = currentFilm['title'];
  print(currentFilmTitle);
}

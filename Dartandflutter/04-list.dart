import 'dart:convert';

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

  print('=========================================');

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

  Map<int, String> mapMonths = {1: 'Jan', 2: 'Feb', 3: 'Mar'};

  mapMonths[4] = 'Apr';

  mapMonths.forEach((key, value) {
    print('$key: $value');
  });

  print(mapMonths[1]);

  print('=========================================');

  Map<String, int> scores = {
    'Alice': 90,
    'Bob': 80,
    'Charlie': 95,
  };

  print(scores.containsKey('Alice')); // true 출력

  print(scores.containsKey(80)); // true 출력

  scores.remove('Bob');
  print(scores);

  Map<String, int> updateScores =
      scores.map((key, value) => MapEntry(key, value + 5));
  print(updateScores);

  Map<String, dynamic> data = {'name': 'John', 'age': 30, 'city': 'Seoul'};

  if (data.containsKey('name')) {
    print('Name: ${data['name']}');
  }

  if (data.containsKey(30)) {
    print('Age: ${data['age']}');
  }

  Map<String, dynamic> user = {
    'id': 1,
    'info': {
      'name': 'Alice',
      'contacts': [
        {'type': 'email', 'value': 'alice@email.com'},
        {'type': 'phone', 'value': '123-456-7890'}
      ]
    }
  };

  String userJson = jsonEncode(user);
  print(userJson);

  Map<String, dynamic> parsed = jsonDecode(userJson);
  print(parsed['info']['contacts'][0]['value']);
}

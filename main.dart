int nested(dynamic obj) {
  if (obj is int) {
    return obj;
  }
  else if (obj is double) {
    return obj.floor();
  }
  else if (obj is String) {
    return sumAscii(obj);
  }
  else if (obj is List) {
    int total = 0;
    for (var num in obj) {
      total += nested(num);
    }return total;
  }
  else if (obj is Map) {
    int total = 0;
    for (var value in obj.values) {
      total += nested(value);
    }return total;
  }
  else if (obj is (dynamic, dynamic)) {
    var (a, b) = obj;
    return sumPair((a, b));
  } else if (obj is ({dynamic first, dynamic second})) {
    return sumPair((obj.first, obj.second));
  }
  return 0;
}

int sumAscii(String s) {
  int total = 0;
  for (var rune in s.runes) {
    if (rune >= 0 && rune <= 127) {
      total += rune;}
  }return total;
}

int sumPair((dynamic, dynamic) pair) {
  var (a, b) = pair;
  int left = nested(a);
  int right = nested(b);
  return left + right;
}

void main() {
  var data = [
    1,
    [2, 3, 4],
    {'a': 5, 'b': ["ab", 7]},
    (first: 8, second: "c"),
    {'c': (first: 10, second: ["xy", 12])},
    "z",
    13.5,
    [14, {'d': 15, 'e': (first: "p", second: 17)}],
  ];

  int total = 0;
  for (var element in data) {
    total += nested(element);
  }

  print("Total = $total");
}

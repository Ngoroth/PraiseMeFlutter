import 'dart:math';

final List<String> praises = [
  "You can do it!",
  "You are awesome!",
  "You are great!"
];

final _random = Random(134);

String getRandomPraise() {
  return praises[_random.nextInt(praises.length)];
}

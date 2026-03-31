import 'dart:io';

String decompressString(String input) {
  if (input.isEmpty) return '';

  final validationRegex = RegExp(r'^([a-zA-Z][0-9]*)+$');
  if (!validationRegex.hasMatch(input)) {
    throw FormatException('Ungültiger komprimierter String.', input);
  }

  StringBuffer result = StringBuffer();
  int n = input.length;
  for (int i = 0; i < n; i++) {
    String char = input[i];
    
    // Prüfen, ob eine Zahl folgt
    int j = i + 1;
    while (j < n && RegExp(r'[0-9]').hasMatch(input[j])) {
      j++;
    }

    if (j > i + 1) {
      // Eine Zahl wurde gefunden
      int count = int.parse(input.substring(i + 1, j));
      result.write(char * count); // Dart erlaubt String-Multiplikation!
      i = j - 1; // i wird am Ende der Schleife nochmals um 1 erhöht
    } else {
      // Keine Zahl, nur das Zeichen
      result.write(char);
    }
  }

  return result.toString();
}

void main(List<String> args) {
  if (args.isEmpty) {
    stdout.write('Bitte gib einen komprimierten String ein: ');
    String input = stdin.readLineSync() ?? '';
    try {
      if (input.isNotEmpty) {
        print(decompressString(input));
      } else {
        print('');
      }
    } catch (e) {
      print((e as FormatException).message);
    }
  } else if (args.length == 1) {
    try {
      print(decompressString(args.first));
    } catch (e) {
      print((e as FormatException).message);
    }
  } else {
    try {
      List<String> results = args.map((arg) => decompressString(arg)).toList();
      print(results);
    } catch (e) {
      print((e as FormatException).message);
    }
  }
}

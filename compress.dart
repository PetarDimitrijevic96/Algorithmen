import 'dart:io';

String compressString(String input) {
  if (input.isEmpty) return '';

  final regex = RegExp(r'^[a-zA-Z]+$');
  if (!regex.hasMatch(input)) {
    throw FormatException('Ungültige Eingabe: Nur Buchstaben (a-z, A-Z) sind erlaubt.', input);
  }

  StringBuffer result = StringBuffer();
  int n = input.length;
  for (int i = 0; i < n; i++) {
    int count = 1;
    while (i < n - 1 && input[i] == input[i + 1]) {
      count++;
      i++;
    }

    if (count >= 3) {
      result.write('${input[i]}$count');
    } else if (count == 2) {
      result.write('${input[i]}${input[i]}');
    } else {
      result.write(input[i]);
    }
  }

  return result.toString();
}

void main(List<String> args) {
  if (args.isEmpty) {
    stdout.write('Bitte gib einen String zur Komprimierung ein: ');
    String input = stdin.readLineSync() ?? '';
    try {
      if (input.isNotEmpty) {
        // Validation happens in compressString -> might throw exception if invalid characters
        print(compressString(input));
      } else {
        print('');
      }
    } catch (e) {
      print((e as FormatException).message);
    }
  } else if (args.length == 1) {
    try {
      print(compressString(args.first));
    } catch (e) {
      print((e as FormatException).message);
    }
  } else {
    try {
      List<String> results = args.map((arg) => compressString(arg)).toList();
      print(results);
    } catch (e) {
      print((e as FormatException).message);
    }
  }
}

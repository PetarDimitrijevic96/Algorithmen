import 'dart:io';
import 'dart:math';

void main() {
  int? limit;
  while (limit == null || limit <= 0) {
    stdout.write('Bitte gib die maximale Anzahl der Würfe ein: ');
    String input = stdin.readLineSync() ?? '';
    limit = int.tryParse(input);
  }

  final random = Random();
  List<int> rolls = [];
  int consecutiveSixes = 0;

  for (int i = 0; i < limit; i++) {
    int currentRoll = random.nextInt(6) + 1;
    rolls.add(currentRoll);

    if (currentRoll == 6) {
      consecutiveSixes++;
    } else {
      consecutiveSixes = 0;
    }

    if (consecutiveSixes == 2) {
      print(
        'Zwei Sechser nacheinander gewürfelt! Es brauchte ${rolls.length} Würfe.',
      );
      print('Gewürfelte Werte: $rolls');
      return;
    }
  }

  print('Limit erreicht.');
  print('Gewürfelte Werte: $rolls');
}

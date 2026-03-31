import 'dart:io';

void main() {
  int? max;
  while (max == null || max < 2) {
    stdout.write(
      'Bitte gib eine Zahl die größer oder gleich 2 ist ein, bis zu der Primzahlen gesucht werden sollen: ',
    );
    String input = stdin.readLineSync() ?? '';
    max = int.tryParse(input);
  }

  List<bool> isPrime = List.filled(max + 1, true);
  isPrime[0] = false;
  isPrime[1] = false;

  for (int p = 2; p * p <= max; p++) {
    if (isPrime[p]) {
      for (int i = p * p; i <= max; i += p) {
        isPrime[i] = false;
      }
    }
  }

  List<int> primes = [];
  for (int p = 2; p <= max; p++) {
    if (isPrime[p]) {
      primes.add(p);
    }
  }

  print('Gefundene Primzahlen bis $max:');
  print(primes.join(', '));
}

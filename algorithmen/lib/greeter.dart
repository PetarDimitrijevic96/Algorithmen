import 'dart:io';

void main() {
  String vorname = '';
  while (vorname.trim().isEmpty || !vorname.contains(RegExp(r'^[A-Za-z]+$'))) {
    stdout.write('Bitte gib deinen Vornamen ein: ');
    vorname = stdin.readLineSync() ?? '';
  }

  String nachname = '';
  while (nachname.trim().isEmpty) {
    stdout.write('Bitte gib deinen Nachnamen ein: ');
    nachname = stdin.readLineSync() ?? '';
  }

  int? alter;
  while (alter == null || alter < 0 || alter > 100) {
    stdout.write('Bitte gib dein Alter ein (0-100): ');
    String input = stdin.readLineSync() ?? '';
    alter = int.tryParse(input);
  }

  String geschlecht = '';
  while (geschlecht != 'm' && geschlecht != 'w' && geschlecht != 'd') {
    stdout.write('Bitte gib dein Geschlecht ein (m/w/d): ');
    geschlecht = (stdin.readLineSync() ?? '').toLowerCase().trim();
  }

  if (alter < 40) {
    print('Hallo, $vorname!');
  } else {
    String anrede = '';
    if (geschlecht == 'm') {
      anrede = 'Herr';
    } else if (geschlecht == 'w') {
      anrede = 'Frau';
    } else {
      anrede = '';
    }

    final hour = DateTime.now().hour;
    String tageszeit = 'Guten Tag';

    if (hour >= 5 && hour < 12) {
      tageszeit = 'Guten Morgen';
    } else if (hour >= 18 || hour < 5) {
      tageszeit = 'Guten Abend';
    }

    if (anrede.isNotEmpty) {
      print('$tageszeit, $anrede $nachname!');
    } else {
      print('$tageszeit, $nachname!');
    }
  }
}

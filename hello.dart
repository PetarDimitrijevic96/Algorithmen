void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hallo!');
  } else {
    final name = arguments.join(' ');
    print('Hallo $name!');
  }
}

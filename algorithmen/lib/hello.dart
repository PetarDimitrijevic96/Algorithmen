void main(List<String> arguments) {
  if (arguments.isNotEmpty) {
    print('Hallo ${arguments[0]}!');
  } else {
    print('Hallo!');
  }
}

class Car {
  final String _imageLink;
  final String _name;

  Car({required imageLink, required name}) :
      _imageLink = imageLink,
      _name = name;

  String get imageLink => _imageLink;
  String get name => _name;
}
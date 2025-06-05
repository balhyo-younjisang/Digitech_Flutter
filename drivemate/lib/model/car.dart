class Car {
  final String _imageLink;
  final String _name;
  final bool _isFile;

  Car({required imageLink, required name, isFile = false}) :
      _imageLink = imageLink,
      _name = name,
  _isFile = isFile;

  String get imageLink => _imageLink;
  String get name => _name;
  bool get isFile => _isFile;
}
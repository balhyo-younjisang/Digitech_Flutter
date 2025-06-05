class TabState {
  final String _assets;
  final String _name;
  bool _state;
  final String _inactivateText;
  final String _activateText;

  TabState({required String assets, required String name, required bool state, required String inactivateText, required String activateText})
      : _assets = assets,
        _name  = name,
        _state = state,
        _inactivateText = inactivateText,
        _activateText = activateText;

  String get assets => _assets;
  String get name => _name;
  bool get state => _state;
  String get inactivateText => _inactivateText;
  String get activateText => _activateText;

  String stateText() {
    return _state ? activateText : inactivateText;
  }

  void changeState(bool newState) {
    _state = newState;
  }
}

class ControllerTabState extends TabState {
  final bool _isRotate;
  final bool _isHeater;
  final bool _isUnder;

  ControllerTabState({required super.assets, required super.name, required super.state, required super.inactivateText, required super.activateText, required bool isRotate, required bool isHeater, required bool isUnder})
  : _isRotate = isRotate,
  _isHeater = isHeater,
  _isUnder = isUnder;

  bool get isRotate => _isRotate;
  bool get isHeater => _isHeater;
  bool get isUnder => _isUnder;
}
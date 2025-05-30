class RoutineModel {
  final String _title;
  final String _clock;
  final String _date;

  RoutineModel({required title, required clock, required date})
   : _title = title, _clock = clock, _date = date;

  String get date => _date;
  String get clock => _clock;
  String get title => _title;
}
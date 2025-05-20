import 'package:assignment1/model/user.dart';

class Contact {
  final String _number;
  final User _user;

  const Contact(
    final String number,
    final User user,
  ) : this._number = number, this._user = user;

  String get number {
    return this._number;
  }

  User get user {
    return this._user;
  }
}
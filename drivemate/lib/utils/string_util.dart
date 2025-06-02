
class StringUtilityResponse {
  final bool _isTrue;
  final String _message;

  StringUtilityResponse({required isTrue, required message})
    : _isTrue = isTrue,
      _message = message;

  bool get isTrue => _isTrue;
  String get message => _message;
}

typedef StringValidator = StringUtilityResponse Function(String input);

class StringUtility {
  static StringUtilityResponse isStringShorterThan(
      String targetString, int length, String? alias, bool? mustBeTrue) {
    bool result = targetString.length < length;
    String name = alias ?? targetString;
    String message = (mustBeTrue ?? false)
        ? (result
        ? "$name must be shorter than $length"
        : "$name must be longer than or equal to $length ")
        : (result
        ? "$name is shorter than $length"
        : "$name is equal to or longer than $length");

    return StringUtilityResponse(isTrue: result, message: message);
  }

  static StringUtilityResponse isStringIncludeBlank(
      String targetString, String? alias, bool? mustBeTrue) {
    bool result = targetString.contains(" ");
    String name = alias ?? targetString;
    String message = (mustBeTrue ?? false)
        ? (result
        ? "$name must include a blank"
        : "$name must not include any blanks")
        : (result
        ? "$name includes a blank"
        : "$name does not include any blank");

    return StringUtilityResponse(isTrue: result, message: message);
  }

  static StringUtilityResponse isStringEmpty(
      String targetString, [String? alias, bool? mustBeTrue]) {
    bool result = targetString.isEmpty;
    String name = alias ?? targetString;
    String message = (mustBeTrue ?? false)
        ? (result
        ? "$name must be empty"
        : "$name must not be empty")
        : (result
        ? "$name is empty"
        : "$name is not empty");

    return StringUtilityResponse(isTrue: result, message: message);
  }


  // static StringUtilityResponse isStringNotEmpty( String targetString, [String? alias, bool? mustBeTrue]){
  //   bool result = targetString.isNotEmpty;
  //   String name = alias ?? targetString;
  //   String message = (mustBeTrue ?? false)
  //       ? (result
  //       ? "$name must be empty"
  //       : "$name must not be empty")
  //       : (result
  //       ? "$name is empty"
  //       : "$name is not empty");
  //
  //   return StringUtilityResponse(isTrue: result, message: message);
  // }


  static List<StringValidator> createValidator() {
    return <StringValidator>[];
  }

  static void addValidator(List<StringValidator> list, StringValidator validator) {
    list.add(validator);
  }
}

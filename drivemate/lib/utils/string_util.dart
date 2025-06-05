/// 문자열 검증 결과를 담는 클래스
class StringValidationResult {
  final bool _isValid;
  final String _message;

  const StringValidationResult({
    required bool isValid,
    required String message,
  }) : _isValid = isValid,
        _message = message;

  /// 검증 결과가 유효한지 여부
  bool get isValid => _isValid;

  /// 검증 결과가 실패했는지 여부 (로그인 페이지에서 사용하는 용도)
  bool get isTrue => !_isValid;

  /// 검증 결과 메시지
  String get message => _message;

  /// 성공 결과 생성
  static StringValidationResult success([String message = '']) {
    return StringValidationResult(isValid: true, message: message);
  }

  /// 실패 결과 생성
  static StringValidationResult failure(String message) {
    return StringValidationResult(isValid: false, message: message);
  }
}

/// 문자열 검증 함수 타입
typedef StringValidator = StringValidationResult Function(String input);

/// 문자열 검증 유틸리티 클래스
class StringUtility {
  StringUtility._(); // 인스턴스 생성 방지

  // 기본 에러 메시지 템플릿
  static const String _emptyFieldMessage = '{field}을(를) 입력해주세요.';
  static const String _shortFieldMessage = '{field}은(는) 최소 {length}자 이상이어야 합니다.';
  static const String _blankNotAllowedMessage = '{field}에는 공백을 포함할 수 없습니다.';

  /// 문자열이 비어있는지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateEmpty(
      String targetString, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    if (targetString.trim().isEmpty) {
      final message = customMessage ??
          _emptyFieldMessage.replaceAll('{field}', fieldName);
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 문자열이 최소 길이를 만족하는지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [minLength]: 최소 길이
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateMinLength(
      String targetString,
      int minLength, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    if (targetString.length < minLength) {
      final message = customMessage ??
          _shortFieldMessage
              .replaceAll('{field}', fieldName)
              .replaceAll('{length}', minLength.toString());
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 문자열이 최대 길이를 초과하지 않는지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [maxLength]: 최대 길이
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateMaxLength(
      String targetString,
      int maxLength, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    if (targetString.length > maxLength) {
      final message = customMessage ??
          '$fieldName은(는) 최대 ${maxLength}자까지 입력 가능합니다.';
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 문자열에 공백이 포함되어 있지 않은지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateNoSpaces(
      String targetString, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    if (targetString.contains(' ')) {
      final message = customMessage ??
          _blankNotAllowedMessage.replaceAll('{field}', fieldName);
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 이메일 형식인지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateEmail(
      String targetString, {
        String fieldName = '이메일',
        String? customMessage,
      }) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(targetString)) {
      final message = customMessage ?? '올바른 $fieldName 형식이 아닙니다.';
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 숫자로만 구성되어 있는지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateNumericOnly(
      String targetString, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    final numericRegex = RegExp(r'^[0-9]+$');
    if (!numericRegex.hasMatch(targetString)) {
      final message = customMessage ?? '$fieldName은(는) 숫자만 입력 가능합니다.';
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 영문자로만 구성되어 있는지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateAlphabetOnly(
      String targetString, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    final alphabetRegex = RegExp(r'^[a-zA-Z]+$');
    if (!alphabetRegex.hasMatch(targetString)) {
      final message = customMessage ?? '$fieldName은(는) 영문자만 입력 가능합니다.';
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  /// 영문자와 숫자로만 구성되어 있는지 검증
  /// 
  /// [targetString]: 검증할 문자열
  /// [fieldName]: 필드명 (에러 메시지에 사용)
  /// [customMessage]: 커스텀 에러 메시지
  static StringValidationResult validateAlphanumeric(
      String targetString, {
        String fieldName = '입력값',
        String? customMessage,
      }) {
    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!alphanumericRegex.hasMatch(targetString)) {
      final message = customMessage ?? '$fieldName은(는) 영문자와 숫자만 입력 가능합니다.';
      return StringValidationResult.failure(message);
    }
    return StringValidationResult.success();
  }

  // === 기존 코드와의 호환성을 위한 레거시 메서드들 ===

  /// @deprecated 대신 [validateEmpty] 사용을 권장합니다.
  static StringValidationResult isStringEmpty(
      String targetString, [
        String? alias,
        bool? mustBeTrue,
      ]) {
    final result = validateEmpty(targetString, fieldName: alias ?? '입력값');
    return StringValidationResult(
      isValid: result.isValid,
      message: result.message,
    );
  }

  /// @deprecated 대신 [validateMinLength] 사용을 권장합니다.
  static StringValidationResult isStringShorterThan(
      String targetString,
      int length,
      String? alias,
      bool? mustBeTrue,
      ) {
    final result = validateMinLength(
      targetString,
      length,
      fieldName: alias ?? '입력값',
    );
    return StringValidationResult(
      isValid: result.isValid,
      message: result.message,
    );
  }

  /// @deprecated 대신 [validateNoSpaces] 사용을 권장합니다.
  static StringValidationResult isStringIncludeBlank(
      String targetString,
      String? alias,
      bool? mustBeTrue,
      ) {
    final result = validateNoSpaces(targetString, fieldName: alias ?? '입력값');
    return StringValidationResult(
      isValid: result.isValid,
      message: result.message,
    );
  }

  // === 검증자 관리 메서드들 ===

  /// 검증자 리스트 생성
  static List<StringValidator> createValidator() {
    return <StringValidator>[];
  }

  /// 검증자 추가
  static void addValidator(
      List<StringValidator> validators,
      StringValidator validator,
      ) {
    validators.add(validator);
  }

  /// 여러 검증자를 순차적으로 실행
  /// 
  /// [input]: 검증할 문자열
  /// [validators]: 검증자 리스트
  /// 
  /// Returns: 첫 번째 실패한 검증 결과, 모두 성공하면 성공 결과
  static StringValidationResult validateWithValidators(
      String input,
      List<StringValidator> validators,
      ) {
    for (final validator in validators) {
      final result = validator(input);
      if (!result.isValid) {
        return result;
      }
    }
    return StringValidationResult.success();
  }

  /// 일반적인 사용자명 검증자 생성
  /// 
  /// [minLength]: 최소 길이 (기본값: 4)
  /// [maxLength]: 최대 길이 (기본값: 20)
  static List<StringValidator> createUsernameValidators({
    int minLength = 4,
    int maxLength = 20,
  }) {
    return [
          (input) => validateEmpty(input, fieldName: '사용자명'),
          (input) => validateNoSpaces(input, fieldName: '사용자명'),
          (input) => validateMinLength(input, minLength, fieldName: '사용자명'),
          (input) => validateMaxLength(input, maxLength, fieldName: '사용자명'),
          (input) => validateAlphanumeric(input, fieldName: '사용자명'),
    ];
  }

  /// 일반적인 비밀번호 검증자 생성
  /// 
  /// [minLength]: 최소 길이 (기본값: 8)
  /// [maxLength]: 최대 길이 (기본값: 50)
  static List<StringValidator> createPasswordValidators({
    int minLength = 8,
    int maxLength = 50,
  }) {
    return [
          (input) => validateEmpty(input, fieldName: '비밀번호'),
          (input) => validateMinLength(input, minLength, fieldName: '비밀번호'),
          (input) => validateMaxLength(input, maxLength, fieldName: '비밀번호'),
    ];
  }

  /// 일반적인 이메일 검증자 생성
  static List<StringValidator> createEmailValidators() {
    return [
          (input) => validateEmpty(input, fieldName: '이메일'),
          (input) => validateEmail(input),
    ];
  }
}
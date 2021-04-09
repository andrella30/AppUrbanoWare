class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": "E-mail já existe",
    "OPERATION_NOT_ALLOWED": "Operação não permitida",
    "TOO_MANY_ATTEMPS_TRY_LATER": "Tente Mais Tarde",
    "EMAIL_NOT_FOUND": "Email não encontrado",
    "INVALID_PASSWORD": "Senha Inválida!",
    "USER_DISABLE": "Usuário Desativado",
  };

  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return "Ocorreu um erro na auteticação";
    }
  }
}
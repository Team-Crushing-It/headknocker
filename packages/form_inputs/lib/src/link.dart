import 'package:formz/formz.dart';

enum LinkValidationError { invalid }

class Link extends FormzInput<String, LinkValidationError> {
  const Link.pure() : super.pure('');
  const Link.dirty([String value = '']) : super.dirty(value);

  static final RegExp _linkRegExp = RegExp(
    r'^[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
  );

  @override
  LinkValidationError? validator(String? value) {
    return _linkRegExp.hasMatch(value ?? '')
        ? null
        : LinkValidationError.invalid;
  }
}

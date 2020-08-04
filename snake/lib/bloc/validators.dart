import 'dart:async';

class Validators {

  final validationUser = StreamTransformer<String, String>.fromHandlers(
    handleData: (user, sink) {

      if (user.length >= 1) {//if (regExp.hasMatch(email)) {
        sink.add(user);
      } else {
        sink.addError("Usuario inválido");
      }
    }
  );

  final validationPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError("Mínimo 6 caracteres");
      }
    }
  );

  final validationPasswordTwo = StreamTransformer<String, String>.fromHandlers(
      handleData: (passwordTwo, sink) {
        if ((passwordTwo.length >= 6)) {
          sink.add(passwordTwo);
        } else {
          sink.addError("Mínimo 6 caracteres");
        }
      }
  );

  final validationEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {

        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);

        if (regExp.hasMatch(email)) {
          sink.add(email);
        } else {
          sink.addError("Email incorrecto");
        }
      }
  );

}
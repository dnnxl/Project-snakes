import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:snake/bloc/validators.dart';

class LoginBloc with Validators {

  // final _emailController =  StreamController<String>.broadcast();
  // final _passwordController =  StreamController<String>.broadcast();

  final _emailController =  BehaviorSubject<String>();
  final _passwordController =  BehaviorSubject<String>();

  //Recuperar datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform(validationEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validationPassword);

  Stream<bool> get formValidStream => Observable.combineLatest2(emailStream, passwordStream, (email, password) => true);

  //Insertar datos al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener último dato de los Streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}
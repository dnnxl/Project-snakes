import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/rxdart.dart';

import 'package:snake/bloc/validators.dart';

class LoginBloc with Validators {

  // final _emailController =  StreamController<String>.broadcast();
  // final _passwordController =  StreamController<String>.broadcast();

  final _nameController =  BehaviorSubject<String>();
  final _emailController =  BehaviorSubject<String>();
  final _roleController =  BehaviorSubject<String>();

  final _userController =  BehaviorSubject<String>();
  final _passwordController =  BehaviorSubject<String>();

  final _passwordTwoController =  BehaviorSubject<String>();


  //Recuperar datos del Stream
  Stream<String> get nameStream    => _userController.stream.transform(validationUser);
  Stream<String> get emailStream    => _emailController.stream.transform(validationEmail);
  Stream<String> get roleStream    => _userController.stream.transform(validationUser);

  Stream<String> get userStream    => _userController.stream.transform(validationUser);
  Stream<String> get passwordStream => _passwordController.stream.transform(validationPassword);

  Stream<String> get passwordTwoStream => _passwordTwoController.stream.transform(validationPasswordTwo);


  Stream<bool> get formValidStream => Observable.combineLatest2(userStream, passwordStream, (user, password) => true);

  //Insertar datos al Stream
  Function(String) get changeName    => _nameController.sink.add;
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changeRole    => _roleController.sink.add;

  Function(String) get changeUser    => _userController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changePasswordTwo    => _passwordTwoController.sink.add;

  //Obtener último dato de los Streams
  String get name    => _nameController.value;
  String get email    => _emailController.value;
  String get role    => _roleController.value;

  String get user    => _userController.value;
  String get password => _passwordController.value;

  String get passwordTwo    => _passwordTwoController.value;

  dispose() {

    //this._userController = null;
    //this._passwordController = null;
    _nameController?.close();
    _emailController?.close();
    _roleController?.close();

    _userController?.close();
    _passwordController?.close();

    _passwordTwoController?.close();
  }

}
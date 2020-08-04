import 'package:flutter/material.dart';
import 'package:snake/bloc/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 40, 52, 1.0),
      body: SingleChildScrollView( child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: <Color> [
                  Color.fromRGBO(43, 47, 62, 1.0),
                  Color.fromRGBO(37, 40, 52, 1.0)
                ]
            )
        ),
        child: Column(
          children: <Widget>[
            //_background(),
            _loginForm(context)
          ],
        ),
      ),
      ),
      //resizeToAvoidBottomInset: false
      //resizeToAvoidBottomPadding: false,
    );
  }

  Widget _background() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, -1.0),
          end: Alignment(1.0, 1.0),
          colors: <Color> [
            Color.fromRGBO(43, 47, 62, 1.0),
            Color.fromRGBO(37, 40, 52, 1.0)
          ]
        )
      ),
    );
  }

  Widget _loginForm(context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 10.0),
            _logo(),
            SizedBox(height: 40.0),
            _form(context),
            //Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, //MainAxisAlignment.spaceAround
              children: <Widget>[
                Container(
                    color: Colors.white.withOpacity(0.1),
                    width: 2.0,
                    height: 15.0
                ),
                FlatButton(
                  child: Text("CREAR CUENTA"),
                  textColor: Colors.white,
                  onPressed: () {Navigator.pushReplacementNamed(context, 'signup');},
                ),
                Container(
                  color: Colors.white.withOpacity(0.1),
                  width: 2.0,
                  height: 15.0
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Align(
        alignment: Alignment.center,
        child:Container(
      child: Column(
        children: <Widget>[
          /*Icon(
            Icons.camera,
            size: 10.0,
            color: Color.fromRGBO(255, 45, 102, 1.0),
          ),*/
          Text(
            "Login",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          Text(
            "Serpientes de Costa Rica",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ],
      ),
        )
    );
  }

  Widget _form(context) {

    final bloc = Provider.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 0.0, left: 80, right: 40),
        child: Column(
          children: <Widget>[
            _inputEmail(bloc),
            SizedBox(height: 10.0),
            _inputPassword(bloc),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: _btnSubmit(bloc, context),
            )
          ],
        ),
      )
    );
  }

  Widget _inputEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
          style: TextStyle(
            color: Color.fromRGBO(39, 204, 192, 1.0)
          ),
          decoration: InputDecoration(
            counterStyle: TextStyle(
              color: Color.fromRGBO(255, 45, 102, 1.0)
            ),
            prefixIcon: Icon(
              Icons.person_outline,
              color: Color.fromRGBO(39, 204, 192, 1.0),
            ),
            hintText: "Usuario",
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5)
            ),
            counterText: snapshot.error,
            // counterText: snapshot.data,
            // errorText: snapshot.error,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1)
          ),
          onChanged: bloc.changeUser
        );
      },
    );
  }

  Widget _inputPassword(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
          style: TextStyle(
            color: Color.fromRGBO(39, 204, 192, 1.0)
          ),
          decoration: InputDecoration(
            counterStyle: TextStyle(
              color: Color.fromRGBO(255, 45, 102, 1.0)
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Color.fromRGBO(39, 204, 192, 1.0),
            ),
            hintText: "Contraseña",
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5)
            ),
            counterText: snapshot.error,
            // counterText: snapshot.data,
            // errorText: snapshot.error,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1)
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  Widget _btnSubmit(LoginBloc bloc, context) {

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        return RaisedButton(
          color: Color.fromRGBO(39, 204, 192, 1.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 19.0),
            child: Text(
              "ENTRAR",
              style: TextStyle(
                fontSize: 18.0,
              )
            ),
          ),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: (snapshot.hasData) ? () => _login(bloc, context): null,
        );
      },
    );
  }

  _login(LoginBloc bloc, context) {
    print("================");
    print("Usuario: ${bloc.user}");
    print("Password: ${bloc.password}");
    print("================");

    _mensajeAcceso(bloc, context);
  }

  void _mensajeAcceso(bloc, context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Bienvenido"),
            content: Text("Recuerde respetar la vida silvestre."),
            actions: <Widget>[
              RaisedButton(
                color: Color.fromRGBO(39, 204, 192, 1.0),
                child: Text("Aceptar", style: TextStyle(color: Colors.white),),
                onPressed: (){ Navigator.of(context).pop(); Navigator.of(context).pushNamedAndRemoveUntil('/inicio', (Route<dynamic> route) => false);},
              )
            ],
          );
        }
    );
  }

}
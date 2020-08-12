import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:snake/bloc/provider.dart';
import 'package:snake/content/Services.dart';


class SignupPage extends StatefulWidget {
  State createState() =>  SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Ciudadano',Icon(Icons.person_pin,color:  const Color.fromRGBO(0, 0, 0, 1.0),)),
    const Item('Bombero',Icon(Icons.flare,color:  const Color.fromRGBO(0, 0, 0, 1.0),)),
    const Item('Guardaparques',Icon(Icons.nature_people,color:  const Color.fromRGBO(0, 0, 0, 1.0),)),
    const Item('Médico',Icon(Icons.healing,color:  const Color.fromRGBO(0, 0, 0, 1.0),)),
  ];

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
                  /*Color.fromRGBO(43, 47, 62, 1.0),
                  Color.fromRGBO(37, 40, 52, 1.0)*/
                  Color.fromRGBO(25, 53, 30, 1.0),
                  Color.fromRGBO(25, 53, 30, 1.0)
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 500),
        child: FloatingActionButton(
          hoverColor: Colors.black,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          tooltip: 'Volver',
          onPressed: () async {
            Navigator.pushNamed(context, "login");
          },
          child: Icon(Icons.arrow_back),
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
            SizedBox(height: 20.0),
            _form(context),
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
            "Registro",
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
        padding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 130, right: 80),
        child: Column(
          children: <Widget>[
            _inputName(bloc),
            SizedBox(height: 10.0),
            _inputEmail(bloc),
            SizedBox(height: 10.0),
            _inputRole(bloc),
            SizedBox(height: 10.0),
            _inputUser(bloc),
            SizedBox(height: 10.0),
            _inputPassword(bloc),
            SizedBox(height: 10.0),
            _inputPasswordTwo(bloc),
            SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: _btnSubmit(bloc, context),
            )
          ],
        ),
      )
    );
  }

  Widget _inputName(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          keyboardType: TextInputType.text,
          //cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
          cursorColor: Color.fromRGBO(255, 255, 255, 1.0),
          style: TextStyle(
              //color: Color.fromRGBO(255, 255, 255, 1.0)
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          decoration: InputDecoration(
              //isDense: true,                      // Added this
              //contentPadding: EdgeInsets.all(0),
              counterStyle: TextStyle(
                  color: Color.fromRGBO(255, 45, 102, 1.0)
              ),
              prefixIcon: Icon(
                Icons.edit,
                //color: Color.fromRGBO(39, 204, 192, 1.0),
                  color: Color.fromRGBO(255, 255, 255, 1.0)
              ),
              hintText: "Nombre Completo",
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
          onChanged: bloc.changeName,
        );
      },
    );
  }

  Widget _inputEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          //cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
            cursorColor: Color.fromRGBO(255, 255, 255, 1.0),
          style: TextStyle(
              //color: Color.fromRGBO(39, 204, 192, 1.0)
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          decoration: InputDecoration(
              counterStyle: TextStyle(
                  color: Color.fromRGBO(255, 45, 102, 1.0)
              ),
              prefixIcon: Icon(
                Icons.alternate_email,
                //color: Color.fromRGBO(39, 204, 192, 1.0),
                  color: Color.fromRGBO(255, 255, 255, 1.0)
              ),
              hintText: "Correo electrónico",
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
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _inputRole(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.roleStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return DropdownButton<Item>(
          //dropdownColor: Color.fromRGBO(25, 53, 30, 1.0),
          //focusColor: Color.fromRGBO(25, 53, 30, 1.0),
          hint:  Text("Seleccione un rol"),
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              fontSize: 17,
          ),
          value: selectedUser,
          onChanged: (Item Value) {
            setState(() {
              selectedUser = Value;
              bloc.changeRole;
            });
          },

          items: users.map((Item user) {
            return  DropdownMenuItem<Item>(
              value: user,
              child: Row(
                children: <Widget>[
                  user.icon,
                  SizedBox(width: 225,),
                  Text(
                    user.name,
                    //style:  TextStyle(color: Color.fromRGBO(39, 204, 192, 1.0)),//Colors.white.withOpacity(0.5)),
                    style:  TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0)),//Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },

    );
  }

  Widget _inputUser(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.userStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          //cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
            cursorColor: Color.fromRGBO(255, 255, 255, 1.0),
          style: TextStyle(
            //color: Color.fromRGBO(39, 204, 192, 1.0)
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          decoration: InputDecoration(
            counterStyle: TextStyle(
              color: Color.fromRGBO(255, 45, 102, 1.0)
            ),
            prefixIcon: Icon(
              Icons.person_outline,
              //color: Color.fromRGBO(39, 204, 192, 1.0),
                color: Color.fromRGBO(255, 255, 255, 1.0),
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
          onChanged: bloc.changeUser,
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
          //cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
            cursorColor: Color.fromRGBO(255, 255, 255, 1.0),
          style: TextStyle(
            //color: Color.fromRGBO(39, 204, 192, 1.0)
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          decoration: InputDecoration(
            counterStyle: TextStyle(
              color: Color.fromRGBO(255, 45, 102, 1.0)
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              //color: Color.fromRGBO(39, 204, 192, 1.0),
                color: Color.fromRGBO(255, 255, 255, 1.0),
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

  Widget _inputPasswordTwo(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.passwordTwoStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          //cursorColor: Color.fromRGBO(39, 204, 192, 1.0),
            cursorColor: Color.fromRGBO(255, 255, 255, 1.0),
          style: TextStyle(
              //color: Color.fromRGBO(39, 204, 192, 1.0)
              color: Color.fromRGBO(255, 255, 255, 1.0)
          ),
          decoration: InputDecoration(
              counterStyle: TextStyle(
                  color: Color.fromRGBO(255, 45, 102, 1.0)
              ),
              prefixIcon: Icon(
                Icons.lock_outline,
                //color: Color.fromRGBO(39, 204, 192, 1.0),
                color: Color.fromRGBO(255, 255, 255, 1.0),
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
          onChanged: bloc.changePasswordTwo,
        );
      },
    );
  }

  Widget _btnSubmit(LoginBloc bloc, context) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          //color: Color.fromRGBO(39, 204, 192, 1.0),
          color: Color.fromRGBO(121, 138, 61, 1.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 19.0),
            child: Text(
              "Aceptar",
              style: TextStyle(
                fontSize: 18.0,
              )
            ),
          ),
          elevation: 2.0,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          onPressed: snapshot.hasData ? () => _signup(bloc, context) : null,
        );
      },
    );
  }

  _signup(LoginBloc bloc, context) {
    print("================");
    print("Name: ${bloc.name}");
    print("Email: ${bloc.email}");
    print("Role: ${bloc.role}");
    print("Role:" + selectedUser.name);
    print("User: ${bloc.user}");
    print("Password: ${bloc.password}");
    print("Password2: ${bloc.passwordTwo}");
    print("================");

    var usuario = {
      "Name": bloc.name,
      "Mail": bloc.email,
      "Rol": selectedUser.name,
      "UserName": bloc.user,
      "Password": bloc.password
    };

    if(bloc.password == bloc.passwordTwo){
      Services service = new Services();
      service.postDataCreateUser(usuario);
      _mensajeRegistroExitoso(context);
      bloc.dispose();
    }else{
      _mensajeError(context);
    }
  }
}


void _mensajeError(context) {
  showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("¡Las contraseñas no coinciden.!"),
          actions: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text("Aceptar", style: TextStyle(color: Colors.white),),
              onPressed: (){ Navigator.of(context).pop();},
            )
          ],
        );
      }
  );
}

void _mensajeRegistroExitoso(context) {
  showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text("Bienvenido"),
          content: Text("¡Usuario registrado correctamente.!"),
          actions: <Widget>[
            RaisedButton(
              //color: Color.fromRGBO(39, 204, 192, 1.0),
              color: Color.fromRGBO(121, 138, 61, 1.0),
              child: Text("Aceptar", style: TextStyle(color: Colors.white),),
              onPressed: (){ Navigator.of(context).pop(); Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);},
            )
          ],
        );
      }
  );
}

class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}
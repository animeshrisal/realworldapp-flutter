import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget{

  @override
  RegisterFormState createState(){
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm>{

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[TextFormField(validator: (value){if(value.isEmpty)},)],
      ), 
    );
  }
}
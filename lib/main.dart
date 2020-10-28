import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

String output = "0";

String _output = "0";
double num1 = 0.0;
double num2 = 0.0;
String operand = "";




buttonPressed(String buttonText){

if(buttonText == "CLEAR"){

_output = "0";
num1 = 0.0;
num2 = 0.0;
operand = "";


} else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText =="x"){

num1 = double.parse(output);

operand = buttonText;

_output = "0";

}else if(buttonText =='.'){

  if(_output.contains('.')){
    print('Already contains a decimals');
  } else {
    _output = _output + buttonText;
  }

}else if (buttonText == '='){

num2 = double.parse(output);

if(operand == '+'){
  _output = (num1 + num2).toString();
}
if(operand == '-'){
  _output = (num1 - num2).toString();
}
if(operand == 'x'){
  _output = (num1 * num2).toString();
}
if(operand == '/'){
  _output = (num1 / num2).toString();
}

num1 = 0.0;
num2 = 0.0;
operand = '';

}else {

_output = _output + buttonText;

}

print(_output);

setState(() {

output = double.parse(_output).toStringAsFixed(2);

});

}

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

Widget buildbutton(String buttonText){
return Expanded(
          child: new OutlineButton(
          padding: EdgeInsets.all(24.0),
          child: new Text(buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          )
          ),
          onPressed: ()  {
            buttonPressed(buttonText);
                      }
                    ),
                  );
            }
            
            void buttonPressed(String buttonText) {
}


  @override
  Widget build(BuildContext context) {  
    var widget;
        return new Scaffold(
          appBar: new AppBar(  
            title: Text(widget.title),  
      ),
      body: new Container(
 child: new Column(children: <Widget>[
  new Container (
    alignment: Alignment.centerRight,
    padding: new EdgeInsets.symmetric (
      vertical: 24.0,
      horizontal: 12.0,


    ),
    child: Text('0', style: new TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.bold,
  ),),),

Expanded(
  child: new Divider(),
),


          Column(children: [
          Row(children: [
          buildbutton('7'),
          buildbutton('8'),
          buildbutton('9'),
          buildbutton('/'), 
        ]),
        Row(children: [
          buildbutton('4'),
          buildbutton('5'),
          buildbutton('6'),
          buildbutton('x'), 
        ]),
        Row(children: [
          buildbutton('1'),
          buildbutton('2'),
          buildbutton('3'),
          buildbutton('-'), 
        ]),
        Row(children: [
          buildbutton('.'),
          buildbutton('0'),
          buildbutton('00'),
          buildbutton('+'), 
        ]),
        Row(children: [
          buildbutton('CLEAR'),
          buildbutton('='),
        ]),
    ],
  ),
]
))
      );    
  }
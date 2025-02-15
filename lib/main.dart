import 'package:calculator/widget/BuildBotton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(calculator());
}

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String _output = '0';
  String _input = '';
  String oparan = '0';
  double num1 = 0;
  double num2 = 0;

  void bottonPressed(String value){

    setState(() {
      if(value == "C"){

        _output = '0';
         _input = '';
          oparan = '0';
         num1 = 0;
         num2 = 0;

      }
      else if(value=="="){
        num2=double.parse(_input);
        if(oparan== "+"){
          _output =(num1+num2).toString();

        }
        else if(oparan== "-"){
          _output =(num1-num2).toString();

        }
        else if(oparan== "X"){
          _output =(num1*num2).toString();

        }
        else if(oparan== "÷"){
          _output =(num2 != 0) ? (num1/num2).toString() : "Error";

        }
        _input =_output;

      }
      else if(['+','-','X','÷',].contains(value)){
        num1=double.parse(_input);
        oparan=value;
        _input='';

      }
      else{
        _input+=value;
        _output=_input;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: true,
            backgroundColor: Colors.orange,
            title: Text(
              "Calculator",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(24),
                  child: Text(_output,
                  style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Row(
                children: [
                  BuildBotton(text: '7', onClick:()=>bottonPressed('7') ,),
                  BuildBotton(text: '8',onClick:()=>bottonPressed('8') ,),
                  BuildBotton(text: '9',onClick:()=>bottonPressed('9') ,),
                  BuildBotton(text: '÷',color: Colors.orange,onClick:()=>bottonPressed('÷') ,),
                ],
              ),
              Row(
                children: [
                  BuildBotton(text: '4',onClick:()=>bottonPressed('4') ,),
                  BuildBotton(text: '5',onClick:()=>bottonPressed('5') ,),
                  BuildBotton(text: '6',onClick:()=>bottonPressed('6') ,),
                  BuildBotton(text: 'X',color: Colors.orange,onClick:()=>bottonPressed('X') ,),
                ],
              ),
              Row(
                children: [
                  BuildBotton(text: '1',onClick:()=>bottonPressed('1') ,),
                  BuildBotton(text: '2',onClick:()=>bottonPressed('2') ,),
                  BuildBotton(text: '3',onClick:()=>bottonPressed('3') ,),
                  BuildBotton(text: '-',color: Colors.orange,onClick:()=>bottonPressed('-') ,),
                ],
              ),
              Row(
                children: [
                  BuildBotton(text: 'C',color: Colors.red,onClick:()=>bottonPressed('C') ,),
                  BuildBotton(text: '0',onClick:()=>bottonPressed('0') ,),
                  BuildBotton(text: '=',color: Colors.green,onClick:()=>bottonPressed('=') ,),
                  BuildBotton(text: '+',color: Colors.orange,onClick:()=>bottonPressed('+') ,),
                ],
              ),
            ],
          ),
        ));
  }
}



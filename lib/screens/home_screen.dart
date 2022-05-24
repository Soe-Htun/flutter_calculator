import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String output = "0";

  String _output = "0";

  double num1 = 0.0;

  double num2 = 0.0;

  String operator = "";

  buttonPressed(String buttonText) {
    print('Text->> ${buttonText} ');
    if(buttonText == "CLEAR") {
      _output = "0";

      num1 = 0.0;
      num2 = 0.0;
      operator = "";

    } else if(buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      num1 = double.parse(output);
      operator = buttonText;
      _output = "0";
    } else if(buttonText == "." ) {
      if(_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if( buttonText == "=") {
      num2 = double.parse(output);

      if(operator == "+") {
        _output = (num1 + num2).toString();
      } else if(operator == "-") {
        _output = (num1 - num2).toString();
      } else if(operator == "x") {
        _output = (num1 * num2).toString();
      } else if(operator == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operator = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlineButton(
        padding: const EdgeInsets.all(24),
        child: Text(
          buttonText,
          style: const TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.bold,
          //  color: Colors.black,
          ),
        ),
        onPressed: (){
          buttonPressed(buttonText);
        },
        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Calculator")),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: Text(
                output, 
                style: const TextStyle(
                  fontSize: 45, 
                  fontWeight: FontWeight.bold
                )
              ),
            ),

            // const Expanded(
            //   child: Divider()
            // ),

            Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x")
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: [
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("CLEAR"),
                    buildButton("=")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
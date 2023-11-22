import 'package:flutter/material.dart';

void main (){
  runApp(Calculator());
}
class Calculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "Calculator ",
      debugShowCheckedModeBanner: false,
    home: My_Calculator(),
    );
     }
}

class My_Calculator extends StatefulWidget {
  @override
  State<My_Calculator> createState() => _My_CalculatorState();
}

class _My_CalculatorState extends State<My_Calculator> {
  dynamic displaytxt = 20;

  // Button Widget
  Widget calcButton(String btnTxt, Color btnColor, Color txtColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
           calculation(btnTxt);
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: btnColor,
          padding: EdgeInsets.all(20),
        ),
        child:  Text(
          '$btnTxt',
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Calculator",style: TextStyle(color: Colors.white),),
      ),
      body:  Padding(padding: const  EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
       Padding(
         padding: const EdgeInsets.all(10.0),
          child: Text('$text',
            textAlign: TextAlign.left,
          style:
          const TextStyle(color: Colors.white,fontSize: 100))),
            ],
          )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Color.fromARGB(255, 255, 162, 0), Colors.white)]),
              const  SizedBox(height: 10),

                 Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               calcButton('7', Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('8', Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('9',Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('x', Color.fromARGB(255, 255, 162, 0), Colors.white),
                
                   ]),
               const SizedBox(height: 10),

                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               calcButton('4', Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('5', Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('6',Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('-', Color.fromARGB(255, 255, 162, 0), Colors.white),
               
                   ]),
               const  SizedBox(height: 10),

                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               calcButton('1', Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('2', Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('3',Color.fromARGB(255, 75, 75, 75), Colors.white),
                calcButton('+', Color.fromARGB(255, 255, 162, 0), Colors.white),
             
                   ]),
              const  SizedBox(height: 10),

              Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    // Button Zero
    ElevatedButton(
      onPressed: () {
            calculation('0');
      },
      style: ElevatedButton.styleFrom(
        padding:const EdgeInsets.fromLTRB(34, 20, 128, 20),
        shape:const StadiumBorder(),
        primary: Colors.grey[850],
      ),
      child: const Text(
        '0',
        style: TextStyle(fontSize: 35, color: Colors.white),
      ),
    ),
    calcButton('.', Colors.grey[850]!, Colors.white),
    calcButton('=', Colors.amber[700]!, Colors.white),
  ],
),
 const SizedBox(height: 10),

 ],
)));
}

  //Calculator logic
  
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

   void calculation(btnText) {

    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-$result';        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
    }
    return result; 
  }

}








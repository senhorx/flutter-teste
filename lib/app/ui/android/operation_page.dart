import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OperationPage extends StatefulWidget {
  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numbers = TextEditingController();
  String _message = "";
  Color _colorMessage = Colors.white;

  _calculateBinary() {
    List valueList = _numbers.text.split("\n");
    int result;
    int number1 = _tranformToInt(valueList[1]);
    int number2 = _tranformToInt(valueList[2]);

    if (number1 == null || number2 == null) {
      setState(() {
        _message = "Digite os valores em binário corretamente";
      });
      return;
    }

    if (number1 < 0 || number1 > 255 || number2 < 0 || number2 > 255) {
      setState(() {
        _message = "Valor digitado é menor que 0 ou maior que 255";
      });
      return;
    }

    switch (valueList[0]) {
      case "+":
        result = number1 + number2;
        break;
      case "-":
        result = number1 - number2;
        break;
      case "*":
        result = number1 * number2;
        break;
      case "/":
        result = int.parse((number1 / number2).toString());
        break;
      case "%":
        result = number1 % number2;
        break;
    }

    String resultText = result.toRadixString(2);
    String auxText = "";
    while (auxText.length < (8 - resultText.length)) {
      auxText += "0";
    }
    resultText = auxText + resultText;

    setState(() {
      _message = "Resultado: " + resultText;
    });
  }

  _tranformToInt(value) {
    try {
      return int.parse(value, radix: 2);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Problema de Operação",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "A primeira linha é o símbolo do operação",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "A segunda e terceira são os valores em binário",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "(Obs: Deve ser maior que -1 e menos que 256)",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _numbers,
                    style: TextStyle(fontSize: 20),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Campo obrigatório";
                      }
                      return null;
                    },
                    maxLines: 3,
                    decoration: InputDecoration.collapsed(
                        hintText: "Insira os valores aqui...",
                        hintStyle: TextStyle(fontSize: 18)),
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _calculateBinary();
                  }
                },
                child: Text(
                  "Calcular Conjunto",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
                color: Colors.white,
                elevation: 5,
                highlightElevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Voltar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                ),
                color: Colors.white,
                elevation: 5,
                highlightElevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.center,
              child: Text(
                _message,
                style: TextStyle(
                    fontSize: 25,
                    color: _colorMessage,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    );
  }
}

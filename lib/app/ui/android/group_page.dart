import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numbers = TextEditingController();
  String _message = "";
  Color _colorMessage = Colors.white;
  List<int> _listNumber = null;

  _calculaConjunto() {
    List numbersList = _numbers.text.split("\n");
    List<int> listNumbers = List<int>();

    for (var i = 0; i < numbersList.length; i++) {
      if (!isNumeric(numbersList[i])) {
        setState(() {
          _message = "Letra é número agora?";
        });
        return;
      } else {
        listNumbers.add(int.parse(numbersList[i]));
      }
    }

    if (numbersList[0].toString() != (numbersList.length - 1).toString()) {
      setState(() {
        _message = "Quantidade de números diferente do digitado";
      });
      return;
    }
    listNumbers.removeAt(0);
    List<int> distinctNumbers = listNumbers.toSet().toList();

    distinctNumbers.sort((a, b) => a.compareTo(b));

    print(distinctNumbers);

    setState(() {
      _message = "";
      _listNumber = distinctNumbers;
    });
    print(_listNumber);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultado da Lista"),
          content: Container(
            height: 300,
            width: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _listNumber.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${_listNumber[index]}'),
                );
              },
            ),
          ),
          actions: [
            FlatButton(
              child: Text("Okay"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
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
                "Problema dos Conjuntos",
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
                "Insiria quantos números quiser de 1 até 1000. A primeira linha " +
                    "é a quantidade de números, as demais são seus valores. (Obs: Um numero por linha)",
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
                    maxLines: 8,
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
                    _calculaConjunto();
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_app/app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            child: Container(color: Get.theme.primaryColor.withOpacity(0.8)),
            clipper: LinePathClass(),
          ),
          Positioned(
            width: Get.width,
            top: Get.height / 10,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Bem vindo ao meu teste!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/eu.jpg'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Nome: Christian Carvalho de Sousa",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Profissão: Desenvolvedor Full Stack",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Estado Civil: Cai no golpe",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Escolha um dos problemas:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: 350,
                  onPressed: () {
                    Get.toNamed(Routes.GROUP);
                  },
                  child: Text(
                    "Problema dos Conjuntos",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.green,
                  elevation: 5,
                  highlightElevation: 2,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: 350,
                  onPressed: () {
                    Get.toNamed(Routes.OPERATION);
                  },
                  child: Text(
                    "Problema da Operação",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: Colors.green,
                  elevation: 5,
                  highlightElevation: 2,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LinePathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, 250);
    path.lineTo(250, 0);
    path.lineTo(size.width - 500, size.height - 500);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

import 'package:flutter/material.dart';

class JokenPo extends StatefulWidget {
  @override
  _JokenPoState createState() => _JokenPoState();
}

class _JokenPoState extends State<JokenPo> {
  String _result_message = "Selecione uma jogada para começar";
  String _computer_choice_image = "images/padrao.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPO"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Text("Jogada do computador: "),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    child: Image(image: AssetImage(_computer_choice_image)),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              Text(_result_message),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    child: Image(image: AssetImage("images/papel.png")),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    child: Image(image: AssetImage("images/pedra.png")),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    child: Image(image: AssetImage("images/tesoura.png")),
                  ),
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

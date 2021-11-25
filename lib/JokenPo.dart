import 'package:flutter/material.dart';

class JokenPo extends StatefulWidget {
  @override
  _JokenPoState createState() => _JokenPoState();
}

class _JokenPoState extends State<JokenPo> {
  String _result_message = "Selecione uma jogada para começar";
  String _computer_choice_image = "images/padrao.png";
  double _jokenpo_image_size = 72;
  var screen_width;
  var screen_height;

  int _jokenpo_image_scaling_factor = 32;

  @override
  Widget build(BuildContext context) {
    screen_width = MediaQuery.of(context).size.width;
    screen_height = MediaQuery.of(context).size.height;

    _jokenpo_image_size = ((screen_height > screen_width)
        ? ((screen_height - screen_width) * _jokenpo_image_scaling_factor) / 100
        : ((screen_width - screen_height) * _jokenpo_image_scaling_factor) /
            100);

    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPO"),
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  Text("Jogada do computador: "),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image(
                        image: AssetImage(_computer_choice_image),
                        width: _jokenpo_image_size,
                      ),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            Text(_result_message),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Papel"),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: Image(
                      image: AssetImage("images/papel.png"),
                      width: _jokenpo_image_size,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Pedra"),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: Image(
                      image: AssetImage("images/pedra.png"),
                      width: _jokenpo_image_size,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Tesoura"),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: Image(
                      image: AssetImage("images/tesoura.png"),
                      width: _jokenpo_image_size,
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      )),
    );
  }
}

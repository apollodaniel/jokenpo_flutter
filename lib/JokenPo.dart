import 'dart:math';

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
                      onTap: () {
                        setState(() {
                          _computer_choice_image = "images/padrao.png";
                        });
                      },
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
                      Resultado resultado = Calcula_Resultado(JokenPO.PAPEL);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(resultado._resultado),
                        duration: Duration(seconds: 3),
                      ));
                      setState(() {
                        _computer_choice_image = resultado._resultado_imagem;
                      });
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
                      Resultado resultado = Calcula_Resultado(JokenPO.PEDRA);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(resultado._resultado),
                        duration: Duration(seconds: 3),
                      ));
                      setState(() {
                        _computer_choice_image = resultado._resultado_imagem;
                      });
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
                      Resultado resultado = Calcula_Resultado(JokenPO.TESOURA);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(resultado._resultado),
                        duration: Duration(seconds: 3),
                      ));
                      setState(() {
                        _computer_choice_image = resultado._resultado_imagem;
                      });
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

  Resultado Calcula_Resultado(String resultado) {
    List<String> resultados_possiveis = [
      JokenPO.TESOURA,
      JokenPO.PEDRA,
      JokenPO.PAPEL
    ];
    String resultado_computador =
        resultados_possiveis[Random().nextInt(resultados_possiveis.length)];
    if(resultado == JokenPO.TESOURA && resultado_computador == JokenPO.PAPEL){
      return Resultado(
          "images/$resultado_computador.png", "Você ganhou!");
    }else if(resultado == JokenPO.PAPEL && resultado_computador == JokenPO.PEDRA){
      return Resultado(
          "images/$resultado_computador.png", "Você ganhou!");
    }
    else if(resultado == JokenPO.PEDRA && resultado_computador == JokenPO.TESOURA){
      return Resultado(
          "images/$resultado_computador.png", "Você ganhou!");
    }
    else{
      return Resultado(
          "images/$resultado_computador.png", "Você perdeu!");
    }
  }
}

class JokenPO {
  static String PEDRA = "pedra";
  static String PAPEL = "papel";
  static String TESOURA = "tesoura";
}

class Resultado {
  String _resultado_imagem;
  String _resultado;

  Resultado(this._resultado_imagem, this._resultado);

  String get resultado => _resultado;

  set resultado(String value) {
    _resultado = value;
  }

  String get resultado_imagem => _resultado_imagem;

  set resultado_imagem(String value) {
    _resultado_imagem = value;
  }
}

import 'package:calculo_imc_flutter/result_Show.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void calculate() {
    double peso = double.parse(widget.pesoController.text);
    double altura = double.parse(widget.alturaController.text);
    String message = "Aguardando cálculo";
    double imc = (peso / (altura * altura));
    //setState altera o valor do estado, isso faz com que se torne dirty e reconstrua o build

    message = switch (imc){
      < 18.5 => "Resultado: Magreza",
      < 24.9 => "Resultado: Normal",
      < 29.9 => "Resultado: Sobrepeso",
      < 34.9 => "Resultado: Obesidade grau I",
      < 39.9 => "Resultado: Obesidade grau II",
      _ => "Resultado: Obesidade grau III"
    };

    Navigator.pushNamed(
        context,
        "/result",
        arguments: message); //https://docs.flutter.dev/cookbook/navigation/navigation-basics
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Cálculo de IMC"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: widget.pesoController,
              decoration: InputDecoration(
                labelText: 'Insira seu peso',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: widget.alturaController,
              decoration: InputDecoration(
                labelText: 'Insira sua altura',
                border: OutlineInputBorder(),
              ),
            ),
            OutlinedButton(
              onPressed: calculate,
              child: Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }
}

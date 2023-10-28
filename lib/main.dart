import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de moneda',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home:  const MyHomePage(title: 'CONVERSOR DE MONEDA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum ChangeMoney { dolar, euro, libra }

class _MyHomePageState extends State<MyHomePage> {
  final _change = TextEditingController();

  double _total = 0;
  String _totalRound = '';
  final _changeDolar = 4119.28;
  final _changeEuro = 4353.06;
  final _changeLibra = 4993.25;
  String _message = '';

  void _calculeChange(Enum changeMoney) {
    setState(() {
      switch (changeMoney) {
        case ChangeMoney.dolar:
          _total = double.parse(_change.text) / _changeDolar;
          _totalRound = _total.toStringAsFixed(3);
          if(_total > 1){
            _message = 'Equivalen a $_totalRound dolares';
          }else{
            _message = 'Equivalen a $_total dolar';
          }
          break;
        case ChangeMoney.euro:
          _total = double.parse(_change.text) / _changeEuro;
          _totalRound = _total.toStringAsFixed(3);
          if(_total > 1){
            _message = 'Equivalen a $_totalRound euros';
          }else{
            _message = 'Equivalen a $_total euro';
          }
          break;
        case ChangeMoney.libra:
          _total = double.parse(_change.text) / _changeLibra;
          _totalRound = _total.toStringAsFixed(3);
          if(_total > 1){
            _message = 'Equivalen a $_totalRound libras esterlinas';
          }else{
            _message = 'Equivalen a $_total libra esterlina';
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(240, 255, 217, 226),
          image: DecorationImage(image: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaJ0Xi9vN3NS7PbtPWPmzil72AUy2GZk59qw&usqp=CAU'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Bienvenid@ a la tu aplicación de cambio, ingresa el valor en COP:\n\n USD: dolar\n EUR: euro\n GBP: libra esterlina',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
                    )),
                const SizedBox(
                  height: 64.0,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                  controller: _change,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite el valor a convertir:',
                      labelStyle: TextStyle(color:Colors.purple, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            _calculeChange(ChangeMoney.dolar);
                          },
                          child: const Text('USD',
                            style: TextStyle(fontWeight: FontWeight.bold),)),
                      const SizedBox(
                        width: 16.0,
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            _calculeChange(ChangeMoney.euro);
                          },
                          child: const Text('EUR',
                            style: TextStyle(fontWeight: FontWeight.bold),)),
                      const SizedBox(
                        width: 16.0,
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            _calculeChange(ChangeMoney.libra);
                          },
                          child: const Text('GBP',
                            style: TextStyle(fontWeight: FontWeight.bold),)),
                      const SizedBox(
                        width: 16.0,
                      ),
                    ]),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  _message,
                  style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
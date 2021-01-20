import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opowiedz historię',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Italianno'
      ),
      home: MyHomePage(title: 'Opowiedz historię'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _answer = 'Opowiedz historię';
  String _hero = '';
  final _random = new Random();
  static const color = const Color(0xFF2ca1c5);
  Image _diceA = Image.asset('graphics/question.png',
    fit: BoxFit.fitHeight,);
  Image _diceB = Image.asset('graphics/question.png',
    fit: BoxFit.fitHeight,);
  Image _diceC = Image.asset('graphics/question.png',
    fit: BoxFit.fitHeight,);


  void _setHero() {
    setState(() {
      int r = 0 + _random.nextInt(10);
      switch(r){
        case 0:
          _answer = 'Utalentowany malarz';
          _hero = 'Bohater historii';
          break;
        case 1:
          _answer = 'Pracowity stolarz';
          _hero = 'Bohater historii';
          break;
        case 2:
          _answer = 'Zaspany informatyk';
          _hero = 'Bohater historii';
          break;
        case 3:
          _answer = 'Doświadczony lekarz';
          _hero = 'Bohater historii';
          break;
        case 4:
          _answer = 'Zasłuchany sprzątacz';
          _hero = 'Bohater historii';
          break;
        case 5:
          _answer = 'Opiekuńca pielęgniarka';
          _hero = 'Bohaterka historii';
          break;
        case 6:
          _answer = 'Zamyślona dyrektorka';
          _hero = 'Bohaterka historii';
          break;
        case 7:
          _answer = 'Prześliczna baletnica';
          _hero = 'Bohaterka historii';
          break;
        case 8:
          _answer = 'Młoda skrzypaczka';
          _hero = 'Bohaterka historii';
          break;
        case 9:
          _answer = 'Dzielna niewiasta';
          _hero = 'Bohaterka historii';
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        _setHero();
        _diceA = setDiceImage('a');
        _diceB = setDiceImage('b');
        _diceC = setDiceImage('c');
      });
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  Image setDiceImage(String name){
    int r = 1 + _random.nextInt(6);
    return  Image.asset('graphics/'+ name + r.toString() +'.png',
      fit: BoxFit.fitHeight,);
  }

  void changeImages(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_hero',
              style: TextStyle(fontFamily: 'Marcellus'),
            ),
            Text(
              '$_answer',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: _diceA,
                ),
                Expanded(
                  child: _diceB,
                ),
                Expanded(
                  child: _diceC,
                ),],
            )
          ],
        ),
      ),
    );
  }
}

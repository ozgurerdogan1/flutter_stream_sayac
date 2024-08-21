import 'package:flutter/material.dart';
import 'package:flutter_stream_sayac/sayac_view_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("myapp build calıstı");
    return MaterialApp(
      title: 'Material App',
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  SayacViewModel sayacViewModel = SayacViewModel();

  @override
  Widget build(BuildContext context) {
    print("counter widget build calıstı");
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          initialData: sayacViewModel.init(),
          stream: sayacViewModel.sayacStream,
          builder: (context, snapshot) => Text(
            "Stream Builder Kullanimi:" + (snapshot.hasData ? snapshot.data.toString() : "null"),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sayac değeri',
              style: Theme.of(context).textTheme.headline3,
            ),
            StreamBuilder(
              initialData: sayacViewModel.init(),
              stream: sayacViewModel.sayacStream,
              builder: (context, snapshot) {
                return Text(
                  snapshot.hasData ? snapshot.data.toString() : "null",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Text("+", style: TextStyle(fontSize: 24)),
              onPressed: () {
                sayacViewModel.arttir();
              }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              child: const Text("-", style: TextStyle(fontSize: 24)),
              onPressed: () {
                sayacViewModel.azalt();
              }),
        ],
      ),
    );
  }
}

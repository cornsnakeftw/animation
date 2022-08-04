import 'package:flutter/material.dart';
import 'explicite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: const ExpliciteAnimation(),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => selected = !selected);
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          alignment: Alignment.center,
          duration: const Duration(seconds: 1),
          color: Colors.amber,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}

class TweenWidget extends StatefulWidget {
  const TweenWidget({Key? key}) : super(key: key);

  @override
  State<TweenWidget> createState() => _TweenWidgetState();
}

class _TweenWidgetState extends State<TweenWidget> {
  @override
  Widget build(BuildContext context) {
    final colorTween = ColorTween(begin: Colors.blue, end: Colors.orange);
    return Center(
      child: TweenAnimationBuilder(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 120, vertical: 260),
            color: Colors.white,
          ),
          duration: const Duration(seconds: 10),
          tween: colorTween,
          builder: (BuildContext context, Color? value, Widget? child) {
            return ColorFiltered(
              child: child,
              colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
            );
          }),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*    onGenerateRoute: (settings) {
        if (settings.name == "/second") {
          final arg=settings.arguments;
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) {
              return SecondPage(title: arg,);
            },
            transitionDuration: Duration(seconds: 3),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        }
      },*/
      initialRoute: "/first",
      routes: {
        '/first': (context) => MyHomePage(title: "first"),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            height: 100,
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.green,
              ),
            ),
          ),
          Wrap(
            //instead of row..we put wrap for flexibale content
            spacing: 10,
            children: [
              Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                  ),
                  label: Text("one")),
              Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                  ),
                  label: Text("two")),
              Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                  ),
                  label: Text("three")),
              Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                  ),
                  label: Text("four")),
              Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                  ),
                  label: Text("five")),
              Chip(
                  avatar: CircleAvatar(
                    child: Text("A"),
                  ),
                  label: Text("six")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second",
                    arguments: "named second");
              },
              child: Text("Named route")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SecondPage(
                            title: "second page",
                          );
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                        transitionDuration: Duration(seconds: 2))

                    //   CupertinoPageRoute(builder: (context) => SecondPage()));
                    //  MaterialPageRoute(builder: (context) => SecondPage()));

                    );
              },
              child: Text("Second page"))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final title;

  const SecondPage({Key? key, this.title = "default"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.blue,
      // appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
           // Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(context, "/third", ModalRoute.withName("/first"));
          },
          child: Text(
            "Click me! $arg",
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}

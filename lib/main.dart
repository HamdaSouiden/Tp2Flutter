import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      home: const MyHomePage(title: 'To-Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> names = [];
  TextEditingController controller = TextEditingController();
  addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        names.add(controller.text);
        controller.clear();
      });
    }
  }

  removeTask(int index) {
    setState(() {
      names.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: "Enter Task",
                  border: OutlineInputBorder(),
                )),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      title: Text(names[index]),
                      onLongPress: () {
                        removeTask(index);
                      },
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

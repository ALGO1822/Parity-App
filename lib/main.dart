import 'package:flutter/material.dart';
import 'package:practice_app/grader.dart';
import 'package:practice_app/square_metrics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: Text('Parity App')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Widget? title;
  const MyHomePage({super.key, this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myFocusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  String valueStatus = '';

  String getStatus(String input) {
    final number = int.tryParse(input);
    if (number == null) return 'Wrong Input';
    return number.isEven ? 'Is Even' : 'Is Odd';
  }

  void checkStatus() {
    final text = _controller.text.trim();
    myFocusNode.unfocus();
    if (text.isEmpty) return;
    setState(() {
      valueStatus = getStatus(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.title),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.build_circle_sharp,
                    color: Colors.deepPurple,
                    size: 35,
                  ),
                  Text(
                    'Tools',
                    style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    focusColor: Colors.deepPurple,
                    hoverColor: Colors.purpleAccent.withValues(alpha: .04),
                    tileColor: Colors.purpleAccent.withValues(alpha: 0.2),
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.square_foot_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Square metrics',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(7),
                      side: BorderSide(
                        color: Colors.purple.withValues(alpha: 0.4),
                        width: 2.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              SquareMetrics(title: Text('Square Matrics')),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    focusColor: Colors.deepPurple,
                    hoverColor: Colors.purpleAccent.withValues(alpha: .04),
                    tileColor: Colors.purpleAccent.withValues(alpha: 0.2),
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.grading,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Grade Checker',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(7),
                      side: BorderSide(
                        color: Colors.purple.withValues(alpha: 0.4),
                        width: 2.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GradeChecker(title: Text('Grade Checker')),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  focusNode: myFocusNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input your number',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(5),
                        ),
                      ),
                      onPressed: checkStatus,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Submit'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      valueStatus,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

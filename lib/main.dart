import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: SingleChildScrollView(
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

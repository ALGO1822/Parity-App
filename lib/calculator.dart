import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  final Widget? title;
  const Calculator({super.key, this.title});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final myFocusNode = FocusNode();
  final TextEditingController _vcontroller = TextEditingController();
  int answer = 0;
  void solve() {
    final text = _vcontroller.text;
    final number = int.tryParse(text);
    setState(() {
      answer = number! * number;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widget.title),
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
                  controller: _vcontroller,
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
                      onPressed: solve,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Submit'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      answer.toString(),
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

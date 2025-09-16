import 'package:flutter/material.dart';
import 'package:practice_app/main.dart';

class SquareMetrics extends StatefulWidget {
  final Widget? title;
  const SquareMetrics({super.key, this.title});

  @override
  State<SquareMetrics> createState() => _SquareMetricsState();
}

class _SquareMetricsState extends State<SquareMetrics> {
  final myFocusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  String valueStatus = '';

  int? parseInt(String input) => int.tryParse(input);

  String getArea(String input) {
    final number = parseInt(input);
    if (number == null) return 'Wrong Input';
    return (number * number).toString();
  }

  String getPerimeter(String input) {
    final number = parseInt(input);
    if(number == null) return 'Wrong Input';
    return (number * 4).toString();
  }

  void checkStatus() {
    final text = _controller.text.trim();
    myFocusNode.unfocus();
    if (text.isEmpty) return;
    setState(() {
      valueStatus = 'Area = ${getArea(text)}, Perimeter = ${getPerimeter(text)}';
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
              child: ListTile(
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
                            Icons.compare_arrows,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Parity app',
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage(title: Text('Parity App'),)));
                },
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

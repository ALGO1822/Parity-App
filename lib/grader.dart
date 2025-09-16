import 'package:flutter/material.dart';
import 'package:practice_app/main.dart';
import 'package:practice_app/square_metrics.dart';

class GradeChecker extends StatefulWidget {
  final Widget? title;
  const GradeChecker({super.key, this.title});

  @override
  State<GradeChecker> createState() => _GradeCheckerState();
}

class _GradeCheckerState extends State<GradeChecker> {
  final myFocusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  String valueStatus = '';

  int? parseInt(String input) => int.tryParse(input);

  String getScore(String input) {
    if (input.isEmpty) return 'Input something';
    final number = parseInt(input);
    if (number == null) return 'Invalid Input';
    final score = number ~/ 10;
    switch (score) {
      case 10:
      case 9:
        return 'A';
      case 8:
        return 'B';
      case 7:
        return 'C';
      case 6:
        return 'D';
      case 5:
        return 'E';
      default:
        return 'F';
    }
  }

  void checkStatus() {
    final text = _controller.text.trim();
    myFocusNode.unfocus();
    setState(() {
      valueStatus = getScore(text);
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
                          builder: (_) => MyHomePage(title: Text('Parity App')),
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: valueStatus == 'A'
                            ? Colors.lightGreen
                            : valueStatus == 'B'
                            ? Colors.lightBlue
                            : valueStatus == 'C'
                            ? Colors.amber
                            : valueStatus == 'D'
                            ? Colors.brown
                            : valueStatus == 'Input something'
                            ? Colors.grey
                            : Colors.red,
                      ),
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

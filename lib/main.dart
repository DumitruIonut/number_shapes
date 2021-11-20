import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:powers/powers.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController controller = TextEditingController();
  int? tstNumber;
  String? infoNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Number Shapes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                SizedBox(
                  width: 350,
                  child: Text(
                    'Please input a number to see if it is squared or cubed root.',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                ),
                onChanged: (String? value) {
                  setState(() {
                    if (int.parse(value!) is int) {
                      tstNumber = int.parse(value);
                    }
                  });
                },
              ),
            ),
            Container(
              height: 5.0,
              width: 400,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          if (controller.text.isEmpty) {
            tstNumber = null;
            infoNumber = null;
          }
          setState(() {
            if (tstNumber!.isSquare && tstNumber!.isCube) {
              infoNumber = 'Number $tstNumber is both SQUARE and CUBED ROOT';
            } else if (tstNumber!.isSquare) {
              infoNumber = 'Number $tstNumber is SQUARE';
            } else if (tstNumber!.isCube) {
              infoNumber = 'Number $tstNumber is CUBED ROOT';
            } else {
              infoNumber = 'Number $tstNumber is neither SQUARE and CUBED ROOT';
            }
          });
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('$tstNumber'),
              content: Text('$infoNumber'),
            ),
          );
          controller.clear();
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled1/home.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Congratulations",
            style: TextStyle(
              color: Colors.blue[50],
                fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20),
            Text("Your score is:",
              style: TextStyle(
                color: Colors.blue[50],
                fontSize: 35,
                fontWeight: FontWeight.w400,

              ),
            ),
            SizedBox(height: 50),

            Text(
              "${
              widget.score
              }",
              style: TextStyle(
                color: Colors.pink[200],
                fontSize: 85,
                fontWeight: FontWeight.bold,

              ),
            ),

            SizedBox(height: 50),

            MaterialButton(
              shape: StadiumBorder(),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            },
              color: Colors.pink[100],
              textColor: Colors.black
              ,
              child: Text("Take the quiz again"),
            )
          ],
        ),
      ) ,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled1/quiz.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text(
           "QuizApp",
           style: TextStyle(
             color: Colors.black,
           ),
         ),
   backgroundColor: Colors.blue[100],
       ),
      drawer: Drawer(

        backgroundColor: Colors.blue[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Quizes available ',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "Lato",
                color: Colors.white
              ),),
              decoration: BoxDecoration(
                color: Colors.indigo[500],
              ),

            ),
            ListTile(
              title: Text('Quiz 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Quiz 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),



      backgroundColor: Colors.indigo[900],
      body: Padding(
        padding: const EdgeInsets.only(left:50,right: 50,top: 30),
        child: Column(

          children: < Widget>[

            CircleAvatar(radius: (150),
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(200),
                  child: Image.asset("images/quizapp.png"),
                )
            ),
            SizedBox(height: 30,),

            Container(
              padding: EdgeInsets.all(8),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                BoxShadow(
                  color: Colors.black,
                blurRadius: 20.0,
              ),
                ],
              ),
              child: Text(
                "Instructions: \n * This quiz is based on aptitude  \n * The quiz will end with the timer",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Lato",
                ),
              ),
            ),
            SizedBox(height: 30,),

            InkWell(

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Quiz(),
                  ),
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.pink[100],
                ),
                height: 60,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,top: 15,bottom: 15,right: 15),
                  child: Text(
                    "Tap to start the quiz",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Lato",
                    ),
                  ),
                ),

              ),
            ),
          ],


        ),
      ),








    );
  }
}

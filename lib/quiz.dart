

import 'package:flutter/material.dart';
import 'package:untitled1/questions.dart';
import 'package:untitled1/screens/result.dart';
import 'package:untitled1/timer.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  PageController? _controller= PageController(initialPage: 0);
  //game variable
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFFBBDEFB);
  Color secondcolor = Color(0xFFBBDEFB);
  int score=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CountDownTimer(secondsRemaining: 300, whenTimeExpires: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(score)));
            },),
          ),

        ],
        title: const Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'QUIZ',
          ),
        ),
      ),
       body: Padding(
         padding:const  EdgeInsets.all(10.0),
         child: PageView.builder(
           physics: const NeverScrollableScrollPhysics(),
           controller: _controller!,
             onPageChanged: (page){
             setState(() {
               isPressed=false;
             });
             },

             itemCount: questions.length,
             itemBuilder: (context,index){
               return Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Question ${index+1} /${questions.length}",
                   style:const  TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.w300,
                     fontSize: 28,
                   ),
                   ),
                  const Divider(
                     color: Colors.white,
                     height: 8,
                     thickness: 1,
                   ),
                   const SizedBox(
                     height: 50,
                   ),
                   Text(
                     questions[index].question!,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 30,
                   ),
                   ),
                   //button list
                   SizedBox(
                     height: 35,
                   ),
                   for(int i=0; i<questions[index].answer!.length; i++)
                     Container(
                       width: double.infinity,
                       margin: EdgeInsets.only(bottom: 18),
                       child: MaterialButton(
                         shape: StadiumBorder(),
                         color: isPressed ? questions[index].answer!.entries.toList()[i].value
                             ? isTrue
                             : isWrong
                            : secondcolor,
                         padding: EdgeInsets.symmetric(vertical: 18),
                         onPressed: isPressed?
                         () {}
               :() {
                           setState(() {
                             isPressed=true;
                           });
               if(questions[index]
                   .answer!
                   .entries
                   .toList()[i]
                   .value){
                      score+=1;
                      print(score);

               }

                         },
                         child: Text(questions[index].answer!.keys.toList()[i]),),
                     ),
                  const SizedBox(
                     height: 50,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       OutlinedButton(
                         onPressed: isPressed
               ? index+1 == questions.length
               ?() {
                           Navigator.push
                           (context,
                           MaterialPageRoute(
                           builder: (context)=>
               ResultScreen(score)));
               }
               : () {
               _controller!.nextPage(
               duration: Duration(milliseconds: 500),
               curve: Curves.linear);
               setState(() {
                 isPressed = false;

               });

               }
               : null,


                         style: OutlinedButton.styleFrom(
                           shape: StadiumBorder(),
                          side: BorderSide(color: Colors.white, width: 2),

                         ),
                         child: Text(
                           index+1 == questions.length
                            ? "See result"
                            :"Next Question",

                       style: TextStyle(
                         color: Colors.white,
                       ),
                         ),
                       ),
                     ],
                   ),
                 ],
               );
             },
           ),
       )
    );
  }

}


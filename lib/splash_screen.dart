import 'package:bhagvatgeeta/main.dart';
import 'package:flutter/material.dart';


class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/k4.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text('A digital music, podcast, and video service that gives you access to millions of songs and other content from creators all over the world.',
            //   style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600, ),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 32,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
              height: 58,
              color: Colors.orange,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyHomePage())),
              child: const Text('Get Started', style: TextStyle(color: Colors.black, fontSize: 18),) ,
            ),
            const SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}

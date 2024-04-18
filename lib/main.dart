import 'package:bhagvatgeeta/modelclass.dart';
import 'package:bhagvatgeeta/splash_screen.dart';
import 'package:bhagvatgeeta/verse_details.dart';
import 'package:flutter/material.dart';

import 'adhyay_list.dart';

bool isTheme = false;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetStartedPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('hello'),
        //   actions: [
        //     Switch(value:isTheme,onChanged: (value){
        //       setState(() {
        //         isTheme = value;
        //       });
        //     },),
        //   ],
        // ),
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/d1.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 270,
              // width: 120,
              decoration:
                  BoxDecoration(color: Colors.brown, shape: BoxShape.circle),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  
                  InkWell(onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verse_list(islan: true),));
                  },child: Text('Hindi',style: TextStyle(color: Colors.yellowAccent.shade700,fontSize: 35,fontWeight: FontWeight.bold),)),
                  Divider(height: 3,color: Colors.yellowAccent.shade700,endIndent: 50,indent: 50),
                  InkWell(onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verse_list(islan: false),));
                  } ,child: Text('English',style: TextStyle(color: Colors.yellowAccent.shade700,fontSize: 35,fontWeight: FontWeight.bold),))
                ]),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //   ],
              // ),
            ),
          ],
        ),
      ),
    )

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
        );
  }
}

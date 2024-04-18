import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'modelclass.dart';

class bookmarkScreen extends StatefulWidget {
  const bookmarkScreen({super.key});

  @override
  State<bookmarkScreen> createState() => _bookmarkScreenState();
}

class _bookmarkScreenState extends State<bookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    // var provider = Provider.of<JsonProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 28,
              color: Colors.white,
            )),
        title: Text("Bookmarks",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.orangeAccent.shade700,
      ),
      // backgroundColor: Colors.brown.shade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: hight,
              width: width,
              child: ListView.builder(
                itemCount: bookmarkList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            // image: DecorationImage(image: AssetImage('assets/images/b2.jpg'),fit: BoxFit.fill),
                              color: Colors.orangeAccent.shade100,
                              border: Border.all(
                                  color: Colors.brown.shade800, width: 3),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(60),
                                  bottomLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(0)
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(
                                height: 60,
                                width: 50,
                                child: Image.asset('assets/images/s1.png'),
                              ),
                              // Text(
                              //     'Verse : ${widget.verseList[index].verseId.toString()}',
                              //     style: TextStyle(
                              //         fontSize: 16,
                              //         color: Colors.brown.shade800)),

                              Divider(
                                color: Colors.brown,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text( bookmarkList[index].verses!,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown.shade800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.brown.shade800,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),

                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade700,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), ),
                                ),
                                child: IconButton(
                                    icon: Icon(Icons.close,size: 30,color: Colors.orangeAccent,),
                                onPressed: (){
                                  bookmarkList.removeAt(index);
                                },),
                              )
                            ],
                          ),

                        ),
                      ),
                      Container(
                          child: Image.asset('assets/images/div2.png',fit: BoxFit.fill,)),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

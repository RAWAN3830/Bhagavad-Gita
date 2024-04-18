import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_it/share_it.dart';
import 'bookmark_screen.dart';
import 'controller.dart';
import 'modelclass.dart';

class Verse_details extends StatefulWidget {
  final List<Verse> verseList;
  final String? chp_name;
  final bool language;
  const Verse_details(
      {super.key,
      required this.verseList,
      required this.chp_name,
      required this.language});

  @override
  State<Verse_details> createState() => _Verse_detailsState();
}

class _Verse_detailsState extends State<Verse_details> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
   //  var provider = Provider.of<jsonProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>bookmarkScreen()));
          }, icon:Icon(Icons.bookmark_add,color: Colors.white,size: 30,))
        ],
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
        title: Text(
          widget.chp_name!,
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
                itemCount: widget.verseList.length,
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
                              Text(
                                  'Verse : ${widget.verseList[index].verseId.toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.brown.shade800)),

                              Divider(
                                color: Colors.brown,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.verseList[index].verse,
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: (widget.language == true)
                                    ? Text(
                                        widget.verseList[index].commentaryHn,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.brown.shade800),
                                      )
                                    : Text(
                                        widget.verseList[index].commentaryEg,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.brown.shade800),
                                      ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade700,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(icon:Icon(Icons.share,color: Colors.orange.shade100),onPressed: () {
                                      ShareIt.text(content: widget.verseList[index].verse);
                                    }
                                    ),
                                    IconButton(icon:Icon(CupertinoIcons.bookmark_fill,color: Colors.orange.shade100),
                                      onPressed: () {
                                        bookmarkList.add(bookmark(verses:widget.verseList[index].verse));
                                      setState(() {
                                        print(bookmarkList[index]);
                                        SnackBar(width: 30,content: Text("Add To Bookmark"),);
                                      });
                                      },)
                                  ],
                                ),
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

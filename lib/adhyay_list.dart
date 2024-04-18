
import 'package:bhagvatgeeta/main.dart';
import 'package:bhagvatgeeta/modelclass.dart';
import 'package:bhagvatgeeta/verse_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_repo.dart';

class Verse_list extends StatefulWidget {
  final bool islan;
  const Verse_list({super.key, required this.islan});

  @override
  State<Verse_list> createState() => _Verse_listState();
}

class _Verse_listState extends State<Verse_list> {
  bool isload = false;
  @override
  void initState() {
    setState(() {
      isload = true;
    });
    // TODO: implement initState
    ApiRepo().loadJsonData().then((value)
    {
      setState(() {
        isload = false;
      });
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var hight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,

            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  size: 28,
                  color: Colors.white,
                )),
            title: Text('BHAGAVAD GITA',style:TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold)),
          backgroundColor:Colors.orange
        ),
        body: (isload == true)
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(
          children: [
              Container(
                height: hight,
                width: width,
                decoration: BoxDecoration(color: Colors.orangeAccent.shade100),
                child: ListView.builder(
                  itemCount: postlist.length,
                    itemBuilder: (context, index) {


                      return InkWell(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Verse_details(
                            verseList: postlist[index].verses ,
                            chp_name: (widget.islan == true) ?
                            postlist[index].chapter_name_hn : postlist[index].chapter_name_eg,
                            language: widget.islan)));
                      },
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                (widget.islan == true)?
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                         height: 60,

                                         decoration: BoxDecoration(
                                         color: Colors.orangeAccent,borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.brown,width: 3,)),
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(postlist[index].chapter_name_hn, style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.brown.shade700,
                                              fontWeight: FontWeight.bold
                                          ),
                                          ),
                                        ),
                                      ),
                                    )
                                    :
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      Text(postlist[index].chapter_name_eg, style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.brown,
                                          fontWeight: FontWeight.bold
                                      ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height:80,
                                child: Image.asset('assets/images/div3.png',fit: BoxFit.fitWidth,))
                            // Divider(height: 1,color: Colors.brown.shade700,thickness: 2,endIndent: 8,indent: 8,)
                          ],
                        ),
                      );
                    },),
              )
          ],
        ),
            ));
  }
}

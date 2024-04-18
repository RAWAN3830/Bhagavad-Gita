import 'package:flutter/cupertino.dart';
import 'verse_details.dart';
import 'modelclass.dart';

class jsonProvider with ChangeNotifier{
  bool? istheme = false;


  addbookmark(String vers){
    bookmarkList.add(bookmark(verses: vers));
    notifyListeners();
  }

  removebookmark(index)
  {
    bookmarkList.removeAt(index);
    notifyListeners();
  }
}
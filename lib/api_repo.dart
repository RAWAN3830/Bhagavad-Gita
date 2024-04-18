import 'dart:convert';

import 'package:bhagvatgeeta/modelclass.dart';
import 'package:flutter/services.dart';

class ApiRepo{

  Future loadJsonData() async{
    var data = await rootBundle.loadString('assets/data.json');
    print(data);
    var d = jsonDecode(data);

    for(var e in d){
      postlist.add(BhagavatGeeta.fromJson(e));

    }
  }
}
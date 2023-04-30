import 'package:flutter/material.dart';
import 'package:test_project/api_service/api_service.dart';
import 'package:test_project/model/university_info_model.dart';
import 'dart:developer' as d;

class UniversityListPage extends StatefulWidget {
  const UniversityListPage({Key? key}) : super(key: key);

  @override
  State<UniversityListPage> createState() => _UniversityListPageState();
}
class _UniversityListPageState extends State<UniversityListPage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  List<University_info_model> universityInfo = [];
  ApiResponse response = ApiResponse();
  final api_service _apiService = api_service();

  @override
  void initState() {
    getUniversityData();
  }

  getUniversityData()async{
    try{
      ApiResponse response = await _apiService.universityInfo() ;
      if(response.success && response.data !=0){
        var dataList = response.data as List;
        universityInfo =  dataList.map((el) => University_info_model.fromJson(el)).toList();
        //universityInfo.add(dataList);
        d.log("${universityInfo}");
        d.log("${universityInfo.length}");
      }

    }on Exception catch(e){
      d.log("Error::University List Page::University Info: ${e.toString()}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("University List")),
      body: ListView.builder(
        itemCount: universityInfo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${universityInfo[index].name}"),
          );
        },
      ),
    ));
  }
}

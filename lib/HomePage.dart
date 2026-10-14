import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:search/widgets/date_picker_widget.dart';
import 'package:search/widgets/row_item_widget.dart';

import 'models/row_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String currnetDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  int selectedGender = 0;
  bool fullTime = true;
  bool partTime = true;

  List<RowModel> tableList = [
    RowModel(date: "07/04/2025", name: "Ahmad", gender: 1, type: 1),
    RowModel(date: "07/04/2025", name: "Ali", gender: 1, type: 0),
    RowModel(date: "08/04/2025", name: "Rama", gender: 2, type: 1),
    RowModel(date: "08/04/2025", name: "Maria", gender: 2, type: 0),
  ];

  List<RowModel> searchList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchList = tableList;
  }

  void Search() {
    print("Date: $currnetDate");
    print("Gender: $selectedGender");
    print("Part Time: $partTime");
    print("Full Time: $fullTime");

    searchList = [];

    for (int i = 0; i < tableList.length; i++){
      if (currnetDate == tableList[i].date) {
        if (selectedGender == 0 || tableList[i].gender == selectedGender){
          if((fullTime && tableList[i].type == 0) ||
              (partTime && tableList[i].type == 1)) {
            searchList.add(tableList[i]);
          }
        }
      }
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Search"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          DatePickerWidget(onPressed: (value){
            currnetDate = value;
            print("this is from home page: $currnetDate");
          },),
          SizedBox(height: 20,),

          Row(children: [
            Expanded(
              child: RadioListTile(contentPadding: EdgeInsets.zero,
                  title: Text("All", style: TextStyle(fontSize: 20),), value: 0,
                  groupValue: selectedGender, onChanged: (value) {
                  selectedGender = value!;
                  setState(() {

                  });
              
              }),
            ),
            Expanded(
              child: RadioListTile(contentPadding: EdgeInsets.zero,
                  title: Text("Male", style: TextStyle(fontSize: 20),), value: 1,
                  groupValue: selectedGender, onChanged: (value) {
                  selectedGender = value!;
                  setState(() {

                  });

              }),
            ),
            Expanded(
              child: RadioListTile(contentPadding: EdgeInsets.zero,
                  title: Text("Female", style: TextStyle(fontSize: 20),), value: 2,
                  groupValue: selectedGender, onChanged: (value) {
                  selectedGender = value!;
                  setState(() {

                  });

              }),
            ),
          ],),
          
          Row(
            children: [
            Expanded(
              child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("Full Time"), value: fullTime, onChanged: (value) {
                fullTime = value!;
                setState(() {
                  
                });
              }),
            ),
            Expanded(
              child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("Part Time"), value: partTime, onChanged: (value) {
                partTime = value!;
                setState(() {

                });
              }),
            ),
          ],),
          
          SizedBox(height: 20,),
          
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(onPressed: (){
              Search();
            }, child: Text("Search")),
          ),
          
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return RowItem(name: searchList[index].name,
                             date: searchList[index].date,
                             gender: searchList[index].gender,
                             type: searchList[index].type,);
            
            },
            itemCount: searchList.length,
            ),
          ),

        ],),
      ),
    ));
  }
}



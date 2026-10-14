import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String date;
  final String name;
  final int gender;
  final int type;

  const RowItem({
    super.key,
    required this.date,
    required this.name,
    required this.gender,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      height: 45,
      color: Colors.lime,
      child: Row(
        children: [
          Expanded(child: Text(date, textAlign: TextAlign.center,),),
          Expanded(child: Text(name, textAlign: TextAlign.center,)),
          Expanded(child: Text(gender == 1? "Male" : "Female" , textAlign: TextAlign.center,)),
          Expanded(child: Text(type == 0? "Full Time" : "Part Time", textAlign: TextAlign.center,)),
        ],
      ),
    );
  }
}

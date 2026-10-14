import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(String) onPressed;

  const DatePickerWidget({
    required this.onPressed,
    super.key,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {

  String selectedDate = DateFormat("dd/MM/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? dateTime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2026)
        );

        if (dateTime != null){
          selectedDate = DateFormat("dd/MM/yyyy").format(dateTime);
          widget.onPressed(selectedDate);
          setState(() {

          });
        }




      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue),
            boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0, 6) ) ]
        ),
      
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(child: Text( selectedDate, style: TextStyle(fontSize: 30),)),
              const Icon(Icons.arrow_downward, size: 35,)
            ],
          ),
        ),
      ),
    );
  }
}

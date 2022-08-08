import 'package:flutter/material.dart';

class slot extends StatefulWidget {
  final List slots;

  const slot({super.key, required this.slots});

  @override
  State<slot> createState() => _slotState();
}

class _slotState extends State<slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Available Slots'),),
      body: Container(
         padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount:widget.slots.length, 
            itemBuilder:(context,index){
              return Container(
                margin: EdgeInsets.all(10),
                color:Colors.blue,
                height: 200,
                child: Column(
                  children: [
                    // Text('center id'+widget.slots[index]['center_id'].toString()),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
import 'dart:convert';
import 'package:find_slot/slots.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness:Brightness.dark
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //..................................................
 TextEditingController pincode =TextEditingController();
 TextEditingController day =TextEditingController();
 String dropdownValue = '01';
 List slots = [];
//....................................................

fetchSlots()async{
await http.get(Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode='+
                pincode.text +
                '&date=' +
                day.text +
                '-' +
                dropdownValue +'-'+
                '2022'))
                .then((value){
                Map result=jsonDecode(value.body);
                print(result);
              //  setState(() {
              //    slots =result['sessions'];
              //  });
              //  Navigator.push(context,MaterialPageRoute(builder:(context)=>slot(slots:slots)));
                });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                height: 200,
                child: Image.asset('assets/vcn.png'),
              ),
              TextField(
                keyboardType:TextInputType.number,
                maxLength: 6,
                decoration:const InputDecoration(
                  hintText:'Enter Pincode :',
                ),
                controller: pincode,
              ),Row(
                children: [
                  Expanded(
                    child:Container(
                      height: 60,
                      child: TextField(
                           keyboardType:TextInputType.number,
                            decoration:const InputDecoration(
                              hintText:'Enter Date :',
                            ),
                            controller: day,
                      ),
                    )),SizedBox(width: 20,),
                    Expanded(
                      child:Container(
                        height: 52,
                        child:  DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      color: Colors.grey.shade400,
                      height: 2,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      '01',
                      '02',
                      '03',
                      '04',
                      '05',
                      '06',
                      '07',
                      '08',
                      '09',
                      '10',
                      '11',
                      '12'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                      ))
                ],
              ),SizedBox(height: 20,),
              Container(
                child: RaisedButton(child:Text('Find Slot'),
                onPressed:(){
                  fetchSlots();
                }),
              )
            ],
          ),
        ),
      )
    );
  }
}

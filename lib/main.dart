import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _HomePagestate();
  }

}
class _HomePagestate extends State<HomePage>{
  DateTime _currendate=DateTime.now();
  Future<Null>_datechange(BuildContext context) async{
    final DateTime _datechange = await showRoundedDatePicker(context: context,
        theme: ThemeData(primarySwatch: Colors.blue),
        imageHeader: NetworkImage("https://media.cntraveler.com/photos/5ca60f7f7b531a5e47949cde/master/w_4000,h_2400,c_limit/NYC_GettyImages-500619014.jpg"),
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        initialDate: _currendate,
        firstDate:DateTime(2002),
        lastDate: _currendate);
    if(_datechange!=null)
      {
        setState(() {
          _currendate=_datechange;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String _formatdte = DateFormat.yMMMd().format(_currendate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Date Picker", style: TextStyle(color: Colors.white),),),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 300,left: 40,right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Date : $_formatdte")),
                Expanded(child: IconButton(
                  onPressed: (){

                    _datechange (context);
                  },
                  icon: Icon(Icons.date_range,size: 40,),
                ))
              ],
            )
          ],
        ),

      ),
    );
  }}
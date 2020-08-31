import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String work;
String username='NO INPUT GIVEN';
String Phonenumber='NO INPUT GIVEN';
String Time='NO INPUT GIVEN';
var date;
String myDateTime;
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("This is made for Zomentum Hiring Challenge. Please do not use the source code.",
                style: TextStyle(fontSize: 30,color: Colors.pink),),
              ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 1000.0,
            child: TypewriterAnimatedTextKit(

                text: [
                  "Welcome to Xperience Tickets: The future of Ticketing!",
                  "Are you ready to get started?"

                ],
                textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Agne",
                  color: Colors.yellow
                ),
                textAlign: TextAlign.center,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            ),
          ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 450,
                  ),

                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),

                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => booking()),
                      );
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text('Book Tickets Now',
                    style: TextStyle(fontSize: 18),),

                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),

                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => updateinfo()),
                      );
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text('Update Tickets Timing',
                      style: TextStyle(fontSize: 18),),

                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),

                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => delete()),
                      );
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text('Delete a Ticket',
                      style: TextStyle(fontSize: 18),),

                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),

                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => details()),
                      );
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text("View User's Information",
                      style: TextStyle(fontSize: 18),),

                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red),

                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tickettime()),
                      );
                    },
                    color: Colors.pink,
                    textColor: Colors.white,
                    child: Text('Particular Time Data',
                      style: TextStyle(fontSize: 18),),

                  ),
                  SizedBox(
                    width: 30,
                  ),

                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Text("Caution! This requires a working internet connection since Firebase is used at Backend. Please make sure you are connected to the internet.",style: TextStyle(fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Best viewed on Screen Size of 15.6 inches. Since this was a backend assignment, didn't get time to fix the UI.",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 100,
                  ),
                  Text("Developed by Anubhav Sanyal, student at Jaypee Institute of Information Technology Noida",style: TextStyle(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Made as a part of Zomentum Hiring Challenge for Jaypee Universities. © No Copyright issues since we are in digital age",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Caution! You cannot copy the contents of the website since it is developed in Flutter",style: TextStyle(fontSize: 26,color: Colors.red,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red),

                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => timecheck()),
                        );
                      },
                      color: Colors.pink,
                      textColor: Colors.white,
                      child: Text('Refresh Server to Manage Expire Tickets',
                        style: TextStyle(fontSize: 18),),

                    ),
                  ),
                ],

              )
            ],
          ),
        ),
      ),
    );
  }
}
class booking extends StatefulWidget {
  @override
  _bookingState createState() => _bookingState();
}
String docx='None';
class _bookingState extends State<booking> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController timecontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  DateTime selectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),


          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Please enter your name",style: TextStyle(fontSize: 28,color: Colors.pink,fontWeight: FontWeight.bold),),
            Center(
              child: TextField(
                controller: namecontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Your Name',
                  hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                ),
                style: TextStyle(fontSize: 22,color: Colors.yellow),

              ),
            ),
              SizedBox(
                height: 40,
              ),
              Text("Please enter your Phone Number",style: TextStyle(fontSize: 28,color: Colors.pink,fontWeight: FontWeight.bold),),
              Center(
                child: TextField(
                  controller: phonecontroller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Your Phone Number',
                    hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                  ),
                  style: TextStyle(fontSize: 22,color: Colors.yellow),

                ),
              ),
              SizedBox(
                height: 40,
              ),
              /*
              Text("Select your preferred date",style: TextStyle(fontSize: 28,color: Colors.pink,fontWeight: FontWeight.bold),),
              Text("Selected Date is",style: TextStyle(fontSize: 22,color: Colors.yellow),),
              Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontSize: 22,color: Colors.yellow),),
              SizedBox(height: 10.0,),

              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: () => _selectDate(context),
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('Select date'),
              ),
              SizedBox(
                height: 40,
              ),

               */

              Text("Please enter your preferred time",style: TextStyle(fontSize: 28,color: Colors.pink,fontWeight: FontWeight.bold),),
              Center(
                child: TextField(
                  controller: timecontroller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                    hintText: 'Enter your timing in HH:MM Format',
                    hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                  ),
                  style: TextStyle(fontSize: 22,color: Colors.yellow),

                ),
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: ()async{
                  String tempo=timecontroller.text.substring(0,2);
                  var tte=int.parse(tempo);
                  String tempt=timecontroller.text.substring(3,5);
                  var temp=int.parse(tempt);
                  if(temp!=00)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => reject()),
                      );

                    }
                  else if(tte>=24)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => reject()),
                      );
                    }
                  else
                    {
                      DocumentReference docr=await  Firestore.instance.collection("info").add(
                          {
                            "Name": namecontroller.text,
                            "Phone": phonecontroller.text,
                            //"Date": selectedDate.toLocal(),
                            "Time": timecontroller.text,
                            "Status":"Fine"

                          }
                      );
                      docx=docr.documentID;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => accept()),
                      );

                    }






                },
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('Submit'),
              ),
              SizedBox(
                height: 40,
              ),
              Text("Please note that Show Timings are only available at the gap of 1 hr. Show starts at 8AM, followed by 9AM and so on. Ticket booked at Time Intervals like 8:15AM, 9;32AM and such will be classified for shows in the previous hour.",style: TextStyle(fontSize: 14,color: Colors.yellow,fontWeight: FontWeight.bold),)




            ],
          ),
        ),
      ),
    );
  }
}

class accept extends StatefulWidget {
  @override
  _acceptState createState() => _acceptState();
}

class _acceptState extends State<accept> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 170,
              ),
              Text("Dear Customer your ticket has been generated. Please store this Ticket ID for your references",style: TextStyle(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
              Text(docx,style: TextStyle(fontSize: 22,color: Colors.pink,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
                },
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('Home Page',
                  style: TextStyle(fontSize: 18),),

              ),
            ],
          ),
        )
      ),
    );
  }
}
class delete extends StatefulWidget {
  @override
  _deleteState createState() => _deleteState();
}

class _deleteState extends State<delete> {
  TextEditingController deletec = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff6441A5),Color(0xff2a0845)]
    ),
    ),
          child: Column(
            children: [
              TextField(
                controller: deletec,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  border: InputBorder.none,
                  hintText: 'Enter your document id',
                  hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                ),
                style: TextStyle(fontSize: 22,color: Colors.yellow),

              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: (){
                  print(deletec.text);
                  Firestore.instance.collection('info').doc(deletec.text).delete();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => success()),
                  );
                },
                color: Colors.pink,
                textColor: Colors.white,
                child: Text("Delete"),
              )
            ],

          ),
        )
      ),
    );
  }
}
TextEditingController infocontroller=new TextEditingController();
class details extends StatefulWidget {
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: infocontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  border: InputBorder.none,
                  hintText: 'Enter your Ticket ID',
                  hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                ),
                style: TextStyle(fontSize: 22,color: Colors.yellow),

              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: ()async{
                  work=infocontroller.text;
                  print(work);
                  await FirebaseFirestore.instance
                      .collection('info')
                      .document(work)
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    if (documentSnapshot.exists) {
                      username=documentSnapshot.data()['Name'].toString();
                      Phonenumber=documentSnapshot.data()['Phone'].toString();
                      Time=documentSnapshot.data()['Time'].toString();
                      myDateTime = (documentSnapshot.data()['Status']).toString();
                      //date=documentSnapshot.data()['Date'].toString();
                      //print(date);
                      print(documentSnapshot.data()['Name'].toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => details()),
                      );


                    }
                  });







                },
                color: Colors.pink,
                textColor: Colors.white,

                child: Text('Submit'),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Username is $username",style: TextStyle(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 50,
              ),
              Text("PhoneNumber is $Phonenumber",style: TextStyle(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 50,
              ),
              Text("Ticket Timing  is $Time",style: TextStyle(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 50,
              ),
              Text("Ticket Status is $myDateTime",style: TextStyle(fontSize: 22,color: Colors.yellow,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 100,
              ),
              Center(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),

                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homepage()),
                    );
                  },
                  color: Colors.pink,
                  textColor: Colors.white,
                  child: Text('Home Page',
                    style: TextStyle(fontSize: 18),),

                ),
              ),





            ],
          ),

        ),

      ),
    );
  }
}
class updateinfo extends StatefulWidget {
  @override
  _updateinfoState createState() => _updateinfoState();
}

class _updateinfoState extends State<updateinfo> {
  TextEditingController tid = new TextEditingController();
  TextEditingController nt = new TextEditingController();
  CollectionReference infy = FirebaseFirestore.instance.collection('info');
  Future<void> updateUser() {
    return infy
        .doc(tid.text)
        .update({'Time': nt.text})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              TextField(
                controller: tid,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  border: InputBorder.none,
                  hintText: 'Enter your Ticket ID',
                  hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                ),
                style: TextStyle(fontSize: 22,color: Colors.yellow),

              ),
              TextField(
                controller: nt,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  border: InputBorder.none,
                  hintText: 'Enter your preferred new timing',
                  hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                ),
                style: TextStyle(fontSize: 22,color: Colors.yellow),

              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: (){
                  String temp1=nt.text;
                  String temp_a=temp1.substring(0,2);
                  String temp_b=temp1.substring(3,5);
                  var temp_c=int.parse(temp_a);
                  var temp_d=int.parse(temp_b);
                  if(temp_d!=00)
                    {
                      Navigator.push(

                        context,
                        MaterialPageRoute(builder: (context) => reject()),
                      );

                    }
                  else if(temp_c>=24)
                    {
                      Navigator.push(

                        context,
                        MaterialPageRoute(builder: (context) => success()),
                      );

                    }
                  else
                    {
                      updateUser();

                      Navigator.push(

                        context,
                        MaterialPageRoute(builder: (context) => success()),
                      );

                    }




                },
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('Select date'),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
class deletestate extends StatefulWidget {
  @override
  _deletestateState createState() => _deletestateState();
}

class _deletestateState extends State<deletestate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 170,
              ),
              Text("Dear Customer, Your ticket has been successfully cancelled",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.yellow),),
              Text("See you again! We hope there was no problem from our side",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.pink),)
            ],
          ),

        ),
      ),
    );
  }
}
class tickettime extends StatefulWidget {
  @override
  _tickettimeState createState() => _tickettimeState();


  }

var arr=new List(10);
class _tickettimeState extends State<tickettime> {
  TextEditingController rcontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff6441A5),Color(0xff2a0845)]
    ),
    ),
          child: Column(
            children: [
              TextField(
                controller: rcontroller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(

                  border: InputBorder.none,
                  hintText: 'Enter Time for which you want to search Tickets in HH:MM',
                  hintStyle: TextStyle(fontSize: 22,color: Colors.yellow),


                ),
                style: TextStyle(fontSize: 22,color: Colors.yellow),

              ),

              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: ()async{

                  print(rcontroller.text);

                  var x=0;
                  var result = await FirebaseFirestore.instance.collection('info').where(
                      "Time", isEqualTo:rcontroller.text).get();
                  result.docs.forEach((res) {
                    arr[x]=res.data()['Name'].toString();
                    x=x+1;




                  }
                  );
                  for(var i=x+1;i<10;i++) arr[i]='NULL';

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tickettime()),
                  );






                },
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('Get information',
                  style: TextStyle(fontSize: 18),),

              ),
              for(var i in arr)

                Text(i.toString(),style: TextStyle(color: Colors.pink,fontSize: 22,fontWeight: FontWeight.bold),),




            ],
          ),

      ),
      )
    );
  }
}


class success extends StatefulWidget {
  @override
  _successState createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 400,
              ),
              Text("Operation Successfully Performed",style: TextStyle(fontSize: 22,color: Colors.green,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red),

                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
                },
                color: Colors.pink,
                textColor: Colors.white,
                child: Text('Home Page',
                  style: TextStyle(fontSize: 18),),

              ),
            ],
          ),

        ),
      ),
    );
  }
}
class timecheck extends StatefulWidget {
  @override
  _timecheckState createState() => _timecheckState();
}

class _timecheckState extends State<timecheck> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: RaisedButton(
            onPressed: ()async
            {
              var now = new DateTime.now();
              print(new DateFormat("H").format(now));
              FirebaseFirestore.instance
                  .collection('info')
                  .get()
                  .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {

              String q=doc.data()['Time'].toString();
              q=q.substring(0,2);

              int qt=int.parse(q);
              print(qt);
              String tt=new DateFormat("H").format(now);
              int rt=int.parse(tt);
              int ff=qt-rt;
              if(ff<=-8)
                {
                  print("expired");


                  CollectionReference infy=FirebaseFirestore.instance.collection("info");
                  infy
                      .doc(doc.documentID)
                      .update({'Status': 'Expired'})
                      .then((value) => print("User Updated"))
                      .catchError((error) => print("Failed to update user: $error"));



                }
              else
                {
                  print("fine");
                }

              })
              });

            },
            child: Text('Get Time'),
          ),
        ),
      ),

    );
  }
}



class reject extends StatefulWidget {
  @override
  _rejectState createState() => _rejectState();
}

class _rejectState extends State<reject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff6441A5),Color(0xff2a0845)]
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              Text("Operation Failed. Please check if you are filling the right time",style: TextStyle(fontSize: 22,color: Colors.red,fontWeight: FontWeight
              .bold),)
            ],
          ),
        ),
      ),
    );
  }
}




void main()
{
  runApp(MaterialApp(
    home: homepage(),
  ));
}

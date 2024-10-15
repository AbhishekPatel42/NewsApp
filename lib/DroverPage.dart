import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajakhabar/pages/Help.dart';
import 'package:tajakhabar/pages/Trams&condition.dart';
import 'package:tajakhabar/pages/homePage.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0,),
              child: Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage("https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?s=612x612&w=0&k=20&c=uP9rKidKETywVil0dbvg_vAKyv2wjXMwWJDNPHzc_Ug="),
                ),
              ),
            ),
            SizedBox(
              height: height*.0123,
            ),
            Center(child: Text("Mr. Joni",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.teal),)),
            Center(child: Text("mrjoni@gmail.com",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.teal),)),
            Divider(
              color: Colors.teal,
            ),
            SizedBox(
              height: height*.0132,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: Row(
                children: [
                  Image.asset("assets/home.png",height: 30,color: Colors.teal,),
                  SizedBox(
                    width: width*.013,
                  ),
                  Text("Home",style: TextStyle(fontSize: 18,color: Colors.teal),),
                ],
              ),
            ),
            SizedBox(
              height: height*.04,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPages()));
              },
              child: Row(
                children: [
                  Image.asset("assets/help.png",height: 30,color: Colors.teal,),
                  SizedBox(
                    width: width*.013,
                  ),
                  Text("Help",style: TextStyle(fontSize: 18,color: Colors.teal),),
                ],
              ),
            ),SizedBox(
              height: height*.04,
            ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TramsCondition()));
              },
              child: Row(
                children: [
                  Image.asset("assets/condtition.png",height: 30,color: Colors.teal,),
                  SizedBox(
                    width: width*.013,
                  ),
                  Text("Trams & Conditions",style: TextStyle(fontSize: 18,color: Colors.teal),),
                ],
              // ),SizedBox(
              //   height: height*.0132,
              ),
            ),
            SizedBox(
              height: height*.0132,
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                showModalBottomSheet(
                  backgroundColor: Colors.white,
                  context: context, builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Logout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:  Colors.teal)),
                        SizedBox(height: 10),
                        Text("Are you sure you want to log out?", style: TextStyle(color: Colors.teal)),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () async {

                                Navigator.pop(context); // Close the bottom sheet
                              },
                              child: Text("Logout", style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel", style: TextStyle(color:  Colors.teal)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },);

              },
              child: Row(
                children: [
                  Image.asset("assets/logout.png",height: 30,color: Colors.teal,),
                  SizedBox(
                    width: width*.013,
                  ),
                  Text("Logout",style: TextStyle(fontSize: 18,color: Colors.teal),),
                ],
              ),
            ),
            SizedBox(
              width: width*.013,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPages extends StatefulWidget {
  final title , subtle ,img;
  const DetailPages({super.key,required this.title , required this.subtle ,required this.img});

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pages",style: TextStyle(color: Colors.teal)),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.teal))
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                height: height*.4,
                width: width*width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("${widget.img == null ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg": widget.img}",),fit: BoxFit.cover,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.title == null ? "No Data": widget.title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  Text("       ${widget.subtle == null ? "No Data" : widget.subtle}",style: TextStyle(fontSize: 16,),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

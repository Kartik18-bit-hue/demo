import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:Text('New Note')
        
      ),
      body: Column(
        children: [
          TextField(
            style: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w400,color: Colors.white,),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title"
            ),
          ),
          TextField(
            style: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w400,color: Colors.white,),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title"
            ),
          )
        ],
      ),
    );
  }
}
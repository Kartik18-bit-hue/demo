import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> dropdownOptions = ['Date modified', 'Date created'];
  late String dropwdownvalue = dropdownOptions.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Search Notes.....',
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
              fillColor: Colors.purple,
              border: InputBorder.none,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.arrowDown),
              ),
              DropdownButton<String>(
                  value: dropwdownvalue,
                  items: dropdownOptions
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropwdownvalue = newValue!;
                    });
                  }),
              Spacer(),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.bars))
            ],
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Text("This is gonna be first line"),
                        Row(
                          children: [
                            Container(
                              child: Text('This is gonna be the second line'),
                              
                              
                              
                            ),
                          ],
                        ),
                        Text('Some content'),
                        Row(
                          children: [
                            Text('14 March 2025'),
                            FaIcon(FontAwesomeIcons.trash),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('New Note'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

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

  bool isDescending = true;
  bool isGrid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Notes'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.rightFromBracket),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.black12))))
        ],
      ),
      floatingActionButton: DecoratedBox(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
          )
        ]),
        child: FloatingActionButton(
          onPressed: () {},
          child: FaIcon(FontAwesomeIcons.plus),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.black87),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Notes.....',
                hintStyle: TextStyle(fontSize: 12),
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 42,
                  minHeight: 42,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.purpleAccent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.purpleAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isDescending = !isDescending;
                      });
                    },
                    icon: FaIcon(isDescending
                        ? FontAwesomeIcons.arrowDown
                        : FontAwesomeIcons.arrowUp),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: BoxConstraints(),
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    iconSize: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                      value: dropwdownvalue,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: FaIcon(FontAwesomeIcons.arrowDownWideShort),
                      ),
                      underline: SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(16),
                      isDense: true,
                      items: dropdownOptions
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Row(
                                children: [
                                  Text(e),
                                  if (e == dropwdownvalue) ...[
                                    SizedBox(width: 8),
                                    Icon(Icons.check),
                                  ],
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      selectedItemBuilder: (context) =>
                          dropdownOptions.map((e) => Text(e)).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropwdownvalue = newValue!;
                        });
                      }),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: FaIcon(isGrid
                        ? FontAwesomeIcons.tableCellsLarge
                        : FontAwesomeIcons.bars),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: BoxConstraints(),
                    style: IconButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    iconSize: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              child: isGrid ? NotesGrid() : NotesList(),
            )
          ],
        ),
      ),
    );
  }
}

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return NoteCard(isInGrid: false);
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, int index) {
        return NoteCard(isInGrid: true);
      },
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.isInGrid,
    super.key,
  });

  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.purpleAccent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This is gonna be first line and first line",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  margin: EdgeInsets.only(right: 4),
                  child: Text(
                    'Notes',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          if (isInGrid)
            Expanded(
              child: Text(
                'Some content',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          else
            Text(
              'Some content',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          Row(
            children: [
              Text(
                '14 March 2025',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              FaIcon(FontAwesomeIcons.trash, color: Colors.grey, size: 16),
            ],
          )
        ],
      ),
    );
  }
}

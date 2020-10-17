import 'package:app/client/task.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class TaskViewScreen extends StatefulWidget {
  @override
  _TaskViewScreenState createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  bool _isSearching = false;
  TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = "Search query";

  List<SubTask> left = [
    SubTask()
      ..name = ""
      ..description = "wadawdd",
    SubTask()
      ..name = "awddwawdawdawda"
      ..description = "wadawadwadwdd",
  ];
  List<SubTask> mid = [
    SubTask()
      ..name = "awddwawda"
      ..description = "wadawdd",
  ];
  List<SubTask> right = [];

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  Widget _buildCard({
    String title,
    Widget child,
    double width,
    double height,
    Function onPressed,
    Color color = Colors.white,
  }) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                width: width - 10,
                height: 36,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyles.cardHeader,
                      ),
                    ),
                    // MaterialButton(
                    //   child: Text(""),
                    //   onPressed: onPressed,
                    // ),
                  ],
                ),
                padding: EdgeInsets.only(left: 7, right: 7),
              ),
              Container(
                width: width - 10,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                width: width - 10,
                height: height - 57,
                child: child,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWide(BuildContext context) {
    return Container(
      color: Color(0xFFE5E5E5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1000,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Задача",
                      style: AppStyles.pageHeader,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 500,
                        color: Colors.red,
                      ),
                      Container(
                        height: 10,
                        width: 200,
                        color: Colors.amber,
                      ),
                      Container(
                        height: 10,
                        width: 268,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        _buildCard(
                          child: ListView.builder(
                            itemCount: left.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: MaterialButton(
                                  child: Icon(Icons.arrow_left),
                                  onPressed: null,
                                ),
                                title: Text(left[index].name),
                                subtitle: Text(left[index].description),
                                trailing: MaterialButton(
                                  child: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    setState(() {
                                      mid.add(left[index]);
                                      left.removeAt(index);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                          color: Colors.red[200],
                          height: 500,
                          width: 322,
                          title: "Placeholder",
                        ),
                        _buildCard(
                          child: ListView.builder(
                            itemCount: mid.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: MaterialButton(
                                  child: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      left.add(mid[index]);
                                      mid.removeAt(index);
                                    });
                                  },
                                ),
                                title: Text(mid[index].name),
                                subtitle: Text(mid[index].description),
                                trailing: MaterialButton(
                                  child: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    setState(() {
                                      right.add(mid[index]);
                                      mid.removeAt(index);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                          color: Colors.amber[200],
                          height: 500,
                          width: 322,
                          title: "Placeholder",
                        ),
                        _buildCard(
                          child: ListView.builder(
                            itemCount: right.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: MaterialButton(
                                  child: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      mid.add(right[index]);
                                      right.removeAt(index);
                                    });
                                  },
                                ),
                                title: Text(right[index].name),
                                subtitle: Text(right[index].description),
                                trailing: MaterialButton(
                                  child: Icon(Icons.arrow_right),
                                  onPressed: null,
                                ),
                              );
                            },
                          ),
                          color: Colors.green[200],
                          height: 500,
                          width: 322,
                          title: "Placeholder",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : Text("Ориентир"),
        actions: _buildActions(),
        leading: _isSearching ? const BackButton() : null,
      ),
      body: LayoutBuilder(
        builder: (content, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWide(context);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Mobile", style: Theme.of(context).textTheme.headline1),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO Dialogs
        },
        tooltip: 'Чаты',
        child: Icon(Icons.message),
      ),
    );
  }
}

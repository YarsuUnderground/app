import 'package:app/taskViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';
import 'secondScreen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _isSearching = false;
  TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = "Search query";
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

  Widget _buildCard(
      {String title,
      Widget child,
      double width,
      double height,
      Function onPressed,
      Color color = Colors.white}) {
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
                    MaterialButton(
                      child: Text("Открыть"),
                      onPressed: onPressed,
                    ),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 1000,
                height: 640,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        width: 460,
                        height: 600,
                        child: ListView(
                          children: [
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Test"),
                              ),
                              color: Colors.white,
                              width: 460,
                              height: 200,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TaskViewScreen(),
                                  ),
                                );
                              },
                              title: "Название 1",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Test"),
                              ),
                              color: Colors.white,
                              width: 460,
                              height: 200,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TaskViewScreen(),
                                  ),
                                );
                              },
                              title: "Название 2",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Test"),
                              ),
                              color: Colors.white,
                              width: 460,
                              height: 200,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TaskViewScreen(),
                                  ),
                                );
                              },
                              title: "Название 3",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Test"),
                              ),
                              color: Colors.white,
                              width: 460,
                              height: 200,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TaskViewScreen(),
                                  ),
                                );
                              },
                              title: "Название 3",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: _buildCard(
                        child: Text("Новости"),
                        color: Colors.blue[200],
                        height: 600,
                        width: 460,
                        title: "Новости",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
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

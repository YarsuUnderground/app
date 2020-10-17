import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatefulWidget {
  DefaultScaffold({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  _DefaultScaffoldState createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  // --- search ---

  bool _isSearching = false;
  TextEditingController _searchQueryController = TextEditingController();
  String searchQuery = "Search query";

  Widget _buildSearchField() {
    return Center(
      child: Container(
        width: 1000,
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: TextField(
              controller: _searchQueryController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Поиск",
                hintStyle: TextStyle(color: Colors.white30),
              ),
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              onChanged: (query) => updateSearchQuery(query),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Center(
      child: Container(
        width: 1000,
        child: Row(
          children: [
            Text("Ориентир"),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: MaterialButton(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 24,
                      ),
                      Text(
                        "Создать задачу",
                        style: AppStyles.cardHeader,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  // TODO
                },
                color: Colors.white,
                height: 52,
                minWidth: 300,
              ),
            ),
            Expanded(
              child: Container(
                height: 44,
                child: MaterialButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      Text(
                        "Поиск",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  onPressed: _startSearch,
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (content, constraints) {
        if (constraints.maxWidth > 1300 && constraints.maxHeight > 700) {
          return Scaffold(
            appBar: AppBar(
              title: _isSearching ? _buildSearchField() : _buildTop(),
              actions: _buildActions(),
              leading: _isSearching ? const BackButton() : null,
            ),
            body: this.widget.child,
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text("Низкое резрешение не поддерживается"),
            ),
          );
        }
      },
    );
  }
}

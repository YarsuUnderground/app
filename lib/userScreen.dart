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
                        overflow: TextOverflow.ellipsis,
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
                height: 650,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        width: 460,
                        height: 610,
                        child: ListView(
                          children: [
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Обучение для работы с новыми программными средствами и комплексами"),
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
                              title: "№1. Обучение",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Администрирование и обеспечение функционирования баз данных"),
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
                              title: "№2. Базы данных",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Разработка технической и сопроводительной документации к разрабатываемому программному обеспечению"),
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
                              title: "№3. Разработка",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Техническая поддержка и функциональное сопровождение введенных в эксплуатацию программных комплексов"),
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
                              title: "№4. Тех.Поддержка",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Анализ входящих данных"),
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
                              title: "№5. Анализ данных",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Отслеживание достоверности поступающей информации"),
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
                              title: "№6. Контроль информации",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Изучение дополнительной документации и соглашений о конфиденциальности данных"),
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
                              title: "№7. Документация",
                            ),
                            _buildCard(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                    "Прохождение курсов повышения квалификации"),
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
                              title: "№8. Курсы повышения квалификации",
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
                        height: 610,
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

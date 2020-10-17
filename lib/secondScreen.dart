import 'package:app/taskViewScreen.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:flutter/foundation.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  void viewThrirdScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TaskViewScreen(),
      ),
    );
  }

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
      String chatId = ""}) {
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
                height: 30,
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
                      child: Text("Все"),
                      onPressed: onPressed,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 7, right: 7),
              ),
              // Разделяющая полоса
              Container(
                width: width - 10,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                width: width - 10,
                height: height - 75,
                child: child,
                color: Color(0xFFc2deff),
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
              Container(
                alignment: Alignment.center,
                width: width - 90,
                height: 20,
                child: Text(chatId),
              )
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Обучение для работы с новыми программными средствами и комплексами',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№1. Обучение",
                chatId: "#1Learn",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Администрирование и обеспечение функционирования баз данных',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№2. Базы данных",
                chatId: "#2DB",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Разработка технической и сопроводительной документации к разрабатываемому программному обеспечению;',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№3. Разработка",
                chatId: "#3Dev",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Техническая поддержка и функциональное сопровождение введенных в эксплуатацию программных комплексов',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№4. Тех.Поддержка",
                chatId: "#4Support",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Анализ входящих данных',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№5. Анализ данных",
                chatId: "#5DataS",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Отслеживание достоверности поступающей информации',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№6. Контроль информации",
                chatId: "#6ControlInf",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Изучение дополнительной документации и соглашений о конфиденциальности данных',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№7. Документация",
                chatId: "#7Docs",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
              _buildCard(
                child: ListView(
                  children: [
                    Text(
                      'Прохождение курсов повышения квалификации',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                height: 315,
                width: 305,
                title: "№8. Курсы повышения квалификации",
                chatId: "#8RefCurse",
                onPressed: () {
                  viewThrirdScreen();
                },
              ),
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

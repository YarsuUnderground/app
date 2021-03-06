import 'package:app/defaultScaffold.dart';
import 'package:app/taskViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';
import 'secondScreen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCard(
                            color: Color(0xFFBBC1FF),
                            child: ListView(
                              children: [
                                ...ListTile.divideTiles(
                                  context: context,
                                  tiles: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.warning,
                                        color: Colors.blue,
                                        size: 36,
                                      ),
                                      title: Text(
                                          "ВНИМАНИЕ. Задание 'Ремонт трассы М9' было просрочено вчера "),
                                      subtitle: Text("11 Дек → 20 Дек"),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.info_outline,
                                        color: Colors.blue,
                                        size: 36,
                                      ),
                                      title: Text(
                                          "Изменение срока 'Больница №10'"),
                                      subtitle: Text("20 Дек → 22 Дек"),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.info_outline,
                                        color: Colors.blue,
                                        size: 36,
                                      ),
                                      title: Text(
                                          "ВНИМАНИЕ. Близится срок сдачи задания 'Больница №10'"),
                                      subtitle: Text("11 Дек → 20 Дек"),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.info_outline,
                                        color: Colors.blue,
                                        size: 36,
                                      ),
                                      title: Text(
                                          "Добавлен исполнитель: Долгоруков Вальтер"),
                                      subtitle: Text("Задача: Ремонт больницы"),
                                    ),
                                    ListTile(
                                      leading: Icon(
                                        Icons.info_outline,
                                        color: Colors.blue,
                                        size: 36,
                                      ),
                                      title: Text(
                                          "Собрание команды задачи 'Приют' "),
                                      subtitle: Text("Дата: 21.11, 19:00"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height: 600,
                            width: 500,
                            title: "Новости"),
                      ],
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
    return DefaultScaffold(child: _buildWide(context));
  }
}

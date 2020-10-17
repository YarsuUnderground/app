import 'package:app/defaultScaffold.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';
import 'secondScreen.dart';

class AdminHomeScreen extends StatefulWidget {
  AdminHomeScreen({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Widget _buildCard({
    String title = "",
    Widget child,
    double width = 50,
    double height = 50,
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
                    MaterialButton(
                      child: Text("Все"),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
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
                    // TODO create task
                  },
                  color: Colors.white,
                  height: 36,
                  minWidth: 295,
                ),
              ),
              _buildCard(
                color: Colors.red[200],
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                        size: 36,
                      ),
                      title: Text("Жилье для малоимущих"),
                      subtitle: Text("test@gov.ru"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                        size: 36,
                      ),
                      title: Text("Олимпийские объекты"),
                      subtitle: Text("test@gov.ru"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.warning_amber_outlined,
                        size: 36,
                      ),
                      title: Text("Ввод карантинных мер"),
                      subtitle: Text("Другой орган"),
                    )
                  ],
                ),
                height: 269,
                width: 305,
                title: "Новые задачи",
                onPressed: () {
                  // TODO:
                },
              ),
              _buildCard(
                color: Colors.blue[200],
                title: "Люди",
                child: ListView(
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.asset("images/face1.jfif"),
                      ),
                      title: Text("Щавельский Тибор"),
                      subtitle: Text("Отдел 1"),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.asset("images/face2.jfif"),
                      ),
                      title: Text("Долгоруков Вальтер"),
                      subtitle: Text("Отдел 1"),
                    ),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.asset("images/face3.jfif"),
                      ),
                      title: Text("Вахрушев Глеб"),
                      subtitle: Text("Отдел 2"),
                    ),
                  ],
                ),
                height: 315,
                width: 305,
                onPressed: () {
                  // TODO:
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                color: Colors.red[200],
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.warning,
                        color: Colors.white,
                        size: 36,
                      ),
                      title: Text("Ремонт трассы М9"),
                      subtitle: Text("Просрочено: вчера"),
                      tileColor: Colors.red,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.warning_rounded,
                        color: Colors.amber,
                        size: 36,
                      ),
                      title: Text("Больница №10"),
                      subtitle: Text("Срок: 20 Окт."),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 36,
                      ),
                      title: Text("Закука птрамваем"),
                      subtitle: Text("Срок: 2 Дек."),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.done,
                        color: Colors.green,
                        size: 36,
                      ),
                      title: Text("Приют"),
                      subtitle: Text("Выполнено"),
                    ),
                  ],
                ),
                height: 315,
                width: 305,
                title: "Задачи",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePage2(),
                    ),
                  );
                },
              ),
              _buildCard(
                color: Colors.blue[200],
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("Отдел 1"),
                    ),
                    ListTile(
                      title: Text("Отдел 2"),
                    ),
                    ListTile(
                      title: Text("Отдел 3"),
                    ),
                  ],
                ),
                height: 315,
                width: 305,
                title: "Отделы",
                onPressed: () {
                  // TODO:
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCard(
                color: Colors.blue[200],
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
                          title: Text("Изменение срока 'Больница №10'"),
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
                          title:
                              Text("Добавлен исполнитель: Долгоруков Вальтер"),
                          subtitle: Text("Задача: Ремонт больницы"),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: Colors.blue,
                            size: 36,
                          ),
                          title: Text("Собрание команды задачи 'Приют' "),
                          subtitle: Text("Дата: 21.11, 19:00"),
                        ),
                      ],
                    ),
                  ],
                ),
                height: 630,
                width: 610,
                title: "Новости",
                onPressed: () {
                  // TODO:
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
    return DefaultScaffold(child: _buildWide(context));
  }
}

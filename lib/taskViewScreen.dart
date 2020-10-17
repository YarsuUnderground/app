import 'package:app/client/task.dart';
import 'package:app/defaultScaffold.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class TaskViewScreen extends StatefulWidget {
  @override
  _TaskViewScreenState createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  List<SubTask> left = [
    SubTask()
      ..name = "№1. Обучение"
      ..description =
          "Обучение для работы с новыми программными средствами и комплексами",
    SubTask()
      ..name = "№2. Базы данных"
      ..description =
          "Администрирование и обеспечение функционирования баз данных",
  ];
  List<SubTask> mid = [
    SubTask()
      ..name = "№3. Разработка"
      ..description =
          "Разработка технической и сопроводительной документации к разрабатываемому программному обеспечению",
    SubTask()
      ..name = "№4. Тех.Поддержка"
      ..description =
          "Техническая поддержка и функциональное сопровождение введенных в эксплуатацию программных комплексов",
    SubTask()
      ..name = "№5. Анализ данных"
      ..description = "Анализ входящих данных",
    SubTask()
      ..name = "№6. Контроль информации"
      ..description = "Отслеживание достоверности поступающей информации",
    SubTask()
      ..name = "№7. Документация"
      ..description =
          "Изучение дополнительной документации и соглашений о конфиденциальности данных",
    SubTask()
      ..name = "№8. Курсы повышения квалификации"
      ..description = "Прохождение курсов повышения квалификации",
  ];
  List<SubTask> right = [];
  int sum() => this.left.length + this.mid.length + this.right.length;
  static const int _w = 968;

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
                        width: (left.length / sum()) * _w,
                        color: Colors.red,
                      ),
                      Container(
                        height: 10,
                        width: (mid.length / sum()) * _w,
                        color: Colors.amber,
                      ),
                      Container(
                        height: 10,
                        width: (right.length / sum()) * _w,
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
                                leading: IconButton(
                                  icon: Icon(Icons.arrow_left),
                                  onPressed: null,
                                ),
                                title: Text(left[index].name),
                                subtitle: Text(left[index].description),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_right),
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
                                leading: IconButton(
                                  icon: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      left.add(mid[index]);
                                      mid.removeAt(index);
                                    });
                                  },
                                ),
                                title: Text(mid[index].name),
                                subtitle: Text(mid[index].description),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_right),
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
                                leading: IconButton(
                                  icon: Icon(Icons.arrow_left),
                                  onPressed: () {
                                    setState(() {
                                      mid.add(right[index]);
                                      right.removeAt(index);
                                    });
                                  },
                                ),
                                title: Text(right[index].name),
                                subtitle: Text(right[index].description),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_left),
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
    return DefaultScaffold(child: _buildWide(context));
  }
}

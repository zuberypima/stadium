import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stadium/view/widgets/gameListView.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  void initState() {
    super.initState();
    generateWeekDates(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.green,
                tabs: [
                  for (String date in generateWeekDates(DateTime.now()))
                    Tab(text: date.toString()),
                ],
              ),
            ),
            // backgroundColor: mainbackgroundColor,
            body: TabBarView(
              children: [
                gameListView(),
                gameListView(),
                gameListView(),
                gameListView(),
              ],
            )),
      ),
    );
  }

  List<String> generateWeekDates(DateTime startDate) {
    List<String> dates = [];
    DateFormat dateFormat = DateFormat('dd-MM');

    for (int i = 0; i < 4; i++) {
      DateTime date = startDate.add(Duration(days: i));
      dates.add(dateFormat.format(date));
    }
    return dates;
  }
}

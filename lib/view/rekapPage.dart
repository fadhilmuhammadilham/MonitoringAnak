import 'package:flutter/material.dart';
import 'package:qrabsen/assets/component/cardprofile.dart';
import 'package:table_calendar/table_calendar.dart';

class RekapPage extends StatefulWidget {
  const RekapPage({Key? key}) : super(key: key);

  @override
  State<RekapPage> createState() => _RekapPageState();
}

class _RekapPageState extends State<RekapPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  List<Tab> myTab = [
    Tab(
      text: 'Masuk',
      icon: Icon(Icons.login_rounded),
    ),
    Tab(
      text: 'Keluar',
      icon: Icon(Icons.logout_rounded),
    ),
    Tab(
      text: 'Semua',
      icon: Icon(Icons.grid_view_rounded),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Color(0xFFF4FFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              flexibleSpace: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                      child: DropProfile())
                ],
              ),
              bottom: TabBar(
                tabs: myTab,
                indicatorColor: Color(0xFFADD8E6),
                labelColor: Color(0xFFADD8E6),
                unselectedLabelColor: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            //MASUK
            Container(
                child: Column(
              children: [
                TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFADD8E6),
                    ),
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 10),
                  lastDay: DateTime.utc(2030, 10, 10),
                  onDaySelected: _onDaySelected,
                  calendarFormat: CalendarFormat.week,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(children: <Widget>[
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Nama Siswa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Goo Youn Jung',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Hari, Tanggal',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Rabu, 17 April 2024',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Jam Masuk',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '07:10:20',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        SizedBox(
                          height: 75,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFB9F8B9),
                              border: Border.all(color: Color(0xFF008800)),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 70,
                          child: Center(
                            child: Text(
                              'Tepat Waktu',
                              style: TextStyle(
                                  color: Color(0xFF008800),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )
              ],
            )),
            //KELUAR
            Container(
                child: Column(
              children: [
                TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFADD8E6),
                    ),
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 10),
                  lastDay: DateTime.utc(2030, 10, 10),
                  onDaySelected: _onDaySelected,
                  calendarFormat: CalendarFormat.week,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(children: <Widget>[
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Nama Siswa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Goo Youn Jung',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Hari, Tanggal',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Rabu, 17 April 2024',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Jam Masuk',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '07:10:20',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                      ]),
                    ),
                  ],
                )
              ],
            )),

            //SEMUA
            Container(
                child: Column(
              children: [
                TableCalendar(
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFADD8E6),
                    ),
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 10),
                  lastDay: DateTime.utc(2030, 10, 10),
                  onDaySelected: _onDaySelected,
                  calendarFormat: CalendarFormat.week,
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(children: <Widget>[
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Nama Siswa',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Goo Youn Jung',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Hari, Tanggal',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Rabu, 17 April 2024',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Jam Masuk',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '07:10:20',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Jam Keluar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '07:10:20',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ]),
                        ),
                        Divider(),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFFE0EB),
                              border: Border.all(color: Color(0xFFFF0000)),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 70,
                          child: Center(
                            child: Text(
                              'Terlambat',
                              style: TextStyle(
                                  color: Color(0xFFFF0000),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

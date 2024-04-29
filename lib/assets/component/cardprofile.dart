import 'package:flutter/material.dart';

class DropProfile extends StatefulWidget {
  @override
  _DropProfileState createState() => _DropProfileState();
}

class _DropProfileState extends State<DropProfile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 100,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/gyj.jpg'),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Goo Youn Jung',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('XII - RPL2'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: SizedBox(
                width: 40,
                child: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

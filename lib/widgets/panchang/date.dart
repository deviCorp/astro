import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';

class DateSet extends StatefulWidget {
  final Function() onselect;
  final DateTime date;

  const DateSet({
    Key? key,
    required this.date,
    required this.onselect,
  }) : super(key: key);

  @override
  State<DateSet> createState() => _DateSetState();
}

class _DateSetState extends State<DateSet> {
  String? currentLocation;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Date    :     ',
          style: bodyStyle(context: context, size: 15, color: black),
        ),
        TextButton(
          style: TextButton.styleFrom(
              primary: black,
              backgroundColor: Colors.white,
              fixedSize: Size(mediaQuery.width * .6, 35),
              textStyle: bodyStyle(context: context, size: 15, color: black)),
          onPressed: widget.onselect,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Jiffy(widget.date).yMMMMd),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }
}

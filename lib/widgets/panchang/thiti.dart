import 'package:flutter/material.dart';
import 'package:tak_task/models/panchang.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';

class TithiTable extends StatelessWidget {
  final Panchang panchang;
  const TithiTable({Key? key, required this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final endTime = panchang.tithi?.endTime;
    row(String title, String value) => TableRow(
          children: [
            Text(
              '$title :',
              style: bodyStyle(context: context, size: 14, color: black),
            ),
            Text(value,
                style: bodyStyle(context: context, size: 14, color: black)),
          ],
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            'Tithi',
            style: headingStyle(context: context, size: 20, color: black),
          ),
        ),
        Table(
          children: [
            row('Tithi Number', panchang.tithi?.tithiNo.toString() ?? '-'),
            row('Tithi Name', panchang.tithi?.tithiName ?? '-'),
            row('Special', panchang.tithi?.special ?? '-'),
            row('Summary', panchang.tithi?.summary ?? '-'),
            row('Deity', panchang.tithi?.deity ?? '-'),
            row('End Time',
                '${endTime?['hour'] ?? '-'} hr ${endTime?['minute'] ?? '-'} min ${endTime?['second'] ?? '-'} sec ')
          ],
        ),
      ],
    );
  }
}

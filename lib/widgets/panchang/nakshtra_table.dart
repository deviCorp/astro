import 'package:flutter/material.dart';
import 'package:tak_task/models/panchang.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';

class NakShatraTable extends StatelessWidget {
  final Panchang panchang;
  const NakShatraTable({Key? key, required this.panchang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final endTime = panchang.nakshatra?.endTime;
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
            'Nakshrtra',
            style: headingStyle(context: context, size: 20, color: black),
          ),
        ),
        Table(
          children: [
            row('Nakshatra Number',
                panchang.nakshatra?.nakshatraNo.toString() ?? '-'),
            row('Nakshatra Name', panchang.nakshatra?.nakshatraName ?? '-'),
            row('Nakshatra Name', panchang.nakshatra?.ruler ?? '-'),
            row('Special', panchang.nakshatra?.special ?? '-'),
            row('Summary', panchang.nakshatra?.summary ?? '-'),
            row('Deity', panchang.nakshatra?.deity ?? '-'),
            row('End Time',
                '${endTime?['hour'] ?? '-'} hr ${endTime?['minute'] ?? '-'} min ${endTime?['second'] ?? '-'} sec ')
          ],
        ),
      ],
    );
  }
}

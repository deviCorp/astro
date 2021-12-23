import 'package:flutter/material.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';

class CustomPopUp extends StatelessWidget {
  final Function(Object)? onTap;
  final String? value;
  const CustomPopUp({Key? key, this.onTap, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Experience-high to low',
      'Experience-low to high',
      'Price-high to low',
      'Price-low to high'
    ];
    popupMenuItem(tag, active) => PopupMenuItem(
          child: Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: active ? black : Colors.white,
                    border: Border.all(width: 1.5, color: black),
                    borderRadius: BorderRadius.circular(15)),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                tag,
                style: bodyStyle(context: context, size: 15, color: black),
              ),
            ],
          ),
          value: tag,
        );
    return PopupMenuButton(
      child: Image.asset(
        'assets/images/sort.png',
        width: 30,
        height: 30,
      ),
      itemBuilder: (BuildContext bc) {
        return items.map((e) => popupMenuItem(e, value == e)).toList();
      },
      onSelected: onTap,
    );
  }
}

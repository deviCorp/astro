import 'package:flutter/material.dart';
import 'package:tak_task/models/location.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';

class LocationSet extends StatelessWidget {
  final Location? currentLocation;
  final List<Location>? locations;
  final Function(Location?)? onChange;
  const LocationSet(
      {Key? key, this.currentLocation, this.locations, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<Location> buildMenuItem(Location item) => DropdownMenuItem(
        value: item,
        child: Text(
          item.placeName ?? ' ',
          style: bodyStyle(context: context, size: 15, color: black),
        ));
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Location : ',
          style: bodyStyle(context: context, size: 15, color: black),
        ),
        Container(
          height: 35,
          width: mediaQuery.width * .6,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), color: Colors.white),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Location>(
              isExpanded: true,
              value: currentLocation,
              items: locations?.map(buildMenuItem).toList(),
              onChanged: onChange,
            ),
          ),
        ),
      ],
    );
  }
}

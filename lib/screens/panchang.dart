import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak_task/cubit/location_cubit.dart';
import 'package:tak_task/cubit/panchang_cubit.dart';
import 'package:tak_task/models/location.dart';
import 'package:tak_task/models/panchang.dart';
import 'package:tak_task/utils/constants.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';
import 'package:tak_task/widgets/panchang/date.dart';
import 'package:tak_task/widgets/panchang/location.dart';
import 'package:tak_task/widgets/panchang/nakshtra_table.dart';
import 'package:tak_task/widgets/panchang/thiti.dart';

class PanchangScreen extends StatefulWidget {
  static const String routeName = '/panchag';
  const PanchangScreen({Key? key}) : super(key: key);

  @override
  _PanchangScreenState createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen> {
  DateTime date = DateTime.now();
  Location? currentLocation;
  String? placeId = 'ChIJeWtf7IQOkYARqIGKfhVoSaU';

  @override
  void initState() {
    BlocProvider.of<PanchangCubit>(context)
        .fetchPanchang(DateTime.now(), 'ChIJeWtf7IQOkYARqIGKfhVoSaU');
    BlocProvider.of<LocationCubit>(context).fetchLocation();
    super.initState();
  }

  void pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate != null) {
      BlocProvider.of<PanchangCubit>(context).fetchPanchang(newDate, placeId!);
      setState(() {
        date = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if ((state is! LocationLoaded)) {
          return const Center(
              child: CircularProgressIndicator(
            color: brown,
          ));
        }
        final locations = (state).location;
        return BlocBuilder<PanchangCubit, PanchangState>(
          builder: (context, state) {
            if ((state is! PanchangLoaded)) {
              return const Center(
                  child: CircularProgressIndicator(
                color: brown,
              ));
            }
            final panchang = (state).panchang;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Panchang',
                    style:
                        headingStyle(context: context, size: 25, color: black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(aboutIndia,
                        style: bodyStyle(
                            context: context, size: 12, color: black)),
                  ),
                  Container(
                    color: brown.withOpacity(.2),
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DateSet(
                          date: date,
                          onselect: () => pickDate(context),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        LocationSet(
                          currentLocation: currentLocation ?? locations?[0],
                          locations: locations,
                          onChange: (value) {
                            currentLocation = value;
                            placeId = value!.placeId;
                            BlocProvider.of<PanchangCubit>(context)
                                .fetchPanchang(date, placeId!);
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          time('assets/images/sunrise.png', 'Sunrise',
                              panchang?.sunrise),
                          time('assets/images/sunset.png', 'Sunset',
                              panchang?.sunrise),
                          time('assets/images/moonrise.jpeg', 'Moonrise',
                              panchang?.sunrise),
                          time('assets/images/moonset.jpeg', 'Moonrise',
                              panchang?.sunrise)
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: black.withOpacity(.5),
                  ),
                  TithiTable(panchang: panchang!),
                  NakShatraTable(panchang: panchang),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget time(img, title, time) {
    return SizedBox(
      width: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 5,
          ),
          Image.asset(
            img,
            width: 18,
            height: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 10),
              ),
              Text(time, style: TextStyle(fontSize: 14)),
            ],
          ),
          VerticalDivider(
            color: black.withOpacity(.5),
          ),
        ],
      ),
    );
  }
}

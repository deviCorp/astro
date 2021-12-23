import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak_task/cubit/astrologer_cubit.dart';
import 'package:tak_task/models/astrologer.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/text_style.dart';
import 'package:tak_task/widgets/astrologer/custom_buttons.dart';
import 'package:tak_task/widgets/astrologer/list_tile.dart';
import 'package:tak_task/widgets/astrologer/pop_up_button.dart';
import 'package:tak_task/widgets/astrologer/search_bar.dart';
import 'package:tak_task/widgets/custom_appbar.dart';

class AstrologerScreen extends StatefulWidget {
  static const String routeName = '/astrologer';
  const AstrologerScreen({Key? key}) : super(key: key);

  @override
  _AstrologerScreenState createState() => _AstrologerScreenState();
}

class _AstrologerScreenState extends State<AstrologerScreen> {
  final _searchController = TextEditingController();
  String? activeSort;
  bool search = false;
  List<Astrologer> sortedAstrologers = [];
  sort(List<Astrologer> astrologers, String type) {
    sortedAstrologers = astrologers;
    switch (type) {
      case 'Experience-high to low':
        return sortedAstrologers
            .sort((a, b) => a.experience!.compareTo(b.experience!));
      case 'Experience-low to high':
        return sortedAstrologers
            .sort((a, b) => b.experience!.compareTo(a.experience!));
      case 'Price-high to low':
        return sortedAstrologers.sort((a, b) => a.additionalPerMinuteCharges!
            .compareTo(b.additionalPerMinuteCharges!));
      case 'Price-low to high':
        return sortedAstrologers.sort((a, b) => b.additionalPerMinuteCharges!
            .compareTo(a.additionalPerMinuteCharges!));
    }
  }

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AstrologerCubit>(context)
        .fetchAstrologers(_searchController.text);
    return BlocBuilder<AstrologerCubit, AstrologerState>(
      builder: (context, state) {
        if ((state is! AstrologerLoaded)) {
          return const Center(
              child: CircularProgressIndicator(
            color: brown,
          ));
        }
        final astrologers = (state).astrologer;
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Talk to Astrologer',
                      style: headingStyle(
                          context: context, size: 20, color: black),
                    ),
                    const Spacer(),
                    CustomButton(
                      image: 'assets/images/search.png',
                      ontap: () {
                        setState(() {
                          search = !search;
                        });
                      },
                    ),
                    CustomButton(
                      image: 'assets/images/filter.png',
                      ontap: () {},
                    ),
                    CustomPopUp(
                        value: activeSort,
                        onTap: (selection) => {
                              sort(astrologers!, selection.toString()),
                              setState(() {
                                activeSort = selection.toString();
                              })
                            }),
                  ],
                ),
              ),
              if (search)
                SearchBar(
                  searchController: _searchController,
                ),
              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.all(5),
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: grey,
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: astrologers?.length ?? 0,
                    itemBuilder: (context, index) {
                      List skills = [];
                      List languages = [];
                      if (sortedAstrologers.isEmpty) {
                        astrologers?[index].skills?.forEach((e) {
                          skills.add(e['name']);
                        });
                        astrologers?[index].languages?.forEach((e) {
                          languages.add(e['name']);
                        });
                      } else {
                        sortedAstrologers[index].skills?.forEach((e) {
                          skills.add(e['name']);
                        });
                        sortedAstrologers[index].languages?.forEach((e) {
                          languages.add(e['name']);
                        });
                      }
                      final astrologer = sortedAstrologers.isEmpty
                          ? astrologers![index]
                          : sortedAstrologers[index];
                      return CustomListTile(
                        img: astrologer.images?['medium']['imageUrl'],
                        name:
                            '${astrologer.firstName} ${astrologers?[index].lastName}',
                        skills: skills.join(','),
                        languages: languages.join(','),
                        rates: astrologer.additionalPerMinuteCharges!
                            .toInt()
                            .toString(),
                        experience: astrologer.experience!.toInt().toString(),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}

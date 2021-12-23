import 'package:flutter/material.dart';
import 'package:tak_task/utils/meta.dart';
import 'package:tak_task/utils/size_animation.dart';
import 'package:tak_task/utils/text_style.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? searchController;
  const SearchBar({Key? key, this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: grey));
    return SizeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          child: TextFormField(
            cursorColor: brown,
            controller: searchController,
            decoration: InputDecoration(
                isDense: true,
                hintText: 'Search Astrologer',
                hintStyle: bodyStyle(
                    context: context, size: 15, color: black.withOpacity(.4)),
                disabledBorder: border,
                enabledBorder: border,
                focusedBorder: border,
                filled: true,
                fillColor: grey.withOpacity(.3),
                prefixIcon: const Icon(
                  Icons.search,
                  color: brown,
                  size: 22,
                ),
                suffixIcon: const Icon(
                  Icons.cancel,
                  color: brown,
                  size: 22,
                )),
          ),
        ),
      ),
    );
  }
}

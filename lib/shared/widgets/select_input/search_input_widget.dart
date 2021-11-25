import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class SearchInputWidget extends StatelessWidget {
  final String typeOfSearch;
  final List<String> suggestions;
  final Function(String?)? onTapFunction;
  final TextEditingController? textController;

  const SearchInputWidget({
    Key? key,
    required this.typeOfSearch,
    required this.suggestions,
    this.onTapFunction,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SearchField(
        suggestions: suggestions,
        suggestionStyle: AppTextStyles.body,
        suggestionState: SuggestionState.enabled,
        controller: textController,
        hint: typeOfSearch,
        suggestionAction: SuggestionAction.next,
        searchStyle: AppTextStyles.body,
        validator: (item) {
          if (item!.isEmpty) {
            return 'Por favor selecione um item';
          }
          return null;
        },
        searchInputDecoration: InputDecoration(
            hintStyle: AppTextStyles.placeholder,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.stroke),
                borderRadius: BorderRadius.circular(10))),
        onTap: onTapFunction,
        maxSuggestionsInViewPort: 10,
        itemHeight: 50,
      ),
    );
  }
}

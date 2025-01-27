import 'dart:async';

import 'package:flutter/material.dart';
import 'package:penta_ai/core/configs/constants/app_icons.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_core/penta_core.dart';

class AppSearchAnchor extends StatefulWidget {
  const AppSearchAnchor({
    required this.hintText,
    required this.suggestionsBuilder,
    super.key,
    this.reverseColor = false,
  });

  final String hintText;
  final bool reverseColor;
  final FutureOr<Iterable<Widget>> Function(String) suggestionsBuilder;

  @override
  State<AppSearchAnchor> createState() => _AppSearchAnchorState();
}

class _AppSearchAnchorState extends State<AppSearchAnchor> {
  final SearchController _searchController = SearchController();
  String _searchText = '';
  Iterable<Widget> _suggestions = [];

  late final PentaDebounceable<void, String> _fetchSuggestions =
      PentaDebouncer.debounce(
    debounceDuration: const Duration(milliseconds: 1000),
    function: (query) async {
      if (_searchText == query) return;
      _searchText = query;

      if (query.isEmpty) {
        _suggestions = [];
        return;
      }

      _suggestions = await widget.suggestionsBuilder(query);
    },
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (value) {
          setState(() {
            _searchController.clear();
            FocusScope.of(context).unfocus();
          });
        }
      },
      child: SearchAnchor.bar(
        isFullScreen: true,
        textInputAction: TextInputAction.search,
        searchController: _searchController,
        suggestionsBuilder: (context, controller) async {
          await _fetchSuggestions.call(controller.text);
          return _suggestions;
        },
        barBackgroundColor: WidgetStatePropertyAll(
          context.appThemeExt.appColors.white.byBrightness(
            context.ext.theme.isDark ^ widget.reverseColor,
          ),
        ),
        barTextStyle: WidgetStatePropertyAll(
          context.ext.theme.textTheme.bodyLarge?.copyWith(
            color: context.appThemeExt.appColors.white
                .byBrightness(
                  context.ext.theme.isDark ^ widget.reverseColor,
                )
                .onColor,
          ),
        ),
        barShape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: context.ext.radius.border.all.sm,
          ),
        ),
        barLeading: Icon(
          AppIcons.search,
          color: context.appThemeExt.appColors.white
              .byBrightness(
                context.ext.theme.isDark ^ widget.reverseColor,
              )
              .onColor,
        ),
        barPadding: WidgetStatePropertyAll(context.ext.padding.horizontal.lg),
        viewHintText: widget.hintText,
        viewBackgroundColor: context.appThemeExt.appColors.background
            .byBrightness(context.ext.theme.isDark),
        viewHeaderTextStyle: context.ext.theme.textTheme.bodyLarge?.copyWith(
          color: context.appThemeExt.appColors.background
              .byBrightness(context.ext.theme.isDark)
              .onColor,
        ),
        barHintText: widget.hintText,
      ),
    );
  }
}

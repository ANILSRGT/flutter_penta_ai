part of '../home_page.dart';

class _HomePageBodyRecentMakesTitle extends StatelessWidget {
  const _HomePageBodyRecentMakesTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Recent Images',
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

part of '../home_page.dart';

class _HomePageBodyTitle extends StatelessWidget {
  const _HomePageBodyTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Transform Your\nDreams Into Visuals',
      style: context.ext.theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

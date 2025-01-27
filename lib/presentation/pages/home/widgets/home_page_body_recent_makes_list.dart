part of '../home_page.dart';

class _HomePageBodyRecentMakesList extends StatelessWidget {
  const _HomePageBodyRecentMakesList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.ext.screen.width ~/ 200,
        crossAxisSpacing: context.ext.values.lg,
        mainAxisSpacing: context.ext.values.lg,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return const PromptImageCard();
      },
    );
  }
}

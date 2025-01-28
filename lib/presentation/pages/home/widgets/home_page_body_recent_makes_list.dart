part of '../home_page.dart';

class _HomePageBodyRecentMakesList extends StatelessWidget {
  const _HomePageBodyRecentMakesList();

  @override
  Widget build(BuildContext context) {
    final images = context.watch<TextToImagesNotifider>().textToImages;

    if (images?.isEmpty ?? true) {
      return const Center(
        child: Text('No images found'),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.ext.screen.width ~/ 200,
        crossAxisSpacing: context.ext.values.lg,
        mainAxisSpacing: context.ext.values.lg,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final image = images[index];
        return PromptImageCard(model: image);
      },
    );
  }
}

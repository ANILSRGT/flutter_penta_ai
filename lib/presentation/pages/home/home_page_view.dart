part of 'home_page.dart';

class _HomePageView extends StatelessWidget with _HomePageViewMixin {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomePageBody(
        onGenerateImage: (prompt) => _onGenerateImage(context, prompt),
      ),
    );
  }
}

part of '../home_page.dart';

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    required this.onGenerateImage,
    required this.refreshPage,
  });

  final void Function(String prompt) onGenerateImage;
  final AsyncCallback refreshPage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          await refreshPage();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const CustomAppbar(),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: context.ext.padding.horizontal.xl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        context.ext.sizedBox.height.lg,
                        const _HomePageBodyTitle(),
                        context.ext.sizedBox.height.xl,
                        _HomePageBodyPromptField(
                          onGenerateImage: onGenerateImage,
                        ),
                        context.ext.sizedBox.height.xl,
                        const _HomePageBodyRecentMakesTitle(),
                        context.ext.sizedBox.height.md,
                        const _HomePageBodyRecentMakesList(),
                        context.ext.sizedBox.height.xl,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

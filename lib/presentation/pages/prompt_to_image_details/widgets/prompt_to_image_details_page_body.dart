part of '../prompt_to_image_details_page.dart';

class _PromptToImageDetailsPageBody extends StatelessWidget {
  const _PromptToImageDetailsPageBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: LayoutBuilder(
          builder: (_, cst) {
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 500,
                    minHeight: cst.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: context.ext.padding.horizontal.xl,
                      child: Column(
                        children: [
                          context.ext.sizedBox.height.lg,
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              constraints: BoxConstraints(
                                maxHeight: context.ext.screen.byOrientation(
                                  portrait: double.infinity,
                                  landscape: context.ext.screen.height * 0.6,
                                ),
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius:
                                      context.ext.radius.border.all.xl3,
                                  child: CustomNetworkImage(
                                    imageUrl:
                                        'https://picsum.photos/1080/1920?random=${DateTime.now().millisecondsSinceEpoch}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          context.ext.sizedBox.height.xl3,
                          Row(
                            spacing: context.ext.values.md,
                            children: [
                              Expanded(
                                child: AppElevatedButton.outlined(
                                  onPressed: () {},
                                  child: const Text('Share'),
                                ),
                              ),
                              Expanded(
                                child: AppElevatedButton.primary(
                                  onPressed: () {},
                                  child: const Text('Download'),
                                ),
                              ),
                            ],
                          ),
                          context.ext.sizedBox.height.xl,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

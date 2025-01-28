part of '../prompt_to_image_details_page.dart';

class _PromptToImageDetailsPageBody extends StatelessWidget {
  const _PromptToImageDetailsPageBody({
    required this.model,
  });

  final TextToImagesModel model;

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
                                  child: Image.memory(
                                    model.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          context.ext.sizedBox.height.xl,
                          AppExpansionTile(
                            backgroundColor:
                                context.appThemeExt.appColors.darkGrey,
                            foregroundColor:
                                context.appThemeExt.appColors.darkGrey.onColor,
                            title: 'Prompt',
                            content: [
                              Text(
                                model.prompt,
                                style: context.ext.theme.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: context
                                      .appThemeExt.appColors.darkGrey.onColor,
                                ),
                              ),
                            ],
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

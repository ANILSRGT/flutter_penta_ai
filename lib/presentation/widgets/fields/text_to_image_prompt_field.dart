import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:penta_ai/core/configs/constants/app_configs.dart';
import 'package:penta_ai/core/configs/theme/i_app_theme.dart';
import 'package:penta_ai/presentation/widgets/buttons/app_elevated_button.dart';
import 'package:penta_core/penta_core.dart';

class TextToImagePromptField extends StatefulWidget {
  const TextToImagePromptField({
    required this.onGenerateImage,
    super.key,
    this.onTextChanged,
  });

  final void Function(String prompt)? onTextChanged;
  final void Function(String prompt) onGenerateImage;

  @override
  State<TextToImagePromptField> createState() => _TextToImagePromptFieldState();
}

class _TextToImagePromptFieldState extends State<TextToImagePromptField> {
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.ext.radius.border.all.xl,
        border: Border.all(
          color: context.appThemeExt.appColors.primary,
        ),
      ),
      child: Padding(
        padding: context.ext.padding.all.md,
        child: Column(
          spacing: context.ext.values.xl,
          children: [
            TextField(
              controller: _promptController,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 4,
              maxLength: AppConfigs.textToImagePromptMaxLen,
              style: context.ext.theme.textTheme.bodyLarge,
              inputFormatters: [
                LengthLimitingTextInputFormatter(
                  AppConfigs.textToImagePromptMaxLen,
                ),
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                widget.onTextChanged?.call(value);
              },
              decoration: const InputDecoration(
                hintText: "Let's make your dreams...",
                border: InputBorder.none,
              ),
            ),
            LayoutBuilder(
              builder: (_, cst) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 175),
                    child: AppElevatedButton.primary(
                      onPressed: () {
                        final prompt = _promptController.text;
                        widget.onGenerateImage(prompt);
                        _promptController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child: const Text('Generate Image'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

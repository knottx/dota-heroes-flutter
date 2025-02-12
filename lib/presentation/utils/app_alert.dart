import 'package:dota_heroes/app/core/app_error.dart';
import 'package:dota_heroes/generated/app_localizations.dart';
import 'package:dota_heroes/presentation/style/app_colors.dart';
import 'package:dota_heroes/presentation/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AppAlert {
  AppAlert._();

  static void error(
    BuildContext context, {
    required Object? error,
    bool barrierDismissible = true,
    VoidCallback? onAction,
  }) {
    String? errorTitle;
    String? errorMessage;

    if (error is AppError) {
      errorMessage = error.message;
    }

    errorTitle ??= AppLocalizations.of(context).error_title;
    errorMessage ??= error.toString();

    AppAlert.dialog(
      context,
      title: errorTitle,
      message: errorMessage,
      barrierDismissible: barrierDismissible,
      onAction: onAction,
    );
  }

  static void dialog(
    BuildContext context, {
    String? title,
    String? message,
    bool barrierDismissible = true,
    VoidCallback? onAction,
  }) {
    AppAlert.dialogActions(
      context,
      title: title,
      message: message,
      barrierDismissible: barrierDismissible,
      alertActions: [
        AppAlertAction(
          isDefaultAction: true,
          title: AppLocalizations.of(context).common_ok,
          onAction: onAction,
        ),
      ],
    );
  }

  static void dialogActions(
    BuildContext context, {
    required String? title,
    String? message,
    String? debugMessage,
    bool barrierDismissible = true,
    required List<AppAlertAction> alertActions,
  }) {
    HapticFeedback.lightImpact();

    showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.all(32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      title,
                      style: AppTextStyle.w600(18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      message,
                      style: AppTextStyle.w400(16),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (debugMessage != null && debugMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      debugMessage,
                      style: AppTextStyle.w400(12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: alertActions.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: e.button(dialogContext),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AppAlertAction {
  final String title;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final bool closeAndAction;
  final VoidCallback? onAction;

  AppAlertAction({
    required this.title,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.closeAndAction = true,
    this.onAction,
  });

  Widget button(BuildContext dialogContext) {
    void onPressed() {
      if (closeAndAction) {
        dialogContext.pop();
      }
      if (onAction != null) {
        onAction!();
      }
    }

    return (isDestructiveAction)
        ? FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size.fromHeight(48),
            ),
            child: Text(
              title,
              style: AppTextStyle.w600(16).colorWhite,
            ),
          )
        : (isDefaultAction)
            ? FilledButton(
                onPressed: onPressed,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  foregroundColor: AppColors.primaryBlack,
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  title,
                  style: AppTextStyle.w600(16).colorWhite,
                ),
              )
            : OutlinedButton(
                onPressed: onPressed,
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  side: const BorderSide(
                    width: 1,
                    color: Colors.white30,
                  ),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  title,
                  style: AppTextStyle.w600(16).colorWhite,
                ),
              );
  }
}

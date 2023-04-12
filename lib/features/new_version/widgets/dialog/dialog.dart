// ignore_for_file: avoid_classes_with_only_static_members

import 'package:annai_store/core/constants/constants.dart';
import 'package:annai_store/features/loader/cubit/cubit/loader_cubit.dart';
import 'package:annai_store/features/new_version/cubit/version_cubit.dart';
import 'package:annai_store/features/new_version/models/version.dart';
import 'package:annai_store/utils/navigation_service.dart';
import 'package:custom/custom_text.dart';
import 'package:custom/ftn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VersionUpdateDialog {
  static Future showUpdateDialog(
    BuildContext context,
    NewVersionModel newVersionModel,
  ) async {
    if (context.mounted) {
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: CustomText("What's New in ${newVersionModel.version}"),
            contentPadding: const EdgeInsets.all(10),
            children: [
              if (newVersionModel.description != null)
                ...(newVersionModel.description ?? [])
                    .map(
                      (e) => Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(width: 5),
                          CustomText(e, color: Colors.grey[600])
                        ],
                      ),
                    )
                    .toList(),
              const SizedBox(height: 10),
              CustomTextButton(
                "Update",
                backgoundColor: kPrimaryColor,
                textColor: Colors.white,
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    context.read<LoaderCubit>().updateLoading(2);
                    await context
                        .read<VersionCubit>()
                        .downloadNewVersion(context);
                  } catch (e, s) {
                    print(s);
                    CustomUtilies.customFailureSnackBar(
                      "Error",
                      "Error when downloading the new version",
                    );
                  }

                  // ignore: avoid_dynamic_calls
                  NavigationService.navigatorKey.currentContext
                      ?.read<LoaderCubit>()
                      .updateLoading(100);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

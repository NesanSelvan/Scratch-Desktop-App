import 'package:annai_store/enum/application.dart';
import 'package:annai_store/features/new_version/cubit/version_cubit.dart';
import 'package:annai_store/features/new_version/widgets/dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUpdateButton extends StatelessWidget {
  const AppUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VersionCubit, VersionState>(
      builder: (context, state) {
        if ((state.versionModel?.version ?? 0) > Application.version()) {
          return GestureDetector(
            onTap: () {
              // context.read<VersionCubit>().downloadNewVersion();
              if (state.versionModel != null) {
                VersionUpdateDialog.showUpdateDialog(
                  context,
                  state.versionModel!,
                );
              }
            },
            child: Column(
              children: const [
                Icon(
                  Icons.system_update,
                  color: Colors.green,
                ),
                Text(
                  "Update Available",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

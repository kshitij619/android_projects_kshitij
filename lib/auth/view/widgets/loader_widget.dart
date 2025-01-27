import 'package:flutter/material.dart';
import 'package:local_database/auth/view_model/create_account_view_model.dart';
import 'package:provider/provider.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<CreateAccountViewModel>().isLoading;

    if (isLoading) {
      return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.black.withValues(alpha: 0.8),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

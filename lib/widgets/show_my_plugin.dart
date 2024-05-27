import 'package:flutter/material.dart';
import 'package:show_toast_when_fetch_data_api/show_toast_when_fetch_data_api_method_channel.dart';

class ShowMyPlugin extends StatelessWidget {
  const ShowMyPlugin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await MethodChannelShowToastWhenFetchDataApi().getDataApi();
      },
      child: const Text('Plugin'),
    );
  }
}
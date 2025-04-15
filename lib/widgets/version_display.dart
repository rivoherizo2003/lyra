import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionDisplay extends StatelessWidget {
  final TextStyle? style;

  const VersionDisplay({Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('V${snapshot.data!.version}',
                style: style ?? TextStyle(fontSize: 12, color: Colors.grey));
          }
          return SizedBox.shrink();
        });
  }
}

import 'package:flutter_ui_base/common_libs.dart';
import 'package:permission_handler/permission_handler.dart';

import 'enums.dart';

class PermissionsDialogModel {
  final PermissionType permissionType;
  final VoidCallback onAllowed;
  final VoidCallback onDenied;
  final PermissionsDialogFlow permissionFlow;

  PermissionsDialogModel({
    required this.permissionType,
    required this.onAllowed,
    required this.onDenied,
    required this.permissionFlow,
  });

  List<AppIcons> get icons {
    switch (permissionType) {
      case PermissionType.camera:
        return [AppIcons.camera];
      case PermissionType.audio:
        return [AppIcons.mic];
    }
  }

  String get title {
    switch (permissionType) {
      case PermissionType.camera:
        return $strings.cameraPermissionTitle;
      case PermissionType.audio:
        return $strings.voicePermissionTitle;
    }
  }

  String get description {
    switch (permissionType) {
      case PermissionType.camera:
        return $strings.cameraPermissionDescription;
      case PermissionType.audio:
        return $strings.voicePermissionDescription;
    }
  }

  List<Permission> get permissions {
    switch (permissionType) {
      case PermissionType.camera:
        return [Permission.camera];
      case PermissionType.audio:
        return [Permission.microphone, Permission.speech];
    }
  }
}

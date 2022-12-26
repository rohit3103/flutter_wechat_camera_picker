// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:camera/camera.dart' show CameraLensDirection, FlashMode;
import 'package:flutter/rendering.dart';

/// All text delegates.
const List<CameraPickerTextDelegate> cameraPickerTextDelegates =
    <CameraPickerTextDelegate>[
  CameraPickerTextDelegate(),
  EnglishCameraPickerTextDelegate(),
];

/// Obtain the text delegate from the given locale.
CameraPickerTextDelegate cameraPickerTextDelegateFromLocale(Locale? locale) {
  if (locale == null) {
    return const CameraPickerTextDelegate();
  }
  final String languageCode = locale.languageCode.toLowerCase();
  for (final CameraPickerTextDelegate delegate in cameraPickerTextDelegates) {
    if (delegate.languageCode == languageCode) {
      return delegate;
    }
  }
  return const CameraPickerTextDelegate();
}

/// Text delegate implemented with Chinese.
/// 中文文字实现
class CameraPickerTextDelegate {
  const CameraPickerTextDelegate();

  String get languageCode => 'en';

  /// Confirm string for the confirm button.
  /// 确认按钮的字段
  String get confirm => 'Confirm';

  /// Tips above the shooting button before shooting.
  /// 拍摄前确认按钮上方的提示文字
  String get shootingTips => 'tap to take photo';

  /// Tips with recording above the shooting button before shooting.
  /// 拍摄前确认按钮上方的提示文字（带录像）
  String get shootingWithRecordingTips =>
      'Tap to take a photo, long press to record';

  /// Tips with only recording above the shooting button before shooting.
  /// 拍摄前确认按钮上方的提示文字（仅录像）
  String get shootingOnlyRecordingTips => 'long press camera';

  /// Tips with tap recording above the shooting button before shooting.
  /// 拍摄前确认按钮上方的提示文字（点击录像）
  String get shootingTapRecordingTips => 'touch camera';

  /// Load failed string for item.
  /// 资源加载失败时的字段
  String get loadFailed => 'Failed to load';

  /// Default loading string for the dialog.
  /// 加载中弹窗的默认文字
  String get loading => 'Loading…';

  /// Saving string for the dialog.
  /// 保存中弹窗的默认文字
  String get saving => 'saving…';

  /// Semantics fields.
  ///
  /// Fields below are only for semantics usage. For customizable these fields,
  /// head over to [EnglishCameraPickerTextDelegate] for better understanding.
  String get sActionManuallyFocusHint => 'manual focus';

  String get sActionPreviewHint => 'preview';

  String get sActionRecordHint => 'video';

  String get sActionShootHint => 'Photograph';

  String get sActionShootingButtonTooltip => 'photo button';

  String get sActionStopRecordingHint => 'stop recording';

  String sCameraLensDirectionLabel(CameraLensDirection value) {
    switch (value) {
      case CameraLensDirection.front:
        return '前置';
      case CameraLensDirection.back:
        return '后置';
      case CameraLensDirection.external:
        return '外置';
    }
  }

  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return '${sCameraLensDirectionLabel(value)}画面预览';
  }

  String sFlashModeLabel(FlashMode mode) {
    final String modeString;
    switch (mode) {
      case FlashMode.off:
        modeString = '关闭';
        break;
      case FlashMode.auto:
        modeString = '自动';
        break;
      case FlashMode.always:
        modeString = '拍照时闪光';
        break;
      case FlashMode.torch:
        modeString = '始终闪光';
        break;
    }
    return '闪光模式: $modeString';
  }

  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) {
    return '切换至${sCameraLensDirectionLabel(value)}摄像头';
  }
}

/// Text delegate implements with English.
class EnglishCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const EnglishCameraPickerTextDelegate();

  @override
  String get languageCode => 'en';

  @override
  String get confirm => 'Confirm';

  @override
  String get shootingTips => 'Tap to take photo.';

  @override
  String get shootingWithRecordingTips =>
      'Tap to take photo. Long press to record video.';

  @override
  String get shootingOnlyRecordingTips => 'Long press to record video.';

  @override
  String get shootingTapRecordingTips => 'Tap to record video.';

  @override
  String get loadFailed => 'Load failed';

  @override
  String get loading => 'Loading...';

  @override
  String get saving => 'Saving...';

  @override
  String get sActionManuallyFocusHint => 'manually focus';

  @override
  String get sActionPreviewHint => 'preview';

  @override
  String get sActionRecordHint => 'record';

  @override
  String get sActionShootHint => 'take picture';

  @override
  String get sActionShootingButtonTooltip => 'shooting button';

  @override
  String get sActionStopRecordingHint => 'stop recording';

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return '${sCameraLensDirectionLabel(value)} camera preview';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => 'Flash mode: ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      'Switch to the ${sCameraLensDirectionLabel(value)} camera';
}

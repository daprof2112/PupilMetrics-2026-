// lib/utils/usb_camera_utils.dart
// USB Camera name lookup and cleanup utilities
// v1.0.0

/// Known USB camera devices by VID (Vendor ID) and PID (Product ID)
/// Add more devices as you encounter them!
class UsbCameraDatabase {

  // VID/PID lookup table - Format: 'vid_pid' -> 'Friendly Name'
  static const Map<String, String> _knownDevices = {
    // Dino-Lite devices (VID: a168)
    'a168_0879': 'Dino-Lite Premier',
    'a168_0878': 'Dino-Lite Pro',
    'a168_0877': 'Dino-Lite Basic',
    'a168_0876': 'Dino-Lite Edge',
    'a168_0875': 'Dino-Lite AM4113',
    'a168_0874': 'Dino-Lite AM7115',
    'a168_0873': 'Dino-Lite AM4515',

    // Generic UVC cameras (common VIDs)
    '046d_0825': 'Logitech Webcam C270',
    '046d_082d': 'Logitech HD Pro C920',
    '046d_0843': 'Logitech Brio',
    '045e_0779': 'Microsoft LifeCam HD-3000',
    '1bcf_2883': 'Generic USB Camera',

    // Add more as needed...
  };

  /// Get friendly name for a camera from its raw name or description
  static String getFriendlyName(String? rawName) {
    if (rawName == null || rawName.isEmpty) {
      return 'USB Camera';
    }

    // Try to extract VID/PID from the raw name
    final vidPid = _extractVidPid(rawName);
    if (vidPid != null) {
      final lookup = _knownDevices[vidPid];
      if (lookup != null) {
        return lookup;
      }
    }

    // If name contains a known brand, extract just the brand part
    final cleanedName = _cleanRawName(rawName);
    if (cleanedName.isNotEmpty) {
      return cleanedName;
    }

    // Fallback
    return 'USB Camera';
  }

  /// Extract VID and PID from USB device string
  /// Handles formats like:
  ///   - "vid_a168&pid_0879"
  ///   - "\\?\usb#vid_a168&pid_0879&mi_00#..."
  static String? _extractVidPid(String rawName) {
    final lower = rawName.toLowerCase();

    // Pattern: vid_XXXX and pid_XXXX
    final vidMatch = RegExp(r'vid[_:]([0-9a-f]{4})', caseSensitive: false).firstMatch(lower);
    final pidMatch = RegExp(r'pid[_:]([0-9a-f]{4})', caseSensitive: false).firstMatch(lower);

    if (vidMatch != null && pidMatch != null) {
      final vid = vidMatch.group(1)!;
      final pid = pidMatch.group(1)!;
      return '${vid}_$pid';
    }

    return null;
  }

  /// Clean up raw camera name by removing USB path junk
  static String _cleanRawName(String rawName) {
    // If it starts with a known brand, extract that
    final knownBrands = ['Dino-Lite', 'Logitech', 'Microsoft', 'Razer', 'Creative'];

    for (final brand in knownBrands) {
      if (rawName.contains(brand)) {
        // Try to extract brand + model
        final brandIndex = rawName.indexOf(brand);
        var endIndex = rawName.indexOf('<', brandIndex);
        if (endIndex == -1) endIndex = rawName.indexOf('\\', brandIndex);
        if (endIndex == -1) endIndex = rawName.indexOf('#', brandIndex);
        if (endIndex == -1) endIndex = rawName.length;

        final extracted = rawName.substring(brandIndex, endIndex).trim();
        if (extracted.isNotEmpty) {
          return extracted;
        }
      }
    }

    // Remove common USB path patterns
    var cleaned = rawName
        .replaceAll(RegExp(r'<\\\\[^>]+>'), '') // Remove <\\?\usb...>
        .replaceAll(RegExp(r'\\\\[?]\\usb#[^#]+#[^#]+#[^#]+'), '')
        .replaceAll(RegExp(r'#\{[^}]+\}'), '') // Remove #{guid}
        .replaceAll(RegExp(r'&mi_\d+'), '') // Remove &mi_XX
        .replaceAll(RegExp(r'vid_[0-9a-f]+', caseSensitive: false), '')
        .replaceAll(RegExp(r'pid_[0-9a-f]+', caseSensitive: false), '')
        .replaceAll(RegExp(r'[&#{}<>\\]'), ' ') // Replace special chars with space
        .replaceAll(RegExp(r'\s+'), ' ') // Collapse multiple spaces
        .trim();

    // If we end up with just numbers/garbage, return empty
    if (cleaned.isEmpty || RegExp(r'^[\d\s]+$').hasMatch(cleaned)) {
      return '';
    }

    return cleaned;
  }

  /// Get device info including VID/PID if available
  static CameraDeviceInfo getDeviceInfo(String? rawName) {
    final vidPid = rawName != null ? _extractVidPid(rawName) : null;
    String? vid, pid;

    if (vidPid != null) {
      final parts = vidPid.split('_');
      vid = parts[0].toUpperCase();
      pid = parts[1].toUpperCase();
    }

    return CameraDeviceInfo(
      rawName: rawName ?? 'Unknown',
      friendlyName: getFriendlyName(rawName),
      vendorId: vid,
      productId: pid,
      isKnownDevice: vidPid != null && _knownDevices.containsKey(vidPid),
    );
  }
}

/// Camera device information
class CameraDeviceInfo {
  final String rawName;
  final String friendlyName;
  final String? vendorId;
  final String? productId;
  final bool isKnownDevice;

  CameraDeviceInfo({
    required this.rawName,
    required this.friendlyName,
    this.vendorId,
    this.productId,
    this.isKnownDevice = false,
  });

  String get displayName => friendlyName;

  String get technicalInfo {
    if (vendorId != null && productId != null) {
      return 'VID:$vendorId PID:$productId';
    }
    return '';
  }

  @override
  String toString() => '$friendlyName ${technicalInfo.isNotEmpty ? "($technicalInfo)" : ""}';
}
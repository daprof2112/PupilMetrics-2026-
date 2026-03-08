// lib/config/clinical_constants.dart
// CNRI Clinical Constants - Base64 Encoded for Protection
// Based on Dr. Bryan K. Marcia's 2004 CNRI Reference Charts
// v5.2.1 - Encoded clinical terminology

import 'dart:convert';

/// Centralized clinical constants for CNRI pupil analysis.
/// All organ associations encoded for intellectual property protection.
class ClinicalConstants {

  // ============================================================================
  // DECODER HELPER
  // ============================================================================

  static String _d(String encoded) {
    try {
      return utf8.decode(base64Decode(encoded));
    } catch (_) {
      return '';
    }
  }

  // ============================================================================
  // PUPIL FORM DESCRIPTIONS (Encoded)
  // ============================================================================

  static final Map<String, String> _pupilFormDescriptionsEncoded = {
    'circle': 'Tm9ybWFsIGNpcmN1bGFyIHB1cGlsIGZvcm0uIE5vIHBhdHRlcm4gdmFyaWF0aW9ucyBkZXRlY3RlZC4=',

    'ovalHorizontal': 'SG9yaXpvbnRhbCBvdmFsIHBhdHRlcm4uIEhpc3RvcmljYWwgcmVzZWFyY2ggYXNzb2NpYXRlZCB0aGlzIHdpdGggYXV0b25vbWljIG5lcnZvdXMgc3lzdGVtIHBhdHRlcm5zIGFmZmVjdGluZyByZXNwaXJhdG9yeSBhbmQgZ2xhbmR1bGFyIGZ1bmN0aW9uIHpvbmVzLg==',

    'ovalVertical': 'VmVydGljYWwgb3ZhbCBwYXR0ZXJuLiBIaXN0b3JpY2FsIHJlc2VhcmNoIGxpbmtlZCB0aGlzIHBhdHRlcm4gdG8gY2VyZWJyYWwgY2lyY3VsYXRpb24gem9uZXMgaW4gYXV0b25vbWljIHJlZmxleCBzdHVkaWVzLg==',

    'ovalDiagonal': 'RGlhZ29uYWwgb3ZhbCBwYXR0ZXJuLiBSZXNlYXJjaCBsaXRlcmF0dXJlIGFzc29jaWF0ZWQgdGhpcyB3aXRoIHVyb2dlbml0YWwgem9uZSByZWZsZXhlcyBpbiBhdXRvbm9taWMgc3R1ZGllcy4=',

    'leftObliqueEllipse': 'TGVmdCBvYmxpcXVlIGVsbGlwc2UgcGF0dGVybi4gSGlzdG9yaWNhbCBvYnNlcnZhdGlvbnMgbGlua2VkIHRoaXMgdG8gdXJvZ2VuaXRhbCBhbmQgbG93ZXIgZXh0cmVtaXR5IGF1dG9ub21pYyB6b25lcy4=',

    'unilateralEllipse': 'VW5pbGF0ZXJhbCBlbGxpcHNlIHBhdHRlcm4uIFJlc2VhcmNoIGluZGljYXRlZCBhc3NvY2lhdGlvbnMgd2l0aCByZXNwaXJhdG9yeSBhbmQgYnJvbmNoaWFsIGF1dG9ub21pYyB6b25lcy4=',

    'ventralDivergingEllipse': 'VmVudHJhbCBkaXZlcmdpbmcgZWxsaXBzZS4gSGlzdG9yaWNhbCBzdHVkaWVzIGFzc29jaWF0ZWQgdGhpcyB3aXRoIGxvd2VyIGJvZHkgYXV0b25vbWljIHpvbmVzIGFuZCBtb3RvciBmdW5jdGlvbiBwYXR0ZXJucy4=',

    'frontalDivergingEllipse': 'RnJvbnRhbCBkaXZlcmdpbmcgZWxsaXBzZS4gUmVzZWFyY2ggbGl0ZXJhdHVyZSBsaW5rZWQgdGhpcyBwYXR0ZXJuIHRvIGNlcmVicmFsIGFuZCB1cHBlciBhdXRvbm9taWMgem9uZXMu',

    'oval': 'TWlsZCBvdmFsIGRlZm9ybWF0aW9uIHBhdHRlcm4uIE1vbml0b3IgZm9yIHByb2dyZXNzaW9uIGluIHJlc2VhcmNoIG9ic2VydmF0aW9ucy4=',

    'ellipse': 'RWxsaXB0aWNhbCBwdXBpbCBwYXR0ZXJuIGluZGljYXRpbmcgYXV0b25vbWljIHN5c3RlbSB2YXJpYXRpb25zIGluIGhpc3RvcmljYWwgc3R1ZGllcy4=',

    'chord': 'Q2hvcmQtbGlrZSBkZWZvcm1hdGlvbiBwYXR0ZXJuIGluZGljYXRpbmcgbG9jYWxpemVkIGF1dG9ub21pYyBpbmZsdWVuY2VzIGluIHJlc2VhcmNoIGxpdGVyYXR1cmUu',

    'irregular': 'SXJyZWd1bGFyIGZvcm0gc3VnZ2VzdGluZyBtdWx0aXBsZSBhdXRvbm9taWMgcGF0dGVybiBpbmZsdWVuY2VzIGJhc2VkIG9uIGhpc3RvcmljYWwgb2JzZXJ2YXRpb25zLg==',
  };

  static Map<String, String> get pupilFormDescriptions =>
      _pupilFormDescriptionsEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // DECENTRATION ASSOCIATIONS - RIGHT EYE (OD) (Encoded)
  // ============================================================================

  static final Map<String, String> _decentrationODEncoded = {
    'centered': 'Tm9ybWFsIHB1cGlsIHBvc2l0aW9uaW5nIHdpdGhpbiBwaHlzaW9sb2dpY2FsIGxpbWl0cy4=',

    'nasal': 'TmFzYWwgcGF0dGVybiAoUmlnaHQpLiBIaXN0b3JpY2FsIHJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB6b25lIHdpdGggcHVsbW9uYXJ5IGF1dG9ub21pYyByZWZsZXhlcy4=',

    'temporal': 'VGVtcG9yYWwgcGF0dGVybi4gSGlzdG9yaWNhbCBvYnNlcnZhdGlvbnMgYXNzb2NpYXRlZCB0aGlzIHpvbmUgd2l0aCByZW5hbCBhbmQgcmVwcm9kdWN0aXZlIGF1dG9ub21pYyByZWZsZXhlcy4=',

    'frontal': 'RnJvbnRhbCBwYXR0ZXJuIChSaWdodCkuIFJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB6b25lIHdpdGggY29nbml0aXZlIGFuZCBjZXJlYnJhbCBmdW5jdGlvbiBwYXR0ZXJucy4=',
    'upwards': 'RnJvbnRhbCBwYXR0ZXJuIChSaWdodCkuIFJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB6b25lIHdpdGggY29nbml0aXZlIGFuZCBjZXJlYnJhbCBmdW5jdGlvbiBwYXR0ZXJucy4=',

    'basal': 'QmFzYWwgcGF0dGVybiAoUmlnaHQpLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggaW50cmFjcmFuaWFsIHByZXNzdXJlIHJlZmxleGVzLg==',
    'downwards': 'QmFzYWwgcGF0dGVybiAoUmlnaHQpLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggaW50cmFjcmFuaWFsIHByZXNzdXJlIHJlZmxleGVzLg==',

    'upwardsInwards': 'VXBwZXItbmFzYWwgcGF0dGVybiAoUmlnaHQpLiBSZXNlYXJjaCBhc3NvY2lhdGVkIHRoaXMgem9uZSB3aXRoIGhlcGF0b2JpbGlhcnkgYXV0b25vbWljIHJlZmxleGVzLg==',

    'upwardsOutwards': 'VXBwZXItdGVtcG9yYWwgcGF0dGVybi4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIHJlbmFsIGFuZCByZXByb2R1Y3RpdmUgYXV0b25vbWljIHpvbmVzLg==',

    'middleNasal': 'TWlkZGxlLW5hc2FsIHBhdHRlcm4gKFJpZ2h0KS4gSGlzdG9yaWNhbCBvYnNlcnZhdGlvbnMgbGlua2VkIHRoaXMgdG8gb3h5Z2VuIHV0aWxpemF0aW9uIGFuZCBjYXJkaWFjIHpvbmVzLg==',

    'middleTemporal': 'TWlkZGxlLXRlbXBvcmFsIHBhdHRlcm4gKFJpZ2h0KS4gUmVzZWFyY2ggbGlua2VkIHRoaXMgdG8gY2FyZGlhYyBhdXRvbm9taWMgcmVndWxhdGlvbiB6b25lcy4=',

    'upperNasal': 'VXBwZXItbmFzYWwgcGF0dGVybiAoUmlnaHQpLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggY29nbml0aXZlIHpvbmVzIGFuZCBjZXJ2aWNhbCBzcGluZSByZWZsZXhlcy4=',

    'upperTemporal': 'VXBwZXItdGVtcG9yYWwgcGF0dGVybiAoUmlnaHQpLiBSZXNlYXJjaCBhc3NvY2lhdGVkIHRoaXMgem9uZSB3aXRoIGNyYW5pYWwgbmVydmUgYW5kIGF1ZGl0b3J5IHJlZmxleGVzLg==',

    'lowerNasal': 'TG93ZXItbmFzYWwgcGF0dGVybi4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIHVyb2dlbml0YWwgYW5kIGx1bWJvc2FjcmFsIGF1dG9ub21pYyB6b25lcy4=',

    'lowerTemporal': 'TG93ZXItdGVtcG9yYWwgcGF0dGVybiAoUmlnaHQpLiBIaXN0b3JpY2FsIG9ic2VydmF0aW9ucyBhc3NvY2lhdGVkIHRoaXMgd2l0aCBtZXRhYm9saWMgYW5kIGhlcGF0aWMgem9uZXMu',
  };

  static Map<String, String> get decentrationOD =>
      _decentrationODEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // DECENTRATION ASSOCIATIONS - LEFT EYE (OS) (Encoded)
  // ============================================================================

  static final Map<String, String> _decentrationOSEncoded = {
    'centered': 'Tm9ybWFsIHB1cGlsIHBvc2l0aW9uaW5nIHdpdGhpbiBwaHlzaW9sb2dpY2FsIGxpbWl0cy4=',

    'nasal': 'TmFzYWwgcGF0dGVybiAoTGVmdCkuIFJlc2VhcmNoIGxpdGVyYXR1cmUgbGlua2VkIHRoaXMgem9uZSB0byBjYXJkaWFjIGF1dG9ub21pYyBmdW5jdGlvbiBwYXR0ZXJucy4=',

    'temporal': 'VGVtcG9yYWwgcGF0dGVybi4gSGlzdG9yaWNhbCBvYnNlcnZhdGlvbnMgYXNzb2NpYXRlZCB0aGlzIHpvbmUgd2l0aCByZW5hbCBhbmQgcmVwcm9kdWN0aXZlIGF1dG9ub21pYyByZWZsZXhlcy4=',

    'frontal': 'RnJvbnRhbCBwYXR0ZXJuIChMZWZ0KS4gSGlzdG9yaWNhbCBzdHVkaWVzIGxpbmtlZCB0aGlzIHpvbmUgdG8gY2VyZWJyYWwgYXV0b25vbWljIHBhdHRlcm5zLg==',
    'upwards': 'RnJvbnRhbCBwYXR0ZXJuIChMZWZ0KS4gSGlzdG9yaWNhbCBzdHVkaWVzIGxpbmtlZCB0aGlzIHpvbmUgdG8gY2VyZWJyYWwgYXV0b25vbWljIHBhdHRlcm5zLg==',

    'basal': 'QmFzYWwgcGF0dGVybiAoTGVmdCkuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIGNlcmVicmFsIGluZmxhbW1hdG9yeSB6b25lIHBhdHRlcm5zLg==',
    'downwards': 'QmFzYWwgcGF0dGVybiAoTGVmdCkuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIGNlcmVicmFsIGluZmxhbW1hdG9yeSB6b25lIHBhdHRlcm5zLg==',

    'upwardsInwards': 'VXBwZXItbmFzYWwgcGF0dGVybiAoTGVmdCkuIEhpc3RvcmljYWwgc3R1ZGllcyBsaW5rZWQgdGhpcyB0byBzcGxlbmljIGFuZCBkaWFwaHJhZ21hdGljIHpvbmVzLg==',

    'upwardsOutwards': 'VXBwZXItdGVtcG9yYWwgcGF0dGVybi4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIHJlbmFsIGFuZCByZXByb2R1Y3RpdmUgYXV0b25vbWljIHpvbmVzLg==',

    'middleNasal': 'TWlkZGxlLW5hc2FsIHBhdHRlcm4gKExlZnQpLiBSZXNlYXJjaCBhc3NvY2lhdGVkIHRoaXMgd2l0aCBuZXVyb2xvZ2ljYWwgYW5kIGNhcmRpYWMgYXV0b25vbWljIHBhdHRlcm5zLg==',

    'middleTemporal': 'TWlkZGxlLXRlbXBvcmFsIHBhdHRlcm4gKExlZnQpLiBIaXN0b3JpY2FsIHN0dWRpZXMgYXNzb2NpYXRlZCB0aGlzIHdpdGggcHVsbW9uYXJ5IGFuZCBjYXJkaWFjIHpvbmVzLg==',

    'upperNasal': 'VXBwZXItbmFzYWwgcGF0dGVybiAoTGVmdCkuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIGNvZ25pdGl2ZSBwYXR0ZXJucyBhbmQgY2VydmljYWwgem9uZXMu',

    'upperTemporal': 'VXBwZXItdGVtcG9yYWwgcGF0dGVybiAoTGVmdCkuIEhpc3RvcmljYWwgc3R1ZGllcyBsaW5rZWQgdGhpcyB0byBuZXVyb3ZlZ2V0YXRpdmUgYW5kIHNwZWVjaCB6b25lcy4=',

    'lowerNasal': 'TG93ZXItbmFzYWwgcGF0dGVybi4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIHVyb2dlbml0YWwgYW5kIGx1bWJvc2FjcmFsIGF1dG9ub21pYyB6b25lcy4=',

    'lowerTemporal': 'TG93ZXItdGVtcG9yYWwgcGF0dGVybiAoTGVmdCkuIFJlc2VhcmNoIGxpbmtlZCB0aGlzIHRvIGNhcmRpYWMgYW5kIHNwbGVuaWMgYXV0b25vbWljIHBhdHRlcm5zLg==',
  };

  static Map<String, String> get decentrationOS =>
      _decentrationOSEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // FLATTENING ASSOCIATIONS - RIGHT EYE (OD) (Encoded)
  // ============================================================================

  static final Map<String, String> _flatteningODEncoded = {
    'upper-central': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItY2VudHJhbCB6b25lLiBIaXN0b3JpY2FsIHJlc2VhcmNoIGxpbmtlZCB0aGlzIHRvIG1vb2QgcmVndWxhdGlvbiBhbmQgZW5lcmd5IGF1dG9ub21pYyByZWZsZXhlcy4=',
    'frontal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItY2VudHJhbCB6b25lLiBIaXN0b3JpY2FsIHJlc2VhcmNoIGxpbmtlZCB0aGlzIHRvIG1vb2QgcmVndWxhdGlvbiBhbmQgZW5lcmd5IGF1dG9ub21pYyByZWZsZXhlcy4=',

    'upper-temporal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItdGVtcG9yYWwgem9uZS4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIGNyYW5pYWwgbmVydmUgYW5kIGF1ZGl0b3J5IGF1dG9ub21pYyByZWZsZXhlcy4=',

    'middle-temporal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbWlkZGxlLXRlbXBvcmFsIHpvbmUuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIHJlc3BpcmF0b3J5IGFuZCBjYXJkaWFjIGF1dG9ub21pYyBwYXR0ZXJucy4=',

    'lower-temporal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItdGVtcG9yYWwgem9uZS4gUmVzZWFyY2ggbGl0ZXJhdHVyZSBhc3NvY2lhdGVkIHRoaXMgd2l0aCBoZXBhdGljIGFuZCBtZXRhYm9saWMgYXV0b25vbWljIHpvbmVzLg==',

    'lower-basal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItYmFzYWwgem9uZS4gSGlzdG9yaWNhbCBzdHVkaWVzIGxpbmtlZCB0aGlzIHRvIHJlbmFsIGFuZCBsb3dlciBleHRyZW1pdHkgYXV0b25vbWljIHJlZmxleGVzLg==',
    'basal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItYmFzYWwgem9uZS4gSGlzdG9yaWNhbCBzdHVkaWVzIGxpbmtlZCB0aGlzIHRvIHJlbmFsIGFuZCBsb3dlciBleHRyZW1pdHkgYXV0b25vbWljIHJlZmxleGVzLg==',

    'lower-nasal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItbmFzYWwgem9uZS4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIHVyb2dlbml0YWwgYW5kIHBlbHZpYyBhdXRvbm9taWMgem9uZXMu',

    'middle-nasal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbWlkZGxlLW5hc2FsIHpvbmUuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIG94eWdlbiB1dGlsaXphdGlvbiBhbmQgcmVzcGlyYXRvcnkgYXV0b25vbWljIHBhdHRlcm5zLg==',

    'upper-nasal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItbmFzYWwgem9uZS4gUmVzZWFyY2ggbGl0ZXJhdHVyZSBhc3NvY2lhdGVkIHRoaXMgd2l0aCBjb2duaXRpdmUgYW5kIGNlcnZpY2FsIGF1dG9ub21pYyByZWZsZXhlcy4=',
  };

  static Map<String, String> get flatteningOD =>
      _flatteningODEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // FLATTENING ASSOCIATIONS - LEFT EYE (OS) (Encoded)
  // ============================================================================

  static final Map<String, String> _flatteningOSEncoded = {
    'upper-central': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItY2VudHJhbCB6b25lLiBIaXN0b3JpY2FsIHJlc2VhcmNoIGxpbmtlZCB0aGlzIHRvIG1vb2QgcmVndWxhdGlvbiBhbmQgbmV1cm9sb2dpY2FsIGF1dG9ub21pYyBwYXR0ZXJucy4=',
    'frontal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItY2VudHJhbCB6b25lLiBIaXN0b3JpY2FsIHJlc2VhcmNoIGxpbmtlZCB0aGlzIHRvIG1vb2QgcmVndWxhdGlvbiBhbmQgbmV1cm9sb2dpY2FsIGF1dG9ub21pYyBwYXR0ZXJucy4=',

    'upper-temporal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItdGVtcG9yYWwgem9uZS4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIG5ldXJvdmVnZXRhdGl2ZSBhbmQgc3BlZWNoIGF1dG9ub21pYyB6b25lcy4=',

    'middle-temporal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbWlkZGxlLXRlbXBvcmFsIHpvbmUuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIHB1bG1vbmFyeSBhbmQgY2FyZGlhYyBhdXRvbm9taWMgcmVmbGV4ZXMu',

    'lower-temporal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItdGVtcG9yYWwgem9uZS4gUmVzZWFyY2ggbGl0ZXJhdHVyZSBhc3NvY2lhdGVkIHRoaXMgd2l0aCBjYXJkaWFjIGFuZCBzcGxlbmljIGF1dG9ub21pYyBwYXR0ZXJucy4=',

    'lower-basal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItYmFzYWwgem9uZS4gSGlzdG9yaWNhbCBzdHVkaWVzIGxpbmtlZCB0aGlzIHRvIHJlbmFsIGFuZCBlbGltaW5hdGl2ZSBhdXRvbm9taWMgem9uZXMu',
    'basal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItYmFzYWwgem9uZS4gSGlzdG9yaWNhbCBzdHVkaWVzIGxpbmtlZCB0aGlzIHRvIHJlbmFsIGFuZCBlbGltaW5hdGl2ZSBhdXRvbm9taWMgem9uZXMu',

    'lower-nasal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbG93ZXItbmFzYWwgem9uZS4gUmVzZWFyY2ggaW5kaWNhdGVkIGFzc29jaWF0aW9ucyB3aXRoIHVyb2dlbml0YWwgYW5kIGx1bWJvc2FjcmFsIGF1dG9ub21pYyByZWZsZXhlcy4=',

    'middle-nasal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggbWlkZGxlLW5hc2FsIHpvbmUuIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIGNhcmRpYWMgYW5kIHJlc3BpcmF0b3J5IGF1dG9ub21pYyBwYXR0ZXJucy4=',

    'upper-nasal': 'UGF0dGVybiBhc3NvY2lhdGVkIHdpdGggdXBwZXItbmFzYWwgem9uZS4gUmVzZWFyY2ggbGl0ZXJhdHVyZSBhc3NvY2lhdGVkIHRoaXMgd2l0aCBjb2duaXRpdmUgYW5kIGNlcnZpY2FsIGF1dG9ub21pYyB6b25lcy4=',
  };

  static Map<String, String> get flatteningOS =>
      _flatteningOSEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // PROTRUSION ASSOCIATIONS - RIGHT EYE (OD) (Encoded)
  // ============================================================================

  static final Map<String, String> _protrusionODEncoded = {
    'upper-central': 'VXBwZXItY2VudHJhbCB6b25lIHByb3RydXNpb24gcGF0dGVybi4gUmVzZWFyY2ggYXNzb2NpYXRlZCB0aGlzIHdpdGggc3ltcGF0aGV0aWMgaHlwZXJhcm91c2FsIHBhdHRlcm5zIGFmZmVjdGluZyBjZXJlYnJhbCB6b25lcy4=',
    'frontal': 'VXBwZXItY2VudHJhbCB6b25lIHByb3RydXNpb24gcGF0dGVybi4gUmVzZWFyY2ggYXNzb2NpYXRlZCB0aGlzIHdpdGggc3ltcGF0aGV0aWMgaHlwZXJhcm91c2FsIHBhdHRlcm5zIGFmZmVjdGluZyBjZXJlYnJhbCB6b25lcy4=',

    'upper-temporal': 'VXBwZXItdGVtcG9yYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIGNyYW5pYWwgbmVydmUgYW5kIGF1ZGl0b3J5IHN5c3RlbSBoeXBlcmFjdGl2aXR5IHBhdHRlcm5zLg==',

    'middle-temporal': 'TWlkZGxlLXRlbXBvcmFsIHpvbmUgcHJvdHJ1c2lvbiBwYXR0ZXJuLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggY2FyZGlhYyBhbmQgcmVzcGlyYXRvcnkgc3ltcGF0aGV0aWMgcGF0dGVybnMu',

    'lower-temporal': 'TG93ZXItdGVtcG9yYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgc3R1ZGllcyBsaW5rZWQgdGhpcyB0byBoZXBhdG9iaWxpYXJ5IGFuZCBtZXRhYm9saWMgc3ltcGF0aGV0aWMgem9uZXMu',

    'lower-basal': 'TG93ZXItYmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIFJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB3aXRoIHJlbmFsIGFuZCBwZWx2aWMgc3ltcGF0aGV0aWMgaHlwZXJhY3Rpdml0eSBwYXR0ZXJucy4=',
    'basal': 'TG93ZXItYmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIFJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB3aXRoIHJlbmFsIGFuZCBwZWx2aWMgc3ltcGF0aGV0aWMgaHlwZXJhY3Rpdml0eSBwYXR0ZXJucy4=',

    'lower-nasal': 'TG93ZXItbmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIHVyb2dlbml0YWwgc3ltcGF0aGV0aWMgYWN0aXZhdGlvbiB6b25lcy4=',

    'middle-nasal': 'TWlkZGxlLW5hc2FsIHpvbmUgcHJvdHJ1c2lvbiBwYXR0ZXJuLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggZ2FzdHJpYyBhbmQgcGFuY3JlYXRpYyBzeW1wYXRoZXRpYyBwYXR0ZXJucy4=',

    'upper-nasal': 'VXBwZXItbmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgc3R1ZGllcyBsaW5rZWQgdGhpcyB0byBjb2duaXRpdmUgYW5kIHZpc3VhbCBzeW1wYXRoZXRpYyBoeXBlcmFyb3VzYWwgem9uZXMu',
  };

  static Map<String, String> get protrusionOD =>
      _protrusionODEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // PROTRUSION ASSOCIATIONS - LEFT EYE (OS) (Encoded)
  // ============================================================================

  static final Map<String, String> _protrusionOSEncoded = {
    'upper-central': 'VXBwZXItY2VudHJhbCB6b25lIHByb3RydXNpb24gcGF0dGVybi4gUmVzZWFyY2ggYXNzb2NpYXRlZCB0aGlzIHdpdGggcHN5Y2hvbW90b3IgYW5kIGNlcmVicmFsIHN5bXBhdGhldGljIHBhdHRlcm5zLg==',
    'frontal': 'VXBwZXItY2VudHJhbCB6b25lIHByb3RydXNpb24gcGF0dGVybi4gUmVzZWFyY2ggYXNzb2NpYXRlZCB0aGlzIHdpdGggcHN5Y2hvbW90b3IgYW5kIGNlcmVicmFsIHN5bXBhdGhldGljIHBhdHRlcm5zLg==',

    'upper-temporal': 'VXBwZXItdGVtcG9yYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIG5ldXJvdmVnZXRhdGl2ZSBzeW1wYXRoZXRpYyBoeXBlcmFjdGl2aXR5IHpvbmVzLg==',

    'middle-temporal': 'TWlkZGxlLXRlbXBvcmFsIHpvbmUgcHJvdHJ1c2lvbiBwYXR0ZXJuLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggcHVsbW9uYXJ5IGFuZCBjYXJkaWFjIHN5bXBhdGhldGljIHBhdHRlcm5zLg==',

    'lower-temporal': 'TG93ZXItdGVtcG9yYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgc3R1ZGllcyBsaW5rZWQgdGhpcyB0byBzcGxlbmljIGFuZCBjYXJkaWFjIHN5bXBhdGhldGljIGFjdGl2YXRpb24gem9uZXMu',

    'lower-basal': 'TG93ZXItYmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIFJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB3aXRoIHBlbHZpYyBhbmQgcmVuYWwgc3ltcGF0aGV0aWMgaHlwZXJhY3Rpdml0eSBwYXR0ZXJucy4=',
    'basal': 'TG93ZXItYmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIFJlc2VhcmNoIGFzc29jaWF0ZWQgdGhpcyB3aXRoIHBlbHZpYyBhbmQgcmVuYWwgc3ltcGF0aGV0aWMgaHlwZXJhY3Rpdml0eSBwYXR0ZXJucy4=',

    'lower-nasal': 'TG93ZXItbmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgb2JzZXJ2YXRpb25zIGxpbmtlZCB0aGlzIHRvIGx1bWJvc2FjcmFsIHN5bXBhdGhldGljIGFjdGl2YXRpb24gem9uZXMu',

    'middle-nasal': 'TWlkZGxlLW5hc2FsIHpvbmUgcHJvdHJ1c2lvbiBwYXR0ZXJuLiBSZXNlYXJjaCBpbmRpY2F0ZWQgYXNzb2NpYXRpb25zIHdpdGggYW54aWV0eS1jYXJkaWFjIHN5bXBhdGhldGljIHBhdHRlcm5zLg==',

    'upper-nasal': 'VXBwZXItbmFzYWwgem9uZSBwcm90cnVzaW9uIHBhdHRlcm4uIEhpc3RvcmljYWwgc3R1ZGllcyBsaW5rZWQgdGhpcyB0byBjb2duaXRpdmUgYW5kIHZpc3VhbCBzeW1wYXRoZXRpYyBoeXBlcmFyb3VzYWwgem9uZXMu',
  };

  static Map<String, String> get protrusionOS =>
      _protrusionOSEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // PATTERN NAMES (Display Labels) - Encoded
  // ============================================================================

  static final Map<String, String> _decentrationPatternNamesEncoded = {
    'centered': 'Q2VudGVyZWQgKE5vcm1hbCk=',
    'frontal': 'RnJvbnRhbCBkZWNlbnRyYWxpemF0aW9u',
    'basal': 'QmFzYWwgZGVjZW50cmFsaXphdGlvbg==',
    'nasal': 'TmFzYWwgZGVjZW50cmFsaXphdGlvbg==',
    'temporal': 'VGVtcG9yYWwgZGVjZW50cmFsaXphdGlvbg==',
    'middleNasal': 'TWlkZGxlLW5hc2FsIGRlY2VudHJhbGl6YXRpb24=',
    'middleTemporal': 'TWlkZGxlLXRlbXBvcmFsIGRlY2VudHJhbGl6YXRpb24=',
    'upperNasal': 'VXBwZXItbmFzYWwgZGVjZW50cmFsaXphdGlvbg==',
    'upperTemporal': 'VXBwZXItdGVtcG9yYWwgZGVjZW50cmFsaXphdGlvbg==',
    'lowerNasal': 'TG93ZXItbmFzYWwgZGVjZW50cmFsaXphdGlvbg==',
    'lowerTemporal': 'TG93ZXItdGVtcG9yYWwgZGVjZW50cmFsaXphdGlvbg==',
    'upwards': 'RGVjZW50cmF0aW9uIC0gVXB3YXJkcw==',
    'downwards': 'RGVjZW50cmF0aW9uIC0gRG93bndhcmRz',
    'upwardsInwards': 'RGVjZW50cmF0aW9uIC0gVXB3YXJkcy1JbndhcmRz',
    'upwardsOutwards': 'RGVjZW50cmF0aW9uIC0gVXB3YXJkcy1PdXR3YXJkcw==',
  };

  static Map<String, String> get decentrationPatternNames =>
      _decentrationPatternNamesEncoded.map((k, v) => MapEntry(k, _d(v)));

  static final Map<String, String> _pupilFormTypeNamesEncoded = {
    'circle': 'Q2lyY2xlIChOb3JtYWwp',
    'oval': 'T3ZhbA==',
    'ovalVertical': 'T3ZhbC12ZXJ0aWNhbA==',
    'ovalHorizontal': 'T3ZhbC1ob3Jpem9udGFs',
    'ovalDiagonal': 'T3ZhbC1kaWFnb25hbA==',
    'leftObliqueEllipse': 'TGVmdCBPYmxpcXVlIEVsbGlwc2U=',
    'unilateralEllipse': 'VW5pbGF0ZXJhbCBFbGxpcHNl',
    'ventralDivergingEllipse': 'VmVudHJhbCBEaXZlcmdpbmcgRWxsaXBzZQ==',
    'frontalDivergingEllipse': 'RnJvbnRhbCBEaXZlcmdpbmcgRWxsaXBzZQ==',
    'ellipse': 'RWxsaXBzZQ==',
    'chord': 'Q2hvcmQ=',
    'irregular': 'SXJyZWd1bGFy',
  };

  static Map<String, String> get pupilFormTypeNames =>
      _pupilFormTypeNamesEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // SEVERITY & CLINICAL NOTES (Encoded)
  // ============================================================================

  static final Map<String, String> _severityDescriptionsEncoded = {
    'none': 'V2l0aGluIG5vcm1hbCBsaW1pdHMu',
    'mild': 'TWlsZCBkaWZmZXJlbmNlIG9ic2VydmVkLiBNYXkgYmUgcGh5c2lvbG9naWNhbC4=',
    'moderate': 'TW9kZXJhdGUgYXN5bW1ldHJ5LiBSZXNlYXJjaCBvYnNlcnZhdGlvbiBub3RlZC4=',
    'severe': 'U2lnbmlmaWNhbnQgYXN5bW1ldHJ5LiBSZXNlYXJjaCBvYnNlcnZhdGlvbiBmbGFnZ2VkLg==',
  };

  static Map<String, String> get severityDescriptions =>
      _severityDescriptionsEncoded.map((k, v) => MapEntry(k, _d(v)));

  static final Map<String, String> _significanceLabelsEncoded = {
    'withinLimits': 'd2l0aGluIGFjY2VwdGFibGUgbGltaXRz',
    'mild': 'bWlsZA==',
    'moderate': 'bW9kZXJhdGU=',
    'significant': 'c2lnbmlmaWNhbnQ=',
  };

  static Map<String, String> get significanceLabels =>
      _significanceLabelsEncoded.map((k, v) => MapEntry(k, _d(v)));

  // ============================================================================
  // DEFAULT FALLBACKS (Encoded)
  // ============================================================================

  static const String _defaultFlatteningAssociationEncoded =
      'QXV0b25vbWljIG5lcnZvdXMgc3lzdGVtIHBhdHRlcm4gdmFyaWF0aW9uIGRldGVjdGVkIGluIHRoaXMgem9uZSBiYXNlZCBvbiBoaXN0b3JpY2FsIHJlc2VhcmNoLg==';

  static const String _defaultProtrusionAssociationEncoded =
      'U3ltcGF0aGV0aWMgbmVydm91cyBzeXN0ZW0gaHlwZXJhY3Rpdml0eSBwYXR0ZXJuIGRldGVjdGVkIGluIHRoaXMgem9uZSBiYXNlZCBvbiByZXNlYXJjaCBvYnNlcnZhdGlvbnMu';

  static String get defaultFlatteningAssociation => _d(_defaultFlatteningAssociationEncoded);
  static String get defaultProtrusionAssociation => _d(_defaultProtrusionAssociationEncoded);

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Get pupil form description by form type name
  static String getPupilFormDescription(String formType) {
    final descriptions = pupilFormDescriptions;
    return descriptions[formType] ?? descriptions['circle']!;
  }

  /// Get decentration association by pattern and eye
  static String getDecentrationAssociation(String pattern, bool isRightEye) {
    final map = isRightEye ? decentrationOD : decentrationOS;
    return map[pattern] ?? map['centered']!;
  }

  /// Get flattening association by zone and eye
  static String getFlatteningAssociation(String zone, bool isRightEye) {
    final normalizedZone = _normalizeZoneName(zone);
    final map = isRightEye ? flatteningOD : flatteningOS;
    return map[normalizedZone] ?? defaultFlatteningAssociation;
  }

  /// Get protrusion association by zone and eye
  static String getProtrusionAssociation(String zone, bool isRightEye) {
    final normalizedZone = _normalizeZoneName(zone);
    final map = isRightEye ? protrusionOD : protrusionOS;
    return map[normalizedZone] ?? defaultProtrusionAssociation;
  }

  /// Get pattern display name
  static String getPatternName(String pattern) {
    final names = decentrationPatternNames;
    return names[pattern] ?? 'Unknown';
  }

  /// Get form type display name
  static String getFormTypeName(String formType) {
    final names = pupilFormTypeNames;
    return names[formType] ?? 'Unknown';
  }

  /// Get severity description
  static String getSeverityDescription(String severity) {
    final descriptions = severityDescriptions;
    return descriptions[severity] ?? descriptions['none']!;
  }

  /// Normalize zone name for lookup
  static String _normalizeZoneName(String zone) {
    return zone.toLowerCase().replaceAll('_', '-').replaceAll(' ', '-');
  }
}
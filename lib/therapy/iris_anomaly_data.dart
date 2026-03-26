// =============================================================================
// IRIS ANOMALY DATA  — structured finding types for manual zone annotation
// Based on Bexel IRINA classification system.
// Universal types apply to all organs; organ-specific types are keyed by
// system keyword (matched against the zone's system string).
// Expand organ-specific entries as needed.
// =============================================================================

class IrisAnomalyType {
  final String name;
  final List<String> subtypes;   // empty = no subtype step
  final String conclusion;       // empty = no auto-conclusion

  const IrisAnomalyType({
    required this.name,
    this.subtypes = const [],
    this.conclusion = '',
  });
}

// ---------------------------------------------------------------------------
// Universal types — shown for every organ/zone
// ---------------------------------------------------------------------------
const List<IrisAnomalyType> kUniversalAnomalyTypes = [
  IrisAnomalyType(
    name: 'Stroma change',
    subtypes: [
      'Rarifications',
      'Increased intervals between fibers',
      'Lacunae',
      'Changes of trabecularies course',
    ],
  ),
  IrisAnomalyType(
    name: 'Organic pigment spot',
    conclusion:
        'Proliferative process. Post-traumatic changes. '
        'Scary changes, affecting vegetative inner-cycle. '
        'Viral infection in history. '
        'Infectious process, caused the destruction. '
        'Decompensation. Latent process.',
  ),
  IrisAnomalyType(
    name: 'Slagging',
    conclusion:
        'Decrease of local micro-circulation. '
        'Decrease of hyaline tissue elasticity. '
        'Premature aging of connective tissue.',
  ),
  IrisAnomalyType(
    name: 'Toxic radii',
    subtypes: [
      'Hyperemic sulci',
      'Stepped radial sulci',
    ],
  ),
  IrisAnomalyType(
    name: 'Heterochromia',
    subtypes: [
      'Sectoral hyperpigmentation',
      'Sectoral hypopigmentation',
      'Linear hyperpigmentation',
      'Linear hypopigmentation',
      'Vascular cone — hyperpigmentation',
      'Vascular cone — hypopigmentation',
    ],
  ),
];

// ---------------------------------------------------------------------------
// Organ-specific types — keyed by lowercase keyword found in the zone system
// string (e.g. "cardiac", "pulmon").  Add more entries as the database grows.
// ---------------------------------------------------------------------------
const Map<String, List<IrisAnomalyType>> kOrganSpecificAnomalyTypes = {
  // LUNG / pulmonary zones
  'pulmon': [
    IrisAnomalyType(
      name: 'Scurf rim',
      conclusion: 'Local intoxication. Congestion. Reduced circulation.',
    ),
    IrisAnomalyType(
      name: 'Adaptive rings / arcs',
      conclusion: 'Predisposition to bronchospastic reactions.',
    ),
  ],
  // HEART / cardiovascular zones
  'cardiac': [
    IrisAnomalyType(
      name: 'Autonomous wreath anomaly',
    ),
  ],
  'cardio': [
    IrisAnomalyType(
      name: 'Autonomous wreath anomaly',
    ),
  ],
};

/// Returns the full list of anomaly types for the given zone system string,
/// combining universal types with any organ-specific ones.
List<IrisAnomalyType> anomalyTypesForSystem(String system) {
  final lower = system.toLowerCase();
  final extras = <IrisAnomalyType>[];
  for (final key in kOrganSpecificAnomalyTypes.keys) {
    if (lower.contains(key)) {
      for (final t in kOrganSpecificAnomalyTypes[key]!) {
        if (!extras.any((e) => e.name == t.name)) extras.add(t);
      }
    }
  }
  return [...extras, ...kUniversalAnomalyTypes];
}

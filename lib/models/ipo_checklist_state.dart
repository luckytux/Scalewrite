// File: lib/models/ipo_checklist_state.dart

class IPOChecklistState {
  final String ipoId;
  final List<List<bool>> sections;

  IPOChecklistState({
    required this.ipoId,
    required this.sections,
  });

  Map<String, dynamic> toJson() => {
        'ipoId': ipoId,
        'sections': sections,
      };

  factory IPOChecklistState.fromJson(Map<String, dynamic> json) {
    return IPOChecklistState(
      ipoId: json['ipoId'] as String,
      sections: (json['sections'] as List)
          .map((sec) => List<bool>.from(sec as List))
          .toList(),
    );
  }
}

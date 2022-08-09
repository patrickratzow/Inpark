import "iucn_status.dart";

class Animal {
  final String id;
  final String displayName;
  final String latinName;
  final String category;
  final String previewImageUrl;
  final String? fullscreenImageUrl;
  final IUCNStatus? conservationStatus;
  final String description;

  Animal({
    required this.id,
    required this.displayName,
    required this.latinName,
    required this.category,
    required this.previewImageUrl,
    this.fullscreenImageUrl,
    this.conservationStatus,
    required this.description,
  });
}

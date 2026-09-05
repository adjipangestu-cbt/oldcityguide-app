class UserProfileDto {
  final String name;
  final String description;
  final String imageUrl;
  final String imageAsset;
  final bool isLocalAsset;

  const UserProfileDto({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.imageAsset = '',
    this.isLocalAsset = false,
  });
}

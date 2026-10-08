class KayutanganHeritageDto {
  final int id;
  final String title;
  final String content;
  final List<String> images;

  const KayutanganHeritageDto({
    required this.id,
    required this.title,
    required this.content,
    required this.images,
  });

  factory KayutanganHeritageDto.fromJson(Map<String, dynamic> json) {
    final imagesList = json['images'] as List<dynamic>? ?? [];
    return KayutanganHeritageDto(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      images: imagesList
          .map((img) => (img as Map<String, dynamic>)['image_url'] as String)
          .toList(),
    );
  }
}

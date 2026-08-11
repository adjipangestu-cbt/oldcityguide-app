class DestinationsDto {
  final int id;
  final String name;
  final String description;
  final String location;
  final String mapEmbedUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DestinationImageDto> images;

  DestinationsDto({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.mapEmbedUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory DestinationsDto.fromJson(Map<String, dynamic> json) {
    return DestinationsDto(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      mapEmbedUrl: json['map_embed_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      images: (json['images'] as List)
          .map((e) => DestinationImageDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'map_embed_url': mapEmbedUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'images': images.map((e) => e.toJson()).toList(),
    };
  }
}

class DestinationImageDto {
  final int id;
  final String destinationId;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  DestinationImageDto({
    required this.id,
    required this.destinationId,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DestinationImageDto.fromJson(Map<String, dynamic> json) {
    return DestinationImageDto(
      id: json['id'],
      destinationId: json['destination_id'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'destination_id': destinationId,
      'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

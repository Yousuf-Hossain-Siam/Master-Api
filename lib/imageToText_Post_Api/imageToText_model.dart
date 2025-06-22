class ImageToTextModel {
  final String? text;
  final BoundingBox? boundingBox;

  ImageToTextModel({this.text, this.boundingBox});

  factory ImageToTextModel.fromJson(Map<String, dynamic> json) {
    return ImageToTextModel(
      text: json['text'],
      boundingBox: json['bounding_box'] != null
          ? BoundingBox.fromJson(json['bounding_box'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'bounding_box': boundingBox?.toJson(),
    };
  }
}

class BoundingBox {
  final int? x1;
  final int? y1;
  final int? x2;
  final int? y2;

  BoundingBox({this.x1, this.y1, this.x2, this.y2});

  factory BoundingBox.fromJson(Map<String, dynamic> json) {
    return BoundingBox(
      x1: json['x1'],
      y1: json['y1'],
      x2: json['x2'],
      y2: json['y2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x1': x1,
      'y1': y1,
      'x2': x2,
      'y2': y2,
    };
  }
}

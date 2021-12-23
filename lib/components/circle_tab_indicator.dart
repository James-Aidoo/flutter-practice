import 'package:flutter/cupertino.dart';

class CircleTabIndicator extends Decoration {
  final double _radius;
  final Color _color;

  ///
  /// This value will be subtracted from the `X` component of the offset if provided
  final double _pagePadding;

  const CircleTabIndicator(this._radius, this._color, [this._pagePadding = 0]);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(_radius, _color, _pagePadding);
  }
}

class _CirclePainter extends BoxPainter {
  final double _radius;
  final Color _color;

  ///
  /// This value will be subtracted from the `X` component of the offset if provided
  final double? _pagePadding;

  _CirclePainter(this._radius, this._color, this._pagePadding);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var _paint = Paint();
    _paint.color = _color;
    _paint.isAntiAlias = true;
    final xOffset = (configuration.size!.width / 2) - _pagePadding!;
    final yOffset = configuration.size!.height - _radius;
    final Offset indicatorOffset = Offset(xOffset, yOffset);

    canvas.drawCircle(offset + indicatorOffset, _radius, _paint);
  }
}

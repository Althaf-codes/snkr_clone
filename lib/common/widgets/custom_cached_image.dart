import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? fallback;
  final Duration fadeInDuration;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.fallback,
    this.fadeInDuration = const Duration(milliseconds: 400),
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return fallback ??
          _EmptyPlaceholder(
              width: width, height: height, borderRadius: borderRadius);
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        fadeInDuration: fadeInDuration,
        placeholder: (context, urk) => Container(
          color: Colors.grey.withValues(alpha: 0.3),
        ),
        // placeholder: (context, url) =>
        //     _ShimmerPlaceholder(width: width, height: height),
        errorWidget: (context, url, error) => _ErrorPlaceholder(
          width: width,
          height: height,
          onRetry: () => CachedNetworkImage.evictFromCache(url),
        ),
      ),
    );
  }
}

class _ShimmerPlaceholder extends StatefulWidget {
  final double? width;
  final double? height;

  const _ShimmerPlaceholder({Key? key, this.width, this.height})
      : super(key: key);

  @override
  State<_ShimmerPlaceholder> createState() => _ShimmerPlaceholderState();
}

class _ShimmerPlaceholderState extends State<_ShimmerPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseColor =
        Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6);
    final highlightColor =
        Theme.of(context).colorScheme.surface.withOpacity(0.9);

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _ShimmerPainter(_controller.value,
                baseColor: baseColor, highlightColor: highlightColor),
            child: child,
          );
        },
        child: Container(),
      ),
    );
  }
}

class _ShimmerPainter extends CustomPainter {
  final double progress;
  final Color baseColor;
  final Color highlightColor;

  _ShimmerPainter(this.progress,
      {required this.baseColor, required this.highlightColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paintBg = Paint()..color = baseColor;
    canvas.drawRect(rect, paintBg);

    final double w = max(size.width, 48);
    final double dx = (progress * (w + size.width)) - w;

    final gradient = LinearGradient(
      begin: const Alignment(-1, 0),
      end: const Alignment(1, 0),
      colors: [baseColor, highlightColor, baseColor],
      stops: const [0.25, 0.5, 0.75],
      transform: _SlidingGradientTransform(slidePercent: dx / size.width),
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant _ShimmerPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.baseColor != baseColor ||
      oldDelegate.highlightColor != highlightColor;
}

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;

  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onRetry;

  const _ErrorPlaceholder({this.width, this.height, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.grey.shade200, //Theme.of(context).colorScheme.background,
        child: InkWell(
          onTap: onRetry,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.broken_image_outlined,
                    size: 28, semanticLabel: 'Image failed to load'),
                const SizedBox(height: 8),
                Text('Tap to retry',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const _EmptyPlaceholder(
      {Key? key, this.width, this.height, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(Icons.image,
            size: 36, color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
    );
  }
}

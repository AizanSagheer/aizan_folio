import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioProject extends StatefulWidget {
  final String imagePath;
  final String projectName;
  final String description;
  final List<String>? appLinks;

  const PortfolioProject({
    super.key,
    required this.imagePath,
    required this.projectName,
    required this.description,
    this.appLinks,
  });

  @override
  State<PortfolioProject> createState() => _PortfolioProjectState();
}

class _PortfolioProjectState extends State<PortfolioProject>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final ValueNotifier<bool> _isHoveredNotifier = ValueNotifier(false);
  late final VoidCallback _hoverListener;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _hoverListener = () {
      if (_isHoveredNotifier.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    };
    _isHoveredNotifier.addListener(_hoverListener);
  }

  @override
  void dispose() {
    _isHoveredNotifier.removeListener(_hoverListener);
    _isHoveredNotifier.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    _isHoveredNotifier.value = true;
  }

  void _onExit(PointerEvent details) {
    _isHoveredNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isFront = _animation.value < 0.5;
          final angle = _animation.value * 3.1416;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: isFront
                ? _buildFront()
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(3.1416),
                    child: _buildBack(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors().containerBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: widget.imagePath.endsWith('.svg')
                ? SvgPicture.asset(
                    widget.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to a placeholder if image fails to load
                      return Container(
                        color: AppColors().containerBackgroundColor,
                        child: Icon(
                          Icons.image_not_supported,
                          color: AppColors().whiteColor,
                          size: 50,
                        ),
                      );
                    },
                  ),
          ),
          // Project Name Container at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: AppColors().containerBackgroundColor.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                widget.projectName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors().whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors().secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: AppColors().whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          if (widget.appLinks != null && widget.appLinks!.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: widget.appLinks!.map((link) {
                  return _buildPlatformIconButton(link);
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPlatformIconButton(String link) {
    final isPlayStore = link.contains('play.google.com');
    final isAppStore = link.contains('apps.apple.com');
    
    IconData iconData;
    String tooltip;
    
    if (isPlayStore) {
      iconData = Icons.android;
      tooltip = 'Google Play Store';
    } else if (isAppStore) {
      iconData = Icons.phone_iphone;
      tooltip = 'App Store';
    } else {
      iconData = Icons.link;
      tooltip = 'View App';
    }
    
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors().whiteColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () async {
            final Uri uri = Uri.parse(link);
            if (await canLaunchUrl(uri)) {
              await launchUrl(
                uri,
                mode: LaunchMode.externalApplication,
              );
            }
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              iconData,
              color: AppColors().secondaryColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

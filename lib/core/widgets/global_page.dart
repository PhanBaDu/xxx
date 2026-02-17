import 'package:context/core/theme/app_colors.dart';
import 'package:context/core/widgets/button_arrow_left_widget.dart';
import 'package:flutter/cupertino.dart';

/// GlobalPage - Widget trang toàn cục với navigation bar tùy chỉnh
///
/// Props:
/// - [title] (required): Widget tiêu đề hiển thị ở giữa navigation bar
/// - [child] (required): Nội dung chính của trang
///
/// - [contentPadding]: Padding cho nội dung (default: 16px ngang & dọc)
///   * Điều chỉnh khoảng cách giữa nội dung và viền màn hình
///
/// - [expandContent]: Mở rộng nội dung để fill toàn bộ chiều cao (default: false)
///   * true: Nội dung sẽ tự động kéo dài để lấp đầy màn hình
///   * false: Nội dung chỉ chiếm không gian cần thiết
///
/// - [bottomAction]: Widget action button ở dưới cùng màn hình
///   * Thường dùng cho nút "Save", "Submit", "Continue"...
///   * Tự động expand full width nếu không có floatingButton
///
/// - [trailing]: Widget bên phải navigation bar (vị trí góc phải)
///   * Thường dùng cho nút "Edit", "Done", icon settings...
///   * Để hiển thị text "Close" đỏ, dùng ButtonClose(context: context)
///
/// - [leading]: Widget bên trái navigation bar (vị trí góc trái)
///   * Truyền widget tùy chỉnh cho nút bên trái
///   * Nếu không truyền, sẽ hiển thị nút back mặc định (ButtonArrowLeft)
///
/// - [navBorder]: Tùy chỉnh border cho navigation bar (default: border bottom 0.5px)
///   * Nếu truyền null, border sẽ bị ẩn hoàn toàn
///
/// - [floatingButton]: Floating button ở dưới cùng (bên trái bottomAction)
///   * Hiển thị cùng with bottomAction
///   * Thường dùng cho action phụ
///
/// - [scrollController]: ScrollController tùy chỉnh để điều khiển scroll
///   * Nếu không truyền, widget tự tạo controller nội bộ
///   * Dùng khi cần listen scroll events hoặc programmatic scroll
///
/// - [allowPop]: Cho phép back/pop navigation (default: true)
///   * false: Chặn user back, dùng cho màn hình bắt buộc hoàn thành
///   * true: Cho phép back bình thường
///
/// - [backgroundColor]: Màu nền của trang
///   * Mặc định là AppColors.backgroundLight
///
/// - [header]: Widget header tùy chỉnh ngay dưới navigation bar
///   * Dùng cho tabs, filters, search bar...
///   * Luôn hiển thị cố định, không scroll
///
/// - [showScrollbar]: Hiển thị thanh scrollbar (default: true)
///   * false: Ẩn scrollbar cho giao diện sạch hơn
///
/// - [useScrollView]: Bật/tắt scroll cho nội dung (default: true)
///   * false: Nội dung không scroll, dùng khi đã có scroll riêng bên trong
///   * true: Tự động scroll khi nội dung vượt quá màn hình
///
/// - [physics]: Tùy chỉnh scroll behavior (BouncingScrollPhysics, ClampingScrollPhysics...)
///   * Điều chỉnh cách scroll hoạt động (bounce, clamp, never...)
///
/// Ví dụ sử dụng:
/// ```dart
/// GlobalPage(
///   title: const NavTitle(title: 'Settings'),
///   child: YourContent(),
///   backgroundColor: AppColors.backgroundDark, // Thay đổi màu nền
/// )
/// ```
class GlobalPage extends StatefulWidget {
  const GlobalPage({
    super.key,
    required this.title,
    required this.child,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 8,
    ),
    this.expandContent = false,
    this.bottomAction,
    this.trailing,
    this.leading,
    this.navBorder = const Border(
      bottom: BorderSide(color: Color(0xFFE2E8F0), width: 0.5),
    ),
    this.floatingButton,
    this.scrollController,
    this.allowPop = true,
    this.backgroundColor = AppColors.backgroundLight,
    this.header,
    this.showScrollbar = false,
    this.useScrollView = true,
    this.physics = const ClampingScrollPhysics(),
  });

  final Widget title;
  final Widget child;
  final Widget? header;
  final EdgeInsets contentPadding;
  final bool expandContent;
  final Widget? bottomAction;
  final Widget? trailing;
  final Widget? leading;
  final Border? navBorder;
  final Widget? floatingButton;
  final ScrollController? scrollController;
  final bool allowPop;
  final Color backgroundColor;
  final bool showScrollbar;
  final bool useScrollView;
  final ScrollPhysics? physics;

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  static const double _toolbarHeight = 60;
  late ScrollController _scrollController;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _setController(widget.scrollController);
  }

  @override
  void didUpdateWidget(covariant GlobalPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      if (_ownsController) {
        _scrollController.dispose();
      }
      _setController(widget.scrollController);
    }
  }

  @override
  void dispose() {
    if (_ownsController) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _setController(ScrollController? controller) {
    _ownsController = controller == null;
    _scrollController = controller ?? ScrollController();
  }

  ScrollController? get _effectiveController =>
      _ownsController ? null : _scrollController;

  bool get _usePrimary => _ownsController;

  Widget _buildScrollView(double navHeight) {
    if (!widget.useScrollView) {
      return Padding(
        padding: widget.contentPadding,
        child: widget.expandContent
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      navHeight -
                      (widget.header != null ? 60 : 0),
                ),
                child: widget.child,
              )
            : widget.child,
      );
    }

    return SingleChildScrollView(
      controller: _effectiveController,
      primary: _usePrimary,
      physics: widget.physics,
      child: Padding(
        padding: widget.contentPadding,
        child: widget.expandContent
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      navHeight -
                      (widget.header != null ? 60 : 0),
                ),
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.of(context).padding.top;
    final double navHeight = _toolbarHeight + topInset;

    return PopScope(
      canPop: widget.allowPop,
      child: CupertinoPageScaffold(
        backgroundColor: widget.backgroundColor,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: navHeight),
              child: Column(
                children: [
                  if (widget.header != null) widget.header!,
                  Expanded(
                    child: widget.showScrollbar
                        ? CupertinoScrollbar(
                            controller: _effectiveController,
                            thumbVisibility: false,
                            child: _buildScrollView(navHeight),
                          )
                        : _buildScrollView(navHeight),
                  ),
                ],
              ),
            ),
            Container(
              height: navHeight,
              padding: EdgeInsets.only(left: 20, right: 20, top: topInset),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBackground.resolveFrom(context),
                border: widget.navBorder,
              ),
              child: Stack(
                children: [
                  // Title ở center tuyệt đối
                  Positioned.fill(child: Center(child: widget.title)),
                  // Leading và Trailing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:
                              widget.leading ??
                              (widget.allowPop
                                  ? ButtonArrowLeft(context: context)
                                  : const SizedBox.shrink()),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: widget.trailing ?? const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (widget.bottomAction != null || widget.floatingButton != null)
              Positioned(
                bottom: 24,
                left: 4,
                right: 4,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: Row(
                    key: ValueKey<bool>(
                      widget.bottomAction != null &&
                          widget.floatingButton != null,
                    ),
                    children: [
                      if (widget.floatingButton != null) widget.floatingButton!,
                      if (widget.bottomAction != null) ...[
                        if (widget.floatingButton != null)
                          const SizedBox(width: 12),
                        Expanded(child: widget.bottomAction!),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

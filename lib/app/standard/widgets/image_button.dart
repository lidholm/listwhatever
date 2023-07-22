import 'package:flutter/material.dart';
import '/app/custom/common_theme_data.dart';
import '/app/standard/widgets/shimmer/shimmer_loading.dart';

const roundedRadius = 8.0;

class ImageButton<T> extends StatelessWidget {
  const ImageButton({
    required this.item,
    required this.image,
    required this.text,
    required this.callback,
    required this.isLoading,
    this.topRightIcon,
    this.topRightIconBorderColor,
    super.key,
  });
  final T item;
  final String image;
  final String text;
  final void Function(T item) callback;
  final bool isLoading;
  final Widget? topRightIcon;
  final Color? topRightIconBorderColor;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero, // Set this
          padding: EdgeInsets.zero, // and this
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedRadius),
          ),
        ),
        onPressed: () {
          callback.call(item);
        },
        child: DecoratedBox(
          decoration: isLoading
              ? BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                )
              : BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.95,
                    image: AssetImage(image),
                    fit: BoxFit.fitHeight,
                  ),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(roundedRadius)),
                  border: Border.all(color: mainColor, width: 6),
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (topRightIcon != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: commonThemeData.colorScheme.background,
                          border: Border.all(
                            color: topRightIconBorderColor!,
                            width: 4,
                          ),
                        ),
                        child: IconButton(
                          icon: topRightIcon!,
                          onPressed: () {},
                        ),
                        // topRightIcon,
                      ),
                    )
                  ],
                ),
              Container(
                color: mainColor.withOpacity(0.8),
                width: double.infinity,
                height: 36,
                child: Center(
                  child: isLoading
                      ? Container(
                          width: 250,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        )
                      : Text(
                          text,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

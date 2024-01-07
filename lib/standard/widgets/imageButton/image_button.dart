import 'package:flutter/material.dart';
import 'package:listwhatever/standard/appUi/colors/app_colors.dart';
import '/standard/navigation/widgets/shimmer/shimmer_loading.dart';

const imageRadius = 16.0;
const roundedRadius = 20.0;

const mainColor = AppColors.darkPurple; // TODO: Replace
const background = Colors.white; // TODO: Replace

class ImageButton<T> extends StatelessWidget {
  const ImageButton({
    required this.item,
    required this.image,
    required this.text,
    required this.callback,
    required this.isLoading,
    this.topRightIcon,
    this.topRightIconBorderColor,
    this.chipText,
    super.key,
  });

  final T item;
  final String image;
  final String text;
  final void Function(T item) callback;
  final bool isLoading;
  final Widget? topRightIcon;
  final Color? topRightIconBorderColor;
  final String? chipText;

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
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          callback.call(item);
        },
        child: backgroundWidget(
          child: Column(
            children: [
              imageWidget(),
              headerWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (chipText != null) typeWidget()!,
                    sharedInfoWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DecoratedBox backgroundWidget({required Widget child}) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,);
  }

  Widget imageWidget() {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      print('constraints: $constraints');
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius),
          child: SizedBox(
              width: constraints.maxWidth * 0.9,
            height: constraints.maxWidth * 0.6,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
      );
    },);
  }

  Text headerWidget() {
    return Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
  }

  Widget? typeWidget() {
    if (chipText == null) {
      return null;
    }

    return DecoratedBox(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(chipText!, style: const TextStyle(color: Colors.white)),
        ),);
  }

  Widget sharedInfoWidget() {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: background,
        border: Border.all(
          color: topRightIconBorderColor!,
          width: 4,
        ),
      ),
      child: IconButton(
        icon: topRightIcon!,
        onPressed: () {},
      ),
    );
  }
}

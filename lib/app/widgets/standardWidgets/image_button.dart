import 'package:flutter/material.dart';

const roundedRadius = 8.0;

class ImageButton<T> extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.item,
    required this.image,
    required this.text,
    required this.callback,
    // required this.callback,
  });
  final T item;
  final String image;
  final String text;
  final Function(T item) callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundedRadius)),
      ),
      onPressed: () {
        callback.call(item);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.95,
            image: AssetImage(image),
            fit: BoxFit.fitHeight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(roundedRadius)),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white.withOpacity(0.85),
          width: double.infinity,
          height: 36,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

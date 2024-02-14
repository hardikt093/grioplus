import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/text_style.dart';

class DropdownWithSearch<T> extends StatelessWidget {
  final String title;
  final String placeHolder;
  final T selected;
  final List items;
  final EdgeInsets? selectedItemPadding;
  final TextStyle? selectedItemStyle;
  final TextStyle? dropdownHeadingStyle;
  final TextStyle? itemStyle;
  final BoxDecoration? decoration, disabledDecoration;
  final double? searchBarRadius;
  final double? dialogRadius;
  final bool disabled;
  final String label;

  final Function onChanged;

  const DropdownWithSearch(
      {super.key,
      required this.title,
      required this.placeHolder,
      required this.items,
      required this.selected,
      required this.onChanged,
      this.selectedItemPadding,
      this.selectedItemStyle,
      this.dropdownHeadingStyle,
      this.itemStyle,
      this.decoration,
      this.disabledDecoration,
      this.searchBarRadius,
      this.dialogRadius,
      required this.label,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => SearchDialog(
                  placeHolder: placeHolder,
                  title: title,
                  searchInputRadius: searchBarRadius,
                  dialogRadius: dialogRadius,
                  titleStyle: dropdownHeadingStyle,
                  itemStyle: itemStyle,
                  items: items)).then((value) {
            onChanged(value);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                width: 1,
                color: /* selected! ==""? BaseColors.redColor:*/
                    BaseColors.textFieldBackgroundColor),
            color: BaseColors.textFieldBackgroundColor,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(selected.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: BaseTextStyles.formHintText)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Image.asset(
                  BaseAssets.dropdownIcon,
                  height: 20,
                  width: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchDialog extends StatefulWidget {
  final String title;
  final String placeHolder;
  final List items;
  final TextStyle? titleStyle;
  final TextStyle? itemStyle;
  final double? searchInputRadius;
  final double? dialogRadius;

  const SearchDialog(
      {super.key,
      required this.title,
      required this.placeHolder,
      required this.items,
      this.titleStyle,
      this.searchInputRadius,
      this.dialogRadius,
      this.itemStyle});

  @override
  SearchDialogState createState() => SearchDialogState();
}

class SearchDialogState<T> extends State<SearchDialog> {
  TextEditingController textController = TextEditingController();
  late List filteredList;

  @override
  void initState() {
    filteredList = widget.items;
    textController.addListener(() {
      setState(() {
        if (textController.text.isEmpty) {
          filteredList = widget.items;
        } else {
          filteredList = widget.items
              .where((element) => element
                  .toString()
                  .toLowerCase()
                  .contains(textController.text.toLowerCase()))
              .toList();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      shape: RoundedRectangleBorder(
          borderRadius: widget.dialogRadius != null
              ? BorderRadius.circular(widget.dialogRadius!)
              : BorderRadius.circular(14)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: BaseColors.textFieldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(widget.title,
                        style: BaseTextStyles.categoriesHeaderText),
                  ),
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      })
                ],
              ),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: widget.placeHolder,
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: BaseColors.searchTextColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          widget.searchInputRadius != null
                              ? Radius.circular(widget.searchInputRadius!)
                              : const Radius.circular(5)),
                      borderSide: const BorderSide(
                        color: BaseColors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          widget.searchInputRadius != null
                              ? Radius.circular(widget.searchInputRadius!)
                              : const Radius.circular(5)),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BaseColors.white),
                  controller: textController,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(widget.dialogRadius != null
                      ? Radius.circular(widget.dialogRadius!)
                      : const Radius.circular(5)),
                  //borderRadius: widget.dialogRadius!=null?BorderRadius.circular(widget.dropDownRadius!):BorderRadius.circular(14),
                  child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context, filteredList[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 18),
                              child: Text(
                                filteredList[index].toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: BaseColors.white),
                              ),
                            ));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  /// Creates a dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const CustomDialog({
    super.key,
    this.child,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.shape,
    this.constraints = const BoxConstraints(
        minWidth: 280.0, minHeight: 280.0, maxHeight: 400.0, maxWidth: 400.0),
  });

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to 100 milliseconds.
  final Duration insetAnimationDuration;

  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to [Curves.fastOutSlowIn].
  final Curve insetAnimationCurve;

  /// {@template flutter.material.dialog.shape}
  /// The shape of this dialog's border.
  ///
  /// Defines the dialog's [Material.shape].
  ///
  /// The default shape is a [RoundedRectangleBorder] with a radius of 2.0.
  /// {@endtemplate}
  final ShapeBorder? shape;
  final BoxConstraints constraints;

  Color _getColor(BuildContext context) {
    return Theme.of(context).dialogBackgroundColor;
  }

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)));

  @override
  Widget build(BuildContext context) {
    final DialogTheme dialogTheme = DialogTheme.of(context);
    return Center(
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets +
            const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
        duration: insetAnimationDuration,
        curve: insetAnimationCurve,
        child: MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: Center(
            child: ConstrainedBox(
              constraints: constraints,
              child: Material(
                elevation: 15.0,
                color: _getColor(context),
                type: MaterialType.card,
                shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

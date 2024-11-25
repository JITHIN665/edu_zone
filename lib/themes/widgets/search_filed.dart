import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  // Change to StatefulWidget
  final String hint;
  final void Function(String)? onChanged;
  final void Function()? onTap; // Optional additional tap functionality
  final bool isVisible;
  final FocusNode? focusNode;

  const SearchField({
    super.key,
    required this.hint,
    this.onChanged,
    this.onTap,
    this.isVisible = false,
    this.focusNode,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller; // Controller for the TextField

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  void clearText() {
    _controller.clear(); // Clear text function
    if (widget.onChanged != null) {
      widget.onChanged!(''); // Update the outer widget if there's a listener
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: appColor(context).fullWhite,
      ),
      child: TextField(
        focusNode: widget.focusNode,
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(fontSize: 12, color: appColor(context).primaryText?.withOpacity(0.5)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: appColor(context).border!, width: 0.5), borderRadius: BorderRadius.circular(10)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: appColor(context).border!, width: 0.5), borderRadius: BorderRadius.circular(10)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(11),
            child: Image.asset(
              "assets/icons/search.png",
              color: appColor(context).primaryText,
            ),
          ),
        ),
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onDelete;

  const SearchWidget({
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: widget.hint,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              widget.controller.text = '';
            });
            widget.onDelete();
          },
          child: const Icon(Icons.clear, color: Colors.black54),
        ),
      ),
    );
  }
}

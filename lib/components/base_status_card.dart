import 'package:flutter/material.dart';

class BaseStatusCard extends StatelessWidget {
  final Color backgroundColor, foregroundColor;
  final IconData icon;
  final String label, text;

  const BaseStatusCard({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.transparent,
        elevation: 4.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: backgroundColor,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    color: foregroundColor,
                    size: 50.0,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final textTheme = Theme.of(context).textTheme;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: textTheme.subtitle2?.copyWith(
                            color: foregroundColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          text,
                          style: textTheme.headline6?.copyWith(color: foregroundColor),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

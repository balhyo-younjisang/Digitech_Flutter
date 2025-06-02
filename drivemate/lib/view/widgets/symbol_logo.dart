import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SymbolLogo extends StatelessWidget {
  const SymbolLogo({super.key});


  final String symbolAsset =
      'assets/icons/hub_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.svg';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        SvgPicture.asset(
          symbolAsset,
          colorFilter: const ColorFilter.mode(
            Color.fromRGBO(178, 136, 124, 1),
            BlendMode.srcIn,
          ),
          width: 50,
          height: 50,
          alignment: Alignment.center,
        ),
        Text("Drive Mate", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),)
      ],
    );
  }

}
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:phonebook/domain/phone.dart';
import 'package:phonebook/ui/widgets/IconCircle.dart';
import 'package:phonebook/ui/widgets/phonebook/content.dart';
import 'package:phonebook/ui/widgets/phonebook/profile_nav.dart';
import 'package:phonebook/utils/Color.dart';
import 'package:phonebook/utils/Icon.dart';

class HistoryTile extends StatefulWidget {
  final String? displayName;
  final String? phone;
  final CallType? callType;

  final void Function(ExpansionTileController controller) changeController;
  final ExpansionTileController controller = ExpansionTileController();

  HistoryTile({
    super.key,
    this.displayName,
    required this.changeController,
    this.phone, this.callType,
  });

  @override
  State<StatefulWidget> createState() => HistoryTileState();
}

class HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: widget.controller,
      iconColor: Colors.blueGrey.withAlpha(40),
      backgroundColor: Colors.blueGrey.withAlpha(40),
      collapsedBackgroundColor: Colors.blueGrey.withAlpha(40),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onExpansionChanged: (bool newState) {
        if (newState) {
          widget.changeController(widget.controller);
        }
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          IconCircleWidget(
            iconColor: ColorUtil.buildIconColorByCallType(widget.callType),
            icon: IconUtil.buildIconByCallType(widget.callType),
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: widget.displayName ?? "알 수 없음",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      children: [ProfileNavWidget(phone: widget.phone ?? "알 수 없음")],
    );
  }
}

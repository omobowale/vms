import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vms/custom_classes/palette.dart';
import 'package:vms/custom_widgets/custom_error_label.dart';
import 'package:vms/custom_widgets/custom_input_label.dart';
import 'package:vms/models/api_response.dart';
import 'package:vms/models/group_head.dart';
import 'package:vms/notifiers/appointment_notifier.dart';
import 'package:vms/services/group_head_service.dart';

class CustomGroupHead extends StatefulWidget {
  @override
  State<CustomGroupHead> createState() => _CustomGroupHeadState();
}

class _CustomGroupHeadState extends State<CustomGroupHead> {
  String groupHeadName = "Click to select Group Head";
  double opacity = 0.2;
  @override
  Widget build(BuildContext context) {
    AppointmentNotifier _appointmentNotifier =
        Provider.of<AppointmentNotifier>(context, listen: true);
    String fullName =
        context.read<AppointmentNotifier>().appointments[0].groupHead.fullName;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputLabel(labelText: "Group Head"),
          CustomErrorLabel(
              errorText:
                  _appointmentNotifier.allNewAppointmentErrors["groupHead"]),
          GestureDetector(
            onTap: () async {
              var result = await showSearch(
                context: context,
                delegate: GroupHeadSearch(),
              );

              if (result != null) {
                context.read<AppointmentNotifier>().addGroupHead(result);
                setState(() {
                  groupHeadName = context
                      .read<AppointmentNotifier>()
                      .appointments[0]
                      .groupHead
                      .fullName;
                });
                context.read<AppointmentNotifier>().removeError("groupHead");
              }
            },
            child: Container(
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                fullName == "" ? groupHeadName : fullName,
                style: TextStyle(
                  color: fullName.isEmpty
                      ? Palette.FBN_BLUE.withOpacity(opacity)
                      : Palette.FBN_BLUE.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(
                  color: Palette.LAVENDAR_GREY,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupHeadSearch extends SearchDelegate<GroupHead> {
  GroupHeadService get service => GetIt.I<GroupHeadService>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    GroupHead initialGH =
        context.read<AppointmentNotifier>().appointments[0].groupHead;
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(
              context,
              initialGH,
            );
          } else {
            query = '';
          }
        },
        icon: Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    GroupHead initialGH =
        context.read<AppointmentNotifier>().appointments[0].groupHead;
    return IconButton(
      onPressed: () {
        return close(
          context,
          initialGH,
        );
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.group_add_outlined),
          SizedBox(
            height: 30,
          ),
          Text(
            query,
            style: TextStyle(
              color: Palette.FBN_BLUE,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<APIResponse<List<GroupHead>>>(
      future: service.getGroupHeads(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                color: Palette.FBN_BLUE,
              ),
            );
          default:
            return buildSuggestionsSuccess(snapshot.data?.data ?? []);
        }
      },
    );
  }

  Widget buildSuggestionsSuccess(List<GroupHead> suggestions) {
    var suggestedGHs = suggestions.where((gh) {
      final queryText = query.toLowerCase();
      final ghText = gh.fullName.toLowerCase();
      return ghText.startsWith(queryText);
    }).toList();

    return ListView.builder(
      itemCount: suggestedGHs.length,
      itemBuilder: (context, index) {
        final suggestion = suggestedGHs[index];
        final queryText = suggestion.fullName.substring(0, query.length);
        final remainingText = suggestion.fullName.substring(query.length);
        return ListTile(
          onTap: () {
            query = suggestion.fullName;
            close(context, suggestion);
          },
          leading: Icon(Icons.group_add_outlined),
          title: RichText(
            text: TextSpan(
              text: queryText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: remainingText,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
          subtitle: Text(suggestion.email),
          trailing: Text(
            suggestion.staffId,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}

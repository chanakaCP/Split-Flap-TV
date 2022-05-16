import 'package:flutter/material.dart';
import 'package:split_flap_tv/config/extensions/extensions.dart';
import 'package:split_flap_tv/config/style/style.dart';
import 'package:split_flap_tv/ui/widgets/appbars/custom_appbar.dart';
import 'package:split_flap_tv/ui/widgets/containers/custom_container.dart';
import 'package:table_calendar/table_calendar.dart';

class ScriptAllocationScreen extends StatefulWidget {
  @override
  _ScriptAllocationScreenState createState() => _ScriptAllocationScreenState();
}

class _ScriptAllocationScreenState extends State<ScriptAllocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(title: "Calender of Scripts Allocation"),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: CustomContainer(
          margin: defaultMargin,
          child: Column(
            children: [
              CustomContainer(
                bgColor: primaryBlackColor,
                borderRadius: 16.fullRadius,
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: fontStyle11(),
                    titleCentered: true,
                    leftChevronIcon: const Icon(
                      Icons.chevron_left_rounded,
                      color: primaryBlueColor,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right_rounded,
                      color: primaryBlueColor,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: fontStyle12(),
                    weekendStyle: fontStyle12(),
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: fontStyle12(
                      fontWeight: FontWeight.w500,
                      fontColor: white,
                    ),
                    holidayTextStyle: fontStyle12(
                      fontWeight: FontWeight.w500,
                      fontColor: white,
                    ),
                    weekendTextStyle: fontStyle12(
                      fontWeight: FontWeight.w500,
                      fontColor: white,
                    ),
                    outsideTextStyle: fontStyle12(
                      fontWeight: FontWeight.w500,
                      fontColor: white.withOpacity(0.5),
                    ),
                  ),
                  onDaySelected: (date1, date2) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

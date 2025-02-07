
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadeet/bloc/today/today_cubit.dart';
import 'package:hadeet/ui/today/components/daily_goal_card.dart';
import 'package:hadeet/uikit/assets/icons.dart';
import 'package:hadeet/uikit/assets/images.dart';
import 'package:hadeet/uikit/themes/_app_colors.dart';
import 'package:hadeet/uikit/themes/_theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<TodayCubit, TodayState>(builder: (context, state) {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Bounce(onTap: (){}, child: SvgPicture.asset(AppIcons.profile, height: 28, width: 28,)),
                  const Spacer(),
                  Image.asset(AppImages.avatar, width: 40, height: 40,),
                ],
              ),
              const SizedBox(height: 16,),
              Text('Hello, \nThao Lee 👋', style: CustomTheme.of(context).typography.title30Bold.copyWith(color: CustomTheme.of(context).colors.neutral4)),
              const SizedBox(height: 24,),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomTheme.of(context).colors.neutral1
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      bottom: 20,
                      left: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Streak', style: CustomTheme.of(context).typography.caption12Bold.copyWith(color: CustomTheme.of(context).colors.primary1)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('2 days', style: CustomTheme.of(context).typography.title3024Bold.copyWith(color: CustomTheme.of(context).colors.neutral4),),
                          Text('Your current streak', style: CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral2))
                        ],
                      ),
                    ),
                    const Padding(padding: const EdgeInsets.only(top: 20), child: Align(alignment: Alignment.topCenter,),),
                    Align(alignment: Alignment.bottomRight, child: Image.asset(AppImages.goal,),)
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              DailyGoalCard(text: 'Completed', color: CustomTheme.of(context).colors.semantic3, count: 13, onTap: (){}, gradient: AppColors.gradient4),
              const SizedBox(height: 16,),
              DailyGoalCard(text: 'In progress', color: CustomTheme.of(context).colors.semantic2, count: 8, onTap: (){}, gradient: AppColors.gradient3),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomTheme.of(context).colors.neutral1
                ),
                padding: const EdgeInsets.all(20),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Bounce(child: SvgPicture.asset(AppIcons.arrowLeftSquare, width: 24, height: 24,)),
                        Text('Mar 2021', style: CustomTheme.of(context).typography.headline16Bold.copyWith(color: CustomTheme.of(context).colors.semantic4),),
                        Bounce(child: SvgPicture.asset(AppIcons.arrowRightSquare, width: 24, height: 24,),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SfCalendar(
                      viewHeaderHeight: 32,
                      headerHeight: 0,
                      todayHighlightColor: CustomTheme.of(context).colors.primary1,
                      viewHeaderStyle: ViewHeaderStyle(
                        dayTextStyle: CustomTheme.of(context).typography.caption12Bold.copyWith(color: CustomTheme.of(context).colors.neutral2)
                      ),
                      backgroundColor: CustomTheme.of(context).colors.neutral1,
                      headerStyle: CalendarHeaderStyle(
                        backgroundColor: CustomTheme.of(context).colors.neutral1,
                          textStyle: CustomTheme.of(context).typography.caption12Bold.copyWith(color: CustomTheme.of(context).colors.neutral2)
                      ),
                      view: CalendarView.month,
                      // by default the month appointment display mode set as Indicator, we can
                      // change the display mode as appointment using the appointment display
                      // mode property
                      // monthViewSettings: MonthViewSettings(
                      //     appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                      //     monthCellStyle: MonthCellStyle(
                      //       backgroundColor: CustomTheme.of(context).colors.neutral1,
                      //       trailingDatesBackgroundColor: CustomTheme.of(context).colors.neutral1,
                      //       leadingDatesBackgroundColor: CustomTheme.of(context).colors.neutral1,
                      //       trailingDatesTextStyle:  CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral2),
                      //         leadingDatesTextStyle:  CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral2),
                      //       textStyle: CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral4)
                      //     )
                      // ),
                      monthCellBuilder: (context, details) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 11),
                          decoration: BoxDecoration(color:  CustomTheme.of(context).colors.neutral1),
                          child: Center(child: Text( details.date.day.toString(), style: CustomTheme.of(context).typography.body14Medium.copyWith(color: details.date.month != DateTime.now().month ? CustomTheme.of(context).colors.neutral2.withOpacity(0.6) : CustomTheme.of(context).colors.neutral4)))
                        );
                      },
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomTheme.of(context).colors.primary1
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Text('All complete', style: CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral4),)
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: CustomTheme.of(context).colors.primary1, width: 1)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('Some complete', style: CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral4))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Container(width:12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, gradient: AppColors.gradient6),),
                        const SizedBox(width: 8,),
                        Text('In progress', style: CustomTheme.of(context).typography.body14Medium.copyWith(color: CustomTheme.of(context).colors.neutral4),)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}

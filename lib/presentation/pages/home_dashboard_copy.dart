import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/bussiness/usecase/register_usecase.dart';
import 'package:squadsyncweb/data/data_source/register_user_key_cloak_data_source.dart';
import 'package:squadsyncweb/data/repository/register_user_data_respository.dart';
import 'package:squadsyncweb/presentation/bloc/add_users_bloc/add_users_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_athletes_bloc/all_athletes_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_coaches_bloc/all_coaches_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/all_staff_bloc/all_staff_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_admins_bloc/create_and_manage_organization_admins_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/create_and_manage_organization_bloc/create_manage_organization_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/home_dash_board_copy_bloc/home_dash_board_copy_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/home_dash_board_copy_bloc/home_dash_board_copy_event.dart';
import 'package:squadsyncweb/presentation/bloc/home_dash_board_copy_bloc/home_dash_board_copy_state.dart';
import 'package:squadsyncweb/presentation/bloc/view_organization_admin_bloc/view_organization_admin_bloc.dart';
import 'package:squadsyncweb/presentation/bloc/view_super_admin_bloc/view_super_admin_bloc.dart';
import 'package:squadsyncweb/presentation/pages/add_users.dart';
import 'package:squadsyncweb/presentation/pages/all_athletes.dart';
import 'package:squadsyncweb/presentation/pages/all_coaches.dart';
import 'package:squadsyncweb/presentation/pages/all_staff.dart';
import 'package:squadsyncweb/presentation/pages/create_and_manage_organization.dart';
import 'package:squadsyncweb/presentation/pages/create_and_manage_organization_admins.dart';
import 'package:squadsyncweb/presentation/pages/home_dash_board.dart';
import 'package:squadsyncweb/presentation/pages/view_organization_admin.dart';
import 'package:squadsyncweb/presentation/pages/view_super_admin.dart';
import 'package:squadsyncweb/presentation/widgets/common/dash_board_back_ground.dart';
import 'package:squadsyncweb/presentation/widgets/common/drawer_of_website.dart';

// feat: Implement HomeDashboardCopy screen

// This commit introduces the HomeDashboardCopy screen, which serves as the main dashboard interface in the Flutter app. The screen consists of a DrawerOfWebsite widget on the left side for navigation and a DashBoardBackGround widget on the right side for displaying various screens based on user interaction.

// The list of screens includes options for viewing super admin, organization admin, managing organizations, managing organization admins, adding users, viewing all athletes, coaches, and staff.

// The screen uses BlocProvider to manage the state of each screen independently, ensuring efficient state management and screen updates based on user actions.

// This screen enhances the user experience by providing a comprehensive dashboard interface with seamless navigation and access to various functionalities.

class HomeDashboardCopy extends StatelessWidget {
  const HomeDashboardCopy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfTheScreens = [
      const HomeDashBoard(),
      BlocProvider(
        create: (context) => ViewSuperAdminBloc(),
        child: const ViewSuperAdmin(),
      ),
      BlocProvider(
        create: (context) => ViewOrganizationAdminBloc(),
        child: const ViewOrganizationAdmin(),
      ),
      BlocProvider(
        create: (context) => CreateAndManageOrganizationBloc(),
        child: const CreateAndManageOrganization(),
      ),
      BlocProvider(
        create: (context) => CreateAndManageOrganizationAdminsBloc(),
        child: const CreateAndManageOrganizationAdmins(),
      ),
      BlocProvider(
        create: (context) => AddUsersBloc(
          registerUsecase: RegisterUsecase(
            registerBussinessRepository: RegisterUserDataRepository(
              registerUserKeyCloakDataSource: RegisterUserKeyCloakDataSource(),
            ),
          ),
        ),
        child: const AddUsers(),
      ),
      BlocProvider(
        create: (context) => AllAthletesBloc(),
        child: const AllAthletes(),
      ),
      BlocProvider(
        create: (context) => AllCoachesBloc(),
        child: const AllCoaches(),
      ),
      BlocProvider(
        create: (context) => AllStaffBloc(),
        child: const AllStaff(),
      ),
    ];

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            BlocConsumer<HomeDashBoardCopyBloc, HomeDashBoardCopyState>(
              bloc: context.read<HomeDashBoardCopyBloc>(),
              listener: (context, state) {},
              builder: (context, state) {
                return Expanded(
                  flex: 1,
                  child: DrawerOfWebsite(
                    currentScreen: state.currentScreen,
                    changeTheRoute: (value) {
                      context
                          .read<HomeDashBoardCopyBloc>()
                          .add(HomeDashBoardCopyUpdateEvent(value: value));
                    },
                  ),
                );
              },
            ),
            BlocConsumer<HomeDashBoardCopyBloc, HomeDashBoardCopyState>(
              bloc: context.read<HomeDashBoardCopyBloc>(),
              listener: (context, state) {},
              builder: (context, state) {
                return Expanded(
                  flex: 5,
                  child: DashBoardBackGround(
                      screen: listOfTheScreens[state.currentScreen]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

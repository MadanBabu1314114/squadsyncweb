// feat: Implement AddUsersBloc functionality

// This commit adds the AddUsersBloc, which handles the logic for uploading files and starting user registration in the app. The bloc listens to AddUsersEvent and emits corresponding AddUsersState.

// The AddUsersBloc includes methods to handle file upload events, start registration events, and cancel registration events. When a file upload event is triggered, the bloc parses the CSV file, displays loading banners, and emits AddUsersLoadedstate once the file is parsed successfully.

// When a registration event is triggered, the bloc uploads the file to the server, handles successful or failed uploads, and updates the state accordingly. For athletes, the bloc uploads the file and updates the upload status and message for each user in the CSV file.

// The AddUsersBloc enhances the user experience by providing seamless file upload and user registration functionalities in the app.

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadsyncweb/bussiness/entity/contact.dart';
import 'package:squadsyncweb/bussiness/usecase/register_usecase.dart';
import 'package:squadsyncweb/common/data.dart';
import 'package:squadsyncweb/common/data_of_add_users.dart';
import 'package:squadsyncweb/common/download_theFile.dart';
import 'package:squadsyncweb/common/parse_excel_file.dart';
import 'package:squadsyncweb/data/data_source/uploading_file.dart';
import 'package:squadsyncweb/presentation/bloc/add_users_bloc/add_users_event.dart';
import 'package:squadsyncweb/presentation/bloc/add_users_bloc/add_users_state.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class AddUsersBloc extends Bloc<AddUsersEvent, AddUsersState> {
  final RegisterUsecase registerUsecase;
  AddUsersBloc({required this.registerUsecase})
      : super(AddUsersInitialState()) {
    on<AddUsersUploadTheFileEvent>(addUsersUploadTheFileEvent);
    on<AddUsersStartTheRegisterationEvent>(addUsersStartTheRegisterationEvent);
    on<AddUsersCancelEvent>(addUsersCancelEvent);
  }

  FutureOr<void> addUsersUploadTheFileEvent(
      AddUsersUploadTheFileEvent event, Emitter<AddUsersState> emit) async {
    emit(AddUsersLoadingstate());
    CustomMaterialBanner().show(event.context, "Loading");
    excelData = event.file;
    listOfRows = await ExcelOperations()
        .parseCsvFileFromDropDragFile(event.file, event.context);

    CustomMaterialBanner().show(event.context, "Loaded");

    emit(AddUsersLoadedstate());
  }

  FutureOr<void> addUsersStartTheRegisterationEvent(
    AddUsersStartTheRegisterationEvent event,
    Emitter<AddUsersState> emit,
  ) async {
    // result!.files.clear;

    emit(AddUsersUploadingState());
    // final jsonFormateData =
    //     await ExcelOperations().convertExcelToJson(excelData, event.context);
    // await DownloadTheFile()
    //     .download(jsonFormateData: jsonFormateData, context: event.context);
    // for (var user in listOfRows.skip(1)) {

    //   final result = await registerUsecase.register(
    //     event.context,
    //     user[0],
    //     user[1],
    //     user[2],
    //     user[4],
    //     '${user[0]}@112!',
    //     "Player",
    //   );
    //   if (result == "Successfull") {
    //     successful += 1;
    //     user.add(result);
    //     user.add('result');
    //   } else {
    //     failed += 1;
    //     user.add('Failed');
    //     user.add(result);
    //   }
    // }
    // listOfRows[0].add('UPLOAD STATUS');
    // listOfRows[0].add('MESSAGE');

    if (event.isAthlete) {
      final isUploaded = await UploadingFile().uploadFileForAthletes(
          result!,
          event.context,
          userTokenBox.get(userTokenBox.length - 1)!.accessToken);
      listOfRows.removeLast();
      if (isUploaded) {
        listOfRows[0].add('MESSAGE');
        int count = 0;
        for (var user in listOfRows.skip(1)) {
          user.add(responseMessage);
          successful += 1;
        }
        emit(AddUsersUploadedState());
      } else {
        listOfRows[0].add('MESSAGE');
        int count = 0;
        for (var user in listOfRows.skip(1)) {
          user.add(responseMessage);
          failed += 1;
        }
      }
    } else {
      // UploadingFile()
      //     .uploadFileForHEadCoach(result!.files.first.path.toString() , event.context , userToken.accessToken);
    }
    emit(AddUsersUploadedState());
  }

  FutureOr<void> addUsersCancelEvent(
      AddUsersCancelEvent event, Emitter<AddUsersState> emit) {
    listOfRows.clear();
    result!.files.clear;
    successful = 0;
    failed = 0;
    emit(AddUsersInitialState());
  }
}

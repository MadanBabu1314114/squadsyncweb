import 'dart:math';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:squadsyncweb/common/data_of_add_users.dart';
import 'package:squadsyncweb/presentation/widgets/common/custom_material_banner.dart';

class AddUsersDragDropBox extends StatefulWidget {
  const AddUsersDragDropBox(
      {Key? key,
      required this.heading,
      required this.description,
      required this.uploadEvent})
      : super(key: key);
  final String heading;
  final String description;
  final Function(Uint8List) uploadEvent;

  @override
  State<AddUsersDragDropBox> createState() => _AddUsersDragDropBoxState();
}

class _AddUsersDragDropBoxState extends State<AddUsersDragDropBox> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 299,
        decoration: ShapeDecoration(
          color: const Color.fromARGB(139, 22, 22, 22),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(
                  color: Color.fromARGB(139, 22, 22, 22), width: 0.89)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.heading,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: const Color(0XFFFBA24F),
                                shadows: [
                                  const BoxShadow(
                                      color: Color(0XFFFBA24F), blurRadius: 25)
                                ],
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0XFFFBA24F),
                              ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(126, 251, 138, 0),
                          Color.fromARGB(118, 149, 82, 0)
                        ]),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Wrap(
                        children: [
                          Transform.rotate(
                            angle: pi / 2,
                            child: const Icon(
                              Icons.login,
                              size: 31,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "DOWNLOAD BLANK TEMPLATE FOR LOADING ${widget.description}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  onPressed: () async {
                    try {
                      result = await FilePicker.platform.pickFiles();

                      if (result != null) {
                        final file = result?.files.first.bytes;

                        if (file == null) {
                          CustomMaterialBanner().show(context, "File is null");
                        } else {
                          widget.uploadEvent(file);
                        }

                        String fileName = result!.files.first.name;
                        if (!fileName.endsWith('.csv')) {
                          CustomMaterialBanner().show(context,
                              "Invalid file format. Please select an Excel file (.xlsx)");
                        }
                      } else {
                        CustomMaterialBanner()
                            .show(context, "File picking cancelled by user");
                      }
                    } catch (e) {
                      CustomMaterialBanner().show(
                          context, "Error occurred while picking file: $e");
                    }
                  },
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:
                              const BorderSide(color: Colors.white, width: 4)),
                    ),
                    child: Stack(
                      children: [
                        DropzoneView(
                          onCreated: (controller) =>
                              this.controller = controller,
                          onDrop: (value) async {
                            final file = await controller.getFileData(value);

                            widget.uploadEvent(file);
                          },
                          onHover: () => setState(() => highlight = true),
                          onLeave: () => setState(() => highlight = false),
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.cloud_upload_rounded,
                                color: Colors.white,
                                size: 107,
                              ),
                              Container(
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(126, 251, 138, 0),
                                    Color.fromARGB(118, 149, 82, 0)
                                  ]),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "CHOOSE FILE TO UPLOAD",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              Text(
                                "OR",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "DRAG AND DROP THEN HERE",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dokan_app/components/global_widgets/global_widgets.dart';
import 'package:dokan_app/modules/home/home.dart';
import 'package:dokan_app/storage/storage.dart';
import 'package:dokan_app/utils/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _storageController = Get.find<StorageController>();
  final _controller = Get.find<ProfileController>();

  @override
  void initState() {
    if(_controller.userInfo == null){
      _controller.fetchUserInfo();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: GlobalAppBar.common(text: 'My Account'),
      body: Obx(() => ((){
        if(!_controller.isLoading && _controller.userInfo == null){
          return  const AppErrorWidget(message: Strings.errorFetchingData);
        } else {
          return Skeletonizer(
            enabled: _controller.isLoading,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    children: [

                      ProfileWidgets.profileHeader(
                        name: _controller.userInfo?.name ?? '',
                        email: _storageController.getUserEmail(),
                        userImageLink: _controller.userInfo?.avatarUrls?.s96 ?? ''
                      ),


                      60.verticalSpace,
                          ProfileWidgets.options(
                            context,
                            emailController: _controller.emailController,
                            nameController: _controller.nameController,
                            passController: _controller.passController,
                            onTapEmailSave: () {},
                            onTapPassSave: () {},
                          ),
                        ],
                  ),
                ),
              ),
            ),
          );
        }
      }())),
    );
  }
}



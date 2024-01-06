import 'package:bwa/blocs/auth/auth_bloc.dart';
import 'package:bwa/core.dart';
import 'package:bwa/shared/shared_methods.dart';
import 'package:bwa/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: lightBgColor,
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
            showCustomSnackBar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: state.user.profilPicture == null
                              ? const AssetImage('assets/img_profile.png')
                              : NetworkImage(
                                  state.user.profilPicture!,
                                ) as ImageProvider,
                        ),
                      ),
                      child: state.user.verified! == 0
                          ? Container()
                          : Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: whiteColor),
                                child: Center(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ProfileMenuItem(
                        iconUrl: 'assets/ic_edit_profile.png',
                        title: 'Edit Profile',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit');
                          }
                        }),
                    ProfileMenuItem(
                        iconUrl: 'assets/ic_pin.png',
                        title: 'My Pin',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-pin');
                          }
                        }),
                    ProfileMenuItem(
                        iconUrl: 'assets/ic_wallet.png',
                        title: 'Wallet Setting',
                        onTap: () {}),
                    ProfileMenuItem(
                        iconUrl: 'assets/ic_rewards.png',
                        title: 'My Reward',
                        onTap: () {}),
                    ProfileMenuItem(
                        iconUrl: 'assets/ic_help.png',
                        title: 'Help Center',
                        onTap: () {}),
                    ProfileMenuItem(
                        iconUrl: 'assets/ic_logout.png',
                        title: 'Logout',
                        onTap: () {
                          context.read<AuthBloc>().add(const AuthLogout());
                        }),
                  ]),
                ),
                const SizedBox(
                  height: 87,
                ),
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

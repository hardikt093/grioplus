import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/common/common_list_tiles.dart';
import '../../ChangePassword/change_password_screen.dart';
import '../../DeleteAccount/delete_account_screen.dart';
import '../../SubscriptionDetails/subscription_details_screen.dart';
import '../../Watchlist/watchlist_screen.dart';

class ProfileListTiles extends StatelessWidget {
  const ProfileListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WatchlistScreen()),
            );
          },
          title: BaseStrings.watchlist,
          icon: BaseAssets.watchlistIcon,
        ),
        CommonListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const SubscriptionDetailsScreen()),
            );
          },
          title: BaseStrings.subscription,
          icon: BaseAssets.subscriptionIcon,
          hasSubscription: true,
        ),
        CommonListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen()),
            );
          },
          title: BaseStrings.changePassword,
          icon: BaseAssets.changePasswordIcon,
        ),
        CommonListTile(
          onTap: () {},
          title: BaseStrings.privacyPolicy,
          icon: BaseAssets.privacyPolicyIcon,
        ),
        CommonListTile(
          onTap: () {},
          title: BaseStrings.termsOfUse,
          icon: BaseAssets.termsAndConditionsIcon,
        ),
        CommonListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const DeleteAccountScreen()),
            );
          },
          title: BaseStrings.deleteAccount,
          icon: BaseAssets.deleteAccountIcon,
        ),
      ],
    );
  }
}

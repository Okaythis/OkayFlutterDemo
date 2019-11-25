import 'package:okaythis_flutter_plugin/okaythis_flutter_plugin.dart' ;

class BaseTheme {

  static Map<String, String> getTheme () {
    return {
      PageTheme.ACTION_BAR_BACKGROUND_COLOR: ThemeColors.primaryDarkColor,
      PageTheme.ACTION_BAR_TEXT_COLOR: ThemeColors.primaryTextColor,
      PageTheme.SCREEN_BACKGROUND_COLOR: ThemeColors.primaryColor,
      PageTheme.BUTTON_BACKGROUND_COLOR: ThemeColors.secondaryColor,
      PageTheme.BUTTON_TEXT_COLOR: ThemeColors.secondaryTextColor,


      PageTheme.PIN_NUMBER_BUTTON_TEXT_COLOR: ThemeColors.secondaryColor,
      PageTheme.PIN_NUMBER_BUTTON_BACKGROUND_COLOR: ThemeColors.secondaryLightColor,
      PageTheme.PIN_REMOVE_BUTTON_BACKGROUND_COLOR: ThemeColors.secondaryLightColor,
      PageTheme.PIN_REMOVE_BUTTON_TEXT_COLOR: ThemeColors.secondaryTextColor,
      PageTheme.PIN_TITLE_TEXT_COLOR: ThemeColors.primaryTextColor,
      PageTheme.PIN_VALUE_TEXT_COLOR: ThemeColors.primaryTextColor,

      PageTheme.TITLE_TEXT_COLOR: ThemeColors.primaryTextColor,
      PageTheme.QUESTION_MARK_COLOR: ThemeColors.primaryLightColor,
      PageTheme.TRANSACTION_TYPE_TEXT_COLOR: ThemeColors.primaryTextColor,

      PageTheme.AUTH_INFO_BACKGROUND_COLOR: ThemeColors.transactionInfoBackground,
      PageTheme.INFO_SECTION_TITLE_COLOR: ThemeColors.secondaryLightColor,
      PageTheme.INFO_SECTION_VALUE_COLOR: ThemeColors.secondaryTextColor,
      PageTheme.FROM_TEXT_COLOR: ThemeColors.secondaryTextColor,
      PageTheme.MESSAGE_TEXT_COLOR: ThemeColors.secondaryTextColor,

      PageTheme.CONFIRM_BUTTON_BACKGROUND_COLOR: ThemeColors.secondaryLightColor,
      PageTheme.CONFIRM_BUTTON_TEXT_COLOR: ThemeColors.secondaryTextColor,
      PageTheme.CANCEL_BUTTON_BACKGROUND_COLOR: ThemeColors.primaryLightColor,
      PageTheme.CANCEL_BUTTON_TEXT_COLOR: ThemeColors.primaryTextColor,


      PageTheme.AUTH_CONFIRMATION_BUTTON_BACKGROUND_COLOR: ThemeColors.secondaryColor,
      PageTheme.AUTH_CONFIRMATION_BUTTON_TEXT_COLOR: ThemeColors.secondaryTextColor,
      PageTheme.AUTH_CANCELLATION_BUTTON_BACKGROUND_COLOR: ThemeColors.primaryColor,
      PageTheme.AUTH_CONFIRMATION_BUTTON_TEXT_COLOR: ThemeColors.primaryTextColor,

      PageTheme.NAME_TEXT_COLOR: ThemeColors.secondaryTextColor,

      PageTheme.BUTTON_BACKGROUND_COLOR: ThemeColors.primaryLightColor,
      PageTheme.BUTTON_TEXT_COLOR: ThemeColors.primaryTextColor,
      PageTheme.INPUT_TEXT_COLOR: ThemeColors.secondaryTextColor,
      PageTheme.INPUT_SELECTION_COLOR: ThemeColors.green,
      PageTheme.INPUT_ERROR_COLOR: ThemeColors.red,
      PageTheme.INPUT_DEFAULT_COLOR: ThemeColors.gray,
    };
  }
}

class ThemeColors {
  static final String primaryColor = '#1976d2';
  static final String primaryLightColor = '#63a4ff';
  static final String primaryDarkColor = '#004ba0';
  static final String secondaryColor = '#f9a825';
  static final String secondaryLightColor = '#ffd95a';
  static final String secondaryDarkColor = '#c17900';
  static final String pinControlsBackground = '#cfd8dc';
  static final String transactionInfoBackground = white;
  static final String primaryTextColor = white;
  static final String secondaryTextColor = black;

  static final String red = '#ff0000';
  static final String gray = '#c5c5c5';
  static final String green = '#00ff00';
  static final String white = '#ffffff';
  static final String black = '#000000';
}
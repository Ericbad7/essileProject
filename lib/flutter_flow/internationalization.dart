import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'i1fmtz78': {
      'en': 'Welcome ',
      'fr': '',
    },
    '212xqtop': {
      'en': 'Login to access your account below.',
      'fr': '',
    },
    'y7ya5dp4': {
      'en': 'Email Address',
      'fr': '',
    },
    'bmz4ik3y': {
      'en': 'Enter your email...',
      'fr': '',
    },
    's0468zkm': {
      'en': 'Password',
      'fr': '',
    },
    '369w2j9b': {
      'en': 'Enter your password...',
      'fr': '',
    },
    'uf8ublmz': {
      'en': 'Forgot Password?',
      'fr': '',
    },
    '1xrh8c81': {
      'en': 'Login',
      'fr': '',
    },
    '0752nrgu': {
      'en': 'Don\'t have an account?',
      'fr': '',
    },
    'sniztyep': {
      'en': 'Create',
      'fr': '',
    },
    '1v0ouwl9': {
      'en': 'Home',
      'fr': '',
    },
  },
  // registerAccount
  {
    'atj6s6ff': {
      'en': 'Get Started',
      'fr': '',
    },
    'i6dh1cfm': {
      'en': 'Create your account below.',
      'fr': '',
    },
    'qmpl1adm': {
      'en': 'Email Address',
      'fr': '',
    },
    'hyjhtpjj': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'naxsyvon': {
      'en': 'Password',
      'fr': '',
    },
    'ge6nwck9': {
      'en': 'Enter your password...',
      'fr': '',
    },
    'gsdik4nz': {
      'en': 'Confirm Password',
      'fr': '',
    },
    '2bkwxfwo': {
      'en': 'Enter your password...',
      'fr': '',
    },
    'hjunhoqu': {
      'en': 'Create Account',
      'fr': '',
    },
    'jc8smaab': {
      'en': 'Login',
      'fr': '',
    },
    'y7uy5pmy': {
      'en': 'Already have an account?',
      'fr': '',
    },
    'ibfok073': {
      'en': 'Continue as Guest',
      'fr': '',
    },
    'a5nnm0oa': {
      'en': 'Home',
      'fr': '',
    },
  },
  // completeProfile
  {
    'tnzv6jur': {
      'en': 'Complete Profile',
      'fr': '',
    },
    'mb816yqd': {
      'en': 'Upload a photo for us to easily identify you.',
      'fr': '',
    },
    'dxpsqf2l': {
      'en': 'Your Name',
      'fr': '',
    },
    'epu8reuk': {
      'en': 'Your Age',
      'fr': '',
    },
    '97opcqtn': {
      'en': 'i.e. 34',
      'fr': '',
    },
    '4y686brq': {
      'en': 'Your Title',
      'fr': '',
    },
    '5pnwhhxs': {
      'en': 'What is your position?',
      'fr': '',
    },
    'cft5br64': {
      'en': 'Complete Profile',
      'fr': '',
    },
    '2zb6z6ed': {
      'en': 'Skip for Now',
      'fr': '',
    },
    '2cduvy4v': {
      'en': 'Field is required',
      'fr': '',
    },
    'gz90ifv6': {
      'en': 'Field is required',
      'fr': '',
    },
    '1j80d1gc': {
      'en': 'Field is required',
      'fr': '',
    },
    '51utj01b': {
      'en': 'Home',
      'fr': '',
    },
  },
  // forgotPassword
  {
    'r1lglais': {
      'en': 'Forgot Password',
      'fr': '',
    },
    'uzo606a3': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'fr': '',
    },
    'vvm6x7rv': {
      'en': 'Email Address',
      'fr': '',
    },
    'vo7912gh': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'h69zj1yl': {
      'en': 'Send Reset Link',
      'fr': '',
    },
    '0oygz1wl': {
      'en': 'Home',
      'fr': '',
    },
  },
  // onboarding
  {
    '14o6odlb': {
      'en': 'Guarantee access\n to drinking water',
      'fr': '',
    },
    'dlgt8la1': {
      'en':
          'It is a vital resource for the populations, an essential factor of sustainable development behind which Togo has been running for several years.',
      'fr': '',
    },
    'jmqvsdnq': {
      'en': 'Skip Now',
      'fr': '',
    },
    '3csyyurx': {
      'en': 'Supply\n in drinking water',
      'fr': '',
    },
    'lndbxyov': {
      'en':
          'Slowly but surely, Togo is on the way to universal access to water. A round table is being prepared in Lomé in this regard and will contribute to mobilizing technical and financial partners to achieve this objective.',
      'fr': '',
    },
    'rdnwnrzt': {
      'en': 'Skip',
      'fr': '',
    },
    'zvbpw54p': {
      'en': 'Drinking Water',
      'fr': '',
    },
    '6e0od2ja': {
      'en':
          'Togo has insufficient drinking water coverage with only 57% of the population having access to an improved water point.',
      'fr': '',
    },
    'gmhecidb': {
      'en': 'Let\'s Go',
      'fr': '',
    },
  },
  // MY_Card
  {
    'es5z6npa': {
      'en': 'EssiLe',
      'fr': '',
    },
    'sudyjfee': {
      'en': 'The application of water supply in Togo\n 100% Free',
      'fr': '',
    },
    'xpgqxrmp': {
      'en': 'SDE',
      'fr': '',
    },
    'ssqz3rwl': {
      'en': 'Dispo partout 🚛',
      'fr': '',
    },
    'd0msjwxn': {
      'en': '🗓️ 07jr/07',
      'fr': '',
    },
    '74czjwmr': {
      'en': 'TOGO',
      'fr': '',
    },
    'pp3vueu6': {
      'en': '8.645M',
      'fr': '',
    },
    'uw3ozjop': {
      'en': '56.6K *',
      'fr': '',
    },
    'yshjkzt4': {
      'en': 'WATER POINTS',
      'fr': '',
    },
    'cifylzyf': {
      'en': '12454',
      'fr': '',
    },
    'soo5h4gi': {
      'en': '695/Km*',
      'fr': '',
    },
    'ajct3ht0': {
      'en': 'Quick Services',
      'fr': '',
    },
    '7gboxg27': {
      'en': 'Statistics',
      'fr': '',
    },
    'wyad5esk': {
      'en': 'OnGoing \nProjects',
      'fr': '',
    },
    '3hovaxko': {
      'en': 'Alert\n ',
      'fr': '',
    },
    'erz297h5': {
      'en': 'National\n Card',
      'fr': '',
    },
    'ane47btg': {
      'en': 'Water \nAnd Soil',
      'fr': '',
    },
    '37j5oci4': {
      'en': 'Community\n Chat',
      'fr': '',
    },
    'x5qyqpi8': {
      'en': 'Partners',
      'fr': '',
    },
    'xnvkdxpg': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // Miscellaneous
  {
    'w1h3f09h': {
      'en': 'Autorize',
      'fr': '',
    },
    '7hxa31ln': {
      'en': 'Allow ',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

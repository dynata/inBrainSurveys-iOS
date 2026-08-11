
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and `InBrainSurveys` adheres to [Semantic Versioning](http://semver.org/).

## [3.0.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/3.0.2) - 2026-08-11

### Fixed
- Error `missing session` 

## [3.0.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/3.0.1) - 2026-06-12

### Fixed
- White screen after `Forfeit reward`

## [3.0.0](https://github.com/dynata/inBrainSurveys-iOS/releases/tag/3.0.0) - 2025-05-10

### Added
- **Native Offers Support:**
    - `InBrainNativeOffer` - class representing a native offer
    - `InBrainOfferFilter` - class for filtering native offers
    - `InBrainOfferType` - enum used to specify which offers to fetch from API using the filter
    - `InBrainOfferGoal` - class representing offer goals
    - `InBrainOfferPromotion` - class representing offer promotions
    - `getNativeOffers(filter:success:failed:)` function to `InBrain` for fetching native offers
    - `openOfferWith(id:success:failed:)` function to `InBrain` for opening specific offers
- **New Survey Functions:**
    - `openSurvey(_ survey: InBrainNativeSurvey, offersEnabled: Bool, from viewController: UIViewController? = nil)` function to `InBrain`
    - `openSurveyWith(id surveyId: String, searchId: String, offersEnabled: Bool, from viewController: UIViewController? = nil)` function to `InBrain`

### Changed
- Refactored internal API and authentication layers for better performance and stability

### Deprecated
- `setInBrain(apiClientID:apiSecret:isS2S:userID:)` - use `setInBrain(apiClientID:apiSecret:isS2S:)` followed by `set(userID:)` instead
- `showNativeSurvey(_ survey: InBrainNativeSurvey, offersEnabled: Bool, from viewController: UIViewController? = nil)` - use `openSurvey(survey:offersEnabled:from:)` instead
- `showNativeSurveyWith(id surveyId: String, searchId: String, offersEnabled: Bool, from viewController: UIViewController? = nil)` - use `openSurveyWith(id:searchId:offersEnabled:from:)` instead

### Removed
- **Functions:**
    - `setLanguage(_:)` function
    - `showSurveys(from viewController: UIViewController? = nil)` - use `openWall(with:)` instead
    - `showNativeSurvey(_ survey: InBrainNativeSurvey, from viewController: UIViewController? = nil)` - use `showNativeSurvey(survey:offersEnabled:from:)` instead
    - `showNativeSurveyWith(id surveyId: String, searchId: String, from viewController: UIViewController? = nil)` - use `showNativeSurveyWith(id:searchId:offersEnabled:from:)` instead
    - `setInBrainValuesFor(sessionID:, dataOptions:)` - use `setSessionID(_:)` and `setDataOptions(_:)` instead
    - `getNativeSurveys(placementId: String?)` - use `getNativeSurveys(filter:)` instead
    - `getNativeSurveys(placementID: String?, success:, failed:)` - use `getNativeSurveys(filter:success:failed:)` instead
    - `surveysClosed(byWebView: Bool, completedSurvey: Bool)` function of `InBrainDelegate` - use `surveysClosed(byWebView:completedSurvey:rewards:)` instead
    - `surveysClosedFromPage()` from `InBrainDelegate`
    - `surveysClosed()` (no parameters version) from `InBrainDelegate`
    - `nativeSurveysLoadingStarted()` from `NativeSurveyDelegate`
    - `nativeSurveysLoadingStarted(placementId: String?)` from `NativeSurveyDelegate`
    - `nativeSurveysReceived(_ surveys: [InBrainNativeSurvey])` from `NativeSurveyDelegate`
    - `nativeSurveysReceived(_ surveys: [InBrainNativeSurvey], placementId: String?)` from `NativeSurveyDelegate`
    - `failedToReceiveNativeSurveys(error: Error)` from `NativeSurveyDelegate`
    - `failedToReceiveNativeSurveys(error: Error, placementId: String?)` from `NativeSurveyDelegate`
    
- **Properties:**
    - `profileMatch` property of `InBrainNativeSurvey`
    - `SurveyProfileMatch` enum
    - `start` property of `InBrainCurrencySale` - use `startOn` instead
    - `end` property of `InBrainCurrencySale` - use `endOn` instead
    

## [2.5.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.5.1) - 2025-24-03

### Changed
- Default option for `openWall(with option: InBrainWallOption = .surveys, from viewController: UIViewController? = nil)` is `surveys`;
- Disable the `offers` for `showNativeSurvey(_ survey: InBrainNativeSurvey, from viewController: UIViewController? = nil)` function;
- Disable the `offers` for `showNativeSurveyWith(id surveyId: String, searchId: String, from viewController: UIViewController? = nil)` function.

## [2.5.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.5.0) - 2024-12-04

### Added
- Added the ability to enable the possible options for the wall;
- `InBrainWallOption` - enum, represents possible options;
- `openWall(with option: InBrainWallOption = .all, from viewController: UIViewController? = nil)` function to `InBrain`;
- `showNativeSurvey(_ survey: InBrainNativeSurvey, offersEnabled: Bool, from viewController: UIViewController? = nil)` function to `InBrain`;
- `showNativeSurveyWith(id surveyId: String, searchId: String, offersEnabled: Bool, from viewController: UIViewController? = nil)` function to `InBrain`.

### Deprecated
- `showSurveys(from viewController: UIViewController? = nil)` function;
- `showNativeSurvey(_ survey: InBrainNativeSurvey, from viewController: UIViewController? = nil)` function;
- `showNativeSurveyWith(id surveyId: String, searchId: String, from viewController: UIViewController? = nil)` function.

## [2.4.3](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.4.3) - 2024-09-17

### Added
- Support of the new "offers" feature

## [2.4.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.4.2) - 2024-08-28

### Fixed
- Performance and stability improvements.

## [2.4.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.4.1) - 2024-07-30

### Fixed
- Performance and stability improvements.

## [2.4.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.4.0) - 2024-01-23

### Added
- Support of Panelist (Dynamic) Currency Sales - the SDK return the active sale with the higher multiplier across active Publisher and Panelist sales;
- arm64 arch for simulators (podspec won't exclude arm64 for iPhone simulators anymore).

## [2.3.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.3.0) - 2023-10-10

### Added
- `isProfilerSurvey` property to `InBrainNativeSurvey`.

### Changed
- `start` and `end` properties of `InBrainCurrencySale` renamed to `startOn` and `endOn`.

## [2.2.3](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.2.3) - 2023-05-01

### Changed
- removed `checkForAvailableSurveys` country check from SDK, now all the logic handled by back-end. 

## [2.2.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.2.2) - 2023-04-17

### Fixed
- Apple Silicon build error resolved.

## [2.2.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.2.1) - 2023-02-07

### Fixed
- Performance and stability improvements and fixes.

## [2.2.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.2.0) - 2023-01-02

### Added
- `surveysClosed(byWebView: Bool, completedSurvey: Bool, rewards: [InBrainSurveyReward]?)` function to `InBrainDelegate`;
- `InBrainSurveyReward` class, which represents information about completed survey and earned reward.

### Deprecated
- `surveysClosed(byWebView: Bool, completedSurvey: Bool)` function.

## [2.1.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.1.0) - 2022-12-23

### Added
- `conversionLevel` property to `InBrainNativeSurvey` and corresponding `SurveyConversionLevel` enum.

### Deprecated
- `setLanguage(_:)` function;
- `setInBrainValuesFor(sessionID:, dataOptions:)` function in favour of `setSessionID(_:)` and `setDataOptions(_:)` functions;
- `profileMatch` property of `InBrainNativeSurvey` and corresponding `SurveyProfileMatch` enum.

## [2.0.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.0.1) - 2022-12-15

### Added
- Swift Package Manager (SPM) support;
- Small improvements.

### Removed
- Bitcode.

## [2.0.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/2.0.0) - 2022-10-27

### Added
- `InBrainSurveyCategory` - enum, represents all the supported categories;
- `categories` (`categoryIds` for Obj-C) property to `InBrainNativeSurvey`;
- `InBrainSurveyFilter` - filter for fetching Native Surveys;
- Ability to fetch Native Surveys, filtered by categories.

### Changed
- `InBrainSurveys_SDK_Swift` renamed to `InBrainSurveys`; 
- `NativeSurvey`'s `placementId` property replaced with `searchId`;
- Fetching Native Surveys with `filter` instead of `placementId`;
- Show Native Survey with `searchId` instead of `placementId`;
- Survey interruption flow updated.

### Fixed
- Resume loading indicator when app goes foreground.

### Removed
- iOS 11 support.

## [1.8.7](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.7) - 2022-07-08

### Changed
- `SurveyProfileMatch` values updated.

## [1.8.6](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.6) - 2022-06-30

### Added
- `SurveyProfileMatch` enum, which indicates how the surveys matches to the user's profile;
- `profileMatch` property to NativeSurvey object.

## [1.8.5](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.5) - 2022-03-25

### Added
- Get active `Currency Sale`.

### Fixed
- `.swiftsourceinfo` warning when building for simulators.

### Removed
- arm64 arch for simulators;
- Xcode 12 support.

## [1.8.4](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.4) - 2022-03-04

### Fixed
- Loading indicator wasn't hidden at some screens.

### Removed
- iOS 10 support;
- Xcode 11 support.

## [1.8.3](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.3) - 2022-01-20

### Fixed
- `placementId` decoding for NativeSurveys.

## [1.8.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.2) - 2021-12-07

### Added
- `multiplier` and `currencySale` properties to NativeSurvey object.

### Fixed
- `surveyCompleted` flag for profiler survey.

## [1.8.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.1) - 2021-10-14

### Added
- `placementId` to NativeSurveyDelegate methods.

### Fixed
- archive with bitcode.

## [1.8.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.8.0) - 2021-09-23

### Added
- placement_id available for `Native Surveys`;
- language format validation.

### Fixed
- Wrong language/postcode detection bug;
- Loading indicator wasn't hidden at some screens. 

### Removed
- Deprecated methods.

## [1.7.3](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.7.3) - 2021-06-10

### Fixed
- iOS 15.0 beta 1 navigation bar translucent bug

## [1.7.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.7.2) - 2021-05-05

### Fixed
- Surveys availability for US users

## [1.7.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.7.1) - 2021-04-29

### Fixed
- Hide activity indicator after survey completed.

## [1.7.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.7.0) - 2021-03-31

### Added
- Catalyst support (macOS 10.15.1 and above).

## [1.6.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.6.0) - 2021-02-26

### Added
- Landscape mode.

## [1.5.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.5.2) - 2021-01-20

### Fixed
- Return no surveys in case of `timeout` error for `Native Surveys` request.

## [1.5.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.5.1) - 2021-01-15

### Fixed
- Hide activity indicator after `Profiler` survey loaded.

## [1.5.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.5.0) - 2021-01-13

### Added
- Custom loading indicator.

### Fixed
- Open redirects and links at new window.

## [1.4.12](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.12) - 2020-12-11

### Fixed
- Environment variables hotfix.

## [1.4.11](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.11) - 2020-12-11

### Added
- Request feedback if survey closed by user.

## [1.4.10](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.10) - 2020-12-04

### Changed
- Timeout for API requests increased to 10 seconds.

### Fixed
- Updates from previous releases, which were lost by merge issue.

## [1.4.9](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.9) - 2020-12-03

### Changed
- Default styles for Navigation and Status bars.

### Fixed
- Navigation's bar shadow.

## [1.4.8](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.8) - 2020-12-02

### Added
- `InBrainStatusBarConfig` alongside with `setStatusBarConfig` for Status bar customization.

### Changed
- `InBrainNavBarConfig` alongside with `setNavigationBarConfig` added for Navigation bar customization instead of the old methods. Old methods are deprecated.

### Fixed
- `Native Survey` reopening after user pressed `Back` at the `Native Survey`.

## [1.4.7](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.7) - 2020-12-01

### Changed
- Call API request failed callbacks from `Main` queue;
- Timeout for API requests set to 5 seconds;
- Don't remove "close" button from navigation bar.

### Fixed
- `Native Survey` reopening after user pressed `Back` at the `Native Survey`.

## [1.4.6](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.6) - 2020-11-11

### Added
- Get `Native Surveys` with callbacks.

## [1.4.5](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.5) - 2020-11-09

### Fixed
- Reload `Native Surveys` if some were completed.

## [1.4.4](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.4) - 2020-10-29

### Fixed
- Minor fixes and improvements.

## [1.4.3](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.3) - 2020-10-26

### Changed
- Existing `getRewards` method deprecated and new one added.

### Fixed
- Use `IDFV` for API requests in case if `user_id `not set or empty;
- Deprecation marks.

## [1.4.2](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.2) - 2020-10-21

### Added
- Keep auth token while valid and use it for the API requests;
- Refresh expired auth token.

### Changed
- Improvements for API error handling.

### Fixed
- Get rewards after `Profiler` survey;
- Portrait orientation for `WKWebView` if app supports landscape-only.

## [1.4.1](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.1) - 2020-10-16

### Fixed
- `WKWebView` orientation;
- Demo app minor fixes and improvements.

## [1.4.0](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/1.4.0) - 2020-10-13

### Added
- `Native Surveys`;
- Check for available surveys;
- Demo app (swift).

### Changed
- Navigation bar customization methods.

### Fixed
- Portrait orientation for `WKWebView`;
- Minor fixes and improvements.

## [1.3.5](https://github.com/inbrainai/inBrainSurveys_SDK/releases/tag/v1.3.5) - 2020-09-25
 
### Added
- Show surveys from desired `UIViewController`.

### Fixed
- Show surveys if `inBrainDelegate` not a UIViewController's subclass;
- Performance and stability improvements and fixes.


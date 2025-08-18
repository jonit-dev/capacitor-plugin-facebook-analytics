## Requirements

- **Capacitor 7.0.0+**
- **iOS 14.0+** 
- **Android API 23+** (Android 6.0)
- **Node.js 20+**

## Installation

```bash
npm install capacitor-plugin-facebook-analytics
npx cap sync
```

To use yarn:

```bash
yarn add capacitor-plugin-facebook-analytics
npx cap sync
```

## Android configuration

> **Note**: Manual plugin registration is no longer required in Capacitor 7

In file `android/app/src/main/AndroidManifest.xml`, add the following XML elements under `<manifest><application>` :

```diff
+ <meta-data android:name="com.facebook.sdk.ApplicationId"
+     android:value="@string/facebook_app_id"/>
```

In file `android/app/src/main/res/values/strings.xml` add the following lines :

```diff
+ <string name="facebook_app_id">[APP_ID]</string>
```

Don't forget to replace `[APP_ID]` by your Facebook application Id.

More information can be found here: https://developers.facebook.com/docs/app-events/getting-started-app-events-android

## iOS configuration

Add the following in the `ios/App/App/info.plist` file:

```diff
+ <key>FacebookAppID</key>
+ <string>[APP_ID]</string>
+ <key>FacebookDisplayName</key>
+ <string>[APP_NAME]</string>
```

More information can be found here: https://developers.facebook.com/docs/app-events/getting-started-app-events-ios

## Supported methods

| Name                  | Android | iOS | Web |
| :-------------------- | :------ | :-- | :-- |
| logEvent              | ✅      | ✅  | ❌ |

## API

### logEvent

```ts
import { FacebookAnalytics } from 'capacitor-plugin-facebook-analytics';

// Example commands.
await FacebookAnalytics.logEvent({ event: 'test_event', valueToSum: 1.0, params: { test: 'value' } });
await FacebookAnalytics.logPurchase({ amount: 9.99, currency: 'USD', params: { product: 'item' } });
await FacebookAnalytics.logAddPaymentInfo({ success: 1 });
await FacebookAnalytics.logAddToCart({ amount: 19.99, currency: 'USD', params: { item: 'product' } });
await FacebookAnalytics.logCompleteRegistration({ params: { method: 'email' } });
await FacebookAnalytics.logInitiatedCheckout({ amount: 29.99, params: { num_items: 2 } });
```

### Method Signatures

```ts
logEvent(options: { event: string, valueToSum?: number, params?: any }): Promise<string>;
logPurchase(options: { amount: number, currency: string, params?: any }): Promise<string>;
logAddPaymentInfo(options: { success: number }): Promise<string>;
logAddToCart(options: { amount: number, currency: string, params?: any }): Promise<string>;
logCompleteRegistration(options: { params?: any }): Promise<string>;
logInitiatedCheckout(options: { amount: number, params?: any }): Promise<string>;
```

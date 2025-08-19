# Capacitor Facebook Analytics Plugin

A Capacitor plugin for Facebook Analytics integration, compatible with Capacitor 7+.

## Requirements

- **Capacitor 7.0.0+**
- **iOS 14.0+** 
- **Android API 23+** (Android 6.0)
- **Node.js 20+**

## Installation

### 1. Install the plugin

```bash
npm install @jonit-dev/capacitor-plugin-facebook-analytics
```

Or using yarn:

```bash
yarn add @jonit-dev/capacitor-plugin-facebook-analytics
```

### 2. Sync with Capacitor

```bash
npx cap sync
```

### 3. Install platform dependencies

#### iOS
The plugin uses Facebook SDK 17.0.0+ which will be automatically installed via CocoaPods or Swift Package Manager.

#### Android  
The plugin uses Facebook Android SDK 17.0.0+ which will be automatically installed via Gradle.

## Configuration

### Android Setup

> **Note**: Manual plugin registration is no longer required in Capacitor 7

1. In `android/app/src/main/AndroidManifest.xml`, add the Facebook App ID under `<application>`:

```xml
<meta-data android:name="com.facebook.sdk.ApplicationId"
    android:value="@string/facebook_app_id"/>
```

2. In `android/app/src/main/res/values/strings.xml`, add your Facebook App ID:

```xml
<string name="facebook_app_id">YOUR_FACEBOOK_APP_ID</string>
```

Replace `YOUR_FACEBOOK_APP_ID` with your actual Facebook Application ID from the [Facebook App Dashboard](https://developers.facebook.com/apps/).

### iOS Setup

In `ios/App/App/Info.plist`, add your Facebook App configuration:

```xml
<key>FacebookAppID</key>
<string>YOUR_FACEBOOK_APP_ID</string>
<key>FacebookDisplayName</key>
<string>YOUR_APP_NAME</string>
```

Replace:
- `YOUR_FACEBOOK_APP_ID` with your Facebook Application ID
- `YOUR_APP_NAME` with your app's display name

### Getting Your Facebook App ID

1. Go to the [Facebook App Dashboard](https://developers.facebook.com/apps/)
2. Select your app or create a new one
3. Copy the App ID from the app dashboard

For more detailed setup instructions, see:
- [Android Setup Guide](https://developers.facebook.com/docs/app-events/getting-started-app-events-android)
- [iOS Setup Guide](https://developers.facebook.com/docs/app-events/getting-started-app-events-ios)

## Usage

### Import the plugin

```typescript
import { FacebookAnalytics } from '@jonit-dev/capacitor-plugin-facebook-analytics';
```

### Basic Usage Examples

```typescript
// Log a custom event
await FacebookAnalytics.logEvent({ 
  event: 'button_click', 
  valueToSum: 1.0, 
  params: { button_id: 'signup_button' } 
});

// Log a purchase
await FacebookAnalytics.logPurchase({ 
  amount: 9.99, 
  currency: 'USD', 
  params: { product_id: 'premium_subscription' } 
});

// Log add to cart
await FacebookAnalytics.logAddToCart({ 
  amount: 19.99, 
  currency: 'USD', 
  params: { item_name: 'widget', category: 'tools' } 
});

// Log payment info added
await FacebookAnalytics.logAddPaymentInfo({ success: 1 });

// Log registration completion
await FacebookAnalytics.logCompleteRegistration({ 
  params: { method: 'email', user_type: 'premium' } 
});

// Log checkout initiation
await FacebookAnalytics.logInitiatedCheckout({ 
  amount: 29.99, 
  params: { num_items: 2, currency: 'USD' } 
});
```

## API Reference

### Supported Methods

| Method | Android | iOS | Web | Description |
| :-- | :--: | :--: | :--: | :-- |
| `logEvent` | ✅ | ✅ | ❌ | Log custom events |
| `logPurchase` | ✅ | ✅ | ❌ | Log purchase events |
| `logAddToCart` | ✅ | ✅ | ❌ | Log add to cart events |
| `logAddPaymentInfo` | ✅ | ✅ | ❌ | Log payment info events |
| `logCompleteRegistration` | ✅ | ✅ | ❌ | Log registration events |
| `logInitiatedCheckout` | ✅ | ✅ | ❌ | Log checkout events |

### Method Signatures

```typescript
interface FacebookAnalyticsPlugin {
  logEvent(options: { 
    event: string, 
    valueToSum?: number, 
    params?: any 
  }): Promise<string>;
  
  logPurchase(options: { 
    amount: number, 
    currency: string, 
    params?: any 
  }): Promise<string>;
  
  logAddPaymentInfo(options: { 
    success: number 
  }): Promise<string>;
  
  logAddToCart(options: { 
    amount: number, 
    currency: string, 
    params?: any 
  }): Promise<string>;
  
  logCompleteRegistration(options: { 
    params?: any 
  }): Promise<string>;
  
  logInitiatedCheckout(options: { 
    amount: number, 
    params?: any 
  }): Promise<string>;
}
```

## Changelog

### 1.0.0
- Updated for Capacitor 7 compatibility
- Raised minimum iOS version to 14.0
- Raised minimum Android API to 23
- Updated Facebook SDK to 17.0.0
- Added Swift Package Manager support
- Removed deprecated APIs

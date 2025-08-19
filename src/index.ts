import { registerPlugin } from '@capacitor/core';
import type { FacebookAnalyticsPlugin } from './definitions';

export const FacebookAnalytics = registerPlugin<FacebookAnalyticsPlugin>('FacebookAnalytics', {
  web: () => import('./web').then((m) => new m.FacebookAnalyticsWeb()),
});

export * from './definitions';

import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { useFonts } from 'expo-font';
import { Stack } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect } from 'react';
import 'react-native-reanimated';

import ReleasebirdSdk from 'releasebird-reactnative-sdk'

import { useColorScheme } from '@/hooks/useColorScheme';

// Prevent the splash screen from auto-hiding before asset loading is complete.
SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  const colorScheme = useColorScheme();
  const [loaded] = useFonts({
    SpaceMono: require('../assets/fonts/SpaceMono-Regular.ttf'),
  });

  useEffect(() => {
    if (loaded) {
      SplashScreen.hideAsync();
      ReleasebirdSdk.initialize("1cad2c1b6d7842fd937469ce3ac42ba2", true);

      const json = {
        properties: {
            firstname: "Christian",
            lastname: "Zillmann",
            email: "christian.zillmann@buildnext.io",
            external_user_id: "65686f74b7d0b27e904d2ba6",
            company: {
              externalId: "65686f74b7d0b27e904d2ba7",
              company_name: "buildnext"
            }
          }
      };

      ReleasebirdSdk.identify(null, json)
    }
  }, [loaded]);

  if (!loaded) {

    return null;
  }

  return (
    <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
      <Stack>
        <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
        <Stack.Screen name="+not-found" />
      </Stack>
    </ThemeProvider>
  );
}

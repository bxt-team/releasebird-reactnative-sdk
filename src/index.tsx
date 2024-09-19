import {NativeModules, NativeEventEmitter, Platform} from 'react-native';

const LINKING_ERROR =
    `The package 'releasebird-reactnative-sdk' doesn't seem to be linked. Make sure: \n\n` +
    Platform.select({ios: "- You have run 'pod install'\n", default: ''}) +
    '- You rebuilt the app after installing the package\n' +
    '- You are not using Expo managed workflow\n';

export type ReleasebirdUserProperty = {
    email?: string;
    name?: string;
    phone?: string;
    value?: number;
    sla?: number;
    plan?: string;
    companyName?: string;
    companyId?: string;
    customData?: { [key: string]: string | number };
};

type ReleasebirdSdkType = {
    initialize(token: string, showButton: boolean): void;
    identify(userId: string, userProperties: ReleasebirdUserProperty): void;
    showWidget(): void;
};

const ReleasebirdSdk = NativeModules.Releasebirdsdk
    ? NativeModules.Releasebirdsdk
    : new Proxy(
        {},
        {
            get() {
                throw new Error(LINKING_ERROR);
            },
        }
    );

export default ReleasebirdSdk as ReleasebirdSdkType;
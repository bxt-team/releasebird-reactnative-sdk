export type ReleasebirdUserProperty = {
    properties?: {
        [key: string]: any;
    };
};
type ReleasebirdSdkType = {
    initialize(token: string, showButton: boolean): void;
    identify(hash: string | null, userProperties: ReleasebirdUserProperty): void;
    showWidget(): void;
    logout(): void;
};
declare const _default: ReleasebirdSdkType;
export default _default;
//# sourceMappingURL=index.d.ts.map
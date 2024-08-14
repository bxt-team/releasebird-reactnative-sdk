export type ReleasebirdUserProperty = {
    email?: string;
    name?: string;
    phone?: string;
    value?: number;
    sla?: number;
    plan?: string;
    companyName?: string;
    companyId?: string;
    customData?: {
        [key: string]: string | number;
    };
};
type ReleasebirdSdkType = {
    initialize(token: string, showButton: boolean): void;
    identify(userId: string, userProperties: ReleasebirdUserProperty): void;
};
declare const _default: ReleasebirdSdkType;
export default _default;
//# sourceMappingURL=index.d.ts.map
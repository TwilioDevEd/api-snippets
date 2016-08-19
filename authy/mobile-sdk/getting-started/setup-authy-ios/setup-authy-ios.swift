import AuthySDKiOS

class AuthySDKManager: NSObject {

    private var Authy: Authy?

    override init() {
        super.init()
        self.authy = Authy.sharedAuthy

        var setupError: AUTError? = nil
        self.authy?.setup(&setupError)

        if setupError != nil {
            print("Error \(setupError!.message())")
        }
    }
}
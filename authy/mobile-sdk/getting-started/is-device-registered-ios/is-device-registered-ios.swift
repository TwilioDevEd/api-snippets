var currentError: AUTError? = nil
let isDeviceRegistered = self.authy?.isDeviceRegistered(&currentError)
if  currentError != nil {
    print("Error \(currentError!.message())")
}
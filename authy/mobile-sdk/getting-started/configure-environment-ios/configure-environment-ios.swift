var error: AUTError? = nil
self.authy?.setEnvironment(.STG, error: &error)

if error != nil {
    print("Error \(error!.message())")
}
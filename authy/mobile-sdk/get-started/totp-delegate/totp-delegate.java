public class TokensFragment extends Fragment implements TOTPCallback {
	// ...

	void onTOTPReceived(String totp) {
		// Display TOTP
	}

	void onTOTPError(Exception exception) {
		// Handle error
	}
}
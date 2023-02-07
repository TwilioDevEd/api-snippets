using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;


class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay(paymentMethod: Pay.PaymentMethodEnum.AchDebit, chargeAmount: "13.22");
        var prompt = new Prompt(for_: Prompt.ForEnum.BankAccountNumber);
        prompt.Say("Thanks for using our service. Please enter your bank account number.");
        pay.Append(prompt);
        var prompt2 = new Prompt(requireMatchingInputs: true, for_: Prompt.ForEnum.BankAccountNumber);
        prompt2.Say("Thank you. Please enter your bank account number again.");
        pay.Append(prompt2);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}

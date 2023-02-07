using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

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
        var prompt3 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InputMatchingFailed}.ToList(), for_: Prompt.ForEnum.BankAccountNumber);
        prompt3.Say("Sorry, your two bank account number inputs did not match. Please enter your bank account number again. We will then ask a second time again.");
        pay.Append(prompt3);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}

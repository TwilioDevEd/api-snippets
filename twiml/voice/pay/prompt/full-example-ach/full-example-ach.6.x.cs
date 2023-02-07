using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay(timeout: 5, maxAttempts: 3, paymentMethod: Pay.PaymentMethodEnum.AchDebit, language: "en-US");
        var prompt = new Prompt(for_: Prompt.ForEnum.BankRoutingNumber);
        prompt.Say("Please enter your bank routing number.");
        pay.Append(prompt);
        var prompt2 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), for_: Prompt.ForEnum.BankRoutingNumber);
        prompt2.Say("You didn't enter your routing number. Please enter your bank routing number.");
        pay.Append(prompt2);
        var prompt3 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InvalidBankRoutingNumber}.ToList(), for_: Prompt.ForEnum.BankRoutingNumber);
        prompt3.Say("That was an invalid bank routing number. Please try again.");
        pay.Append(prompt3);
        var prompt4 = new Prompt(for_: Prompt.ForEnum.BankAccountNumber);
        prompt4.Say("Please enter your bank account number.");
        pay.Append(prompt4);
        var prompt5 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), for_: Prompt.ForEnum.BankAccountNumber);
        prompt5.Say("You didn't enter your bank account number. Please enter your bank account number.");
        pay.Append(prompt5);
        var prompt6 = new Prompt(for_: Prompt.ForEnum.PaymentProcessing);
        prompt6.Say("Thank you. Please wait while we process your payment.");
        pay.Append(prompt6);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}

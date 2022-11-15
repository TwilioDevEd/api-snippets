using System;
using Twilio.TwiML;
using Twilio.TwiML.Voice;
using System.Linq;

class Example
{
    static void Main()
    {
        var response = new VoiceResponse();
        var pay = new Pay(paymentMethod: Pay.PaymentMethodEnum.CreditCard, validCardTypes: new []{Pay.ValidCardTypesEnum.Visa, Pay.ValidCardTypesEnum.Mastercard, Pay.ValidCardTypesEnum.Amex}.ToList());
        var prompt = new Prompt(for_: Prompt.ForEnum.PaymentCardNumber);
        prompt.Say("Please enter your credit card number.");
        pay.Append(prompt);
        var prompt2 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), for_: Prompt.ForEnum.PaymentCardNumber);
        prompt2.Say("You didn't enter your credit card number. Please enter your credit card number.");
        pay.Append(prompt2);
        var prompt3 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InvalidCardNumber}.ToList(), for_: Prompt.ForEnum.PaymentCardNumber);
        prompt3.Say("You entered an invalid credit card number. Please try again.");
        pay.Append(prompt3);
        var prompt4 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InvalidCardType}.ToList(), for_: Prompt.ForEnum.PaymentCardNumber);
        prompt4.Say("The card number you entered isn't from one of our accepted credit card issuers. Please enter a Visa, MasterCard, or American Express credit card number.");
        pay.Append(prompt4);
        var prompt5 = new Prompt(for_: Prompt.ForEnum.ExpirationDate);
        prompt5.Say("Please enter your credit card's expiration date. Two digits for the month and two digits for the year.");
        pay.Append(prompt5);
        var prompt6 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), for_: Prompt.ForEnum.ExpirationDate);
        prompt6.Say("Sorry. You didn't enter an expiration date. Please enter your card's expiration date. Two digits for the month and two digits for the year.");
        pay.Append(prompt6);
        var prompt7 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InvalidDate}.ToList(), for_: Prompt.ForEnum.ExpirationDate);
        prompt7.Say("The date you entered was incorrect or is in the past. Please enter the expiration date. Two digits for the month and two digits for the year. For example, to enter July twenty twenty two, enter 0 7 2 2.");
        pay.Append(prompt7);
        var prompt8 = new Prompt(cardType: new []{Prompt.CardTypeEnum.Visa, Prompt.CardTypeEnum.Mastercard}.ToList(), for_: Prompt.ForEnum.SecurityCode);
        prompt8.Say("Please enter your security code. It's the 3 digits located on the back of your card.");
        pay.Append(prompt8);
        var prompt9 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), cardType: new []{Prompt.CardTypeEnum.Visa, Prompt.CardTypeEnum.Mastercard}.ToList(), for_: Prompt.ForEnum.SecurityCode);
        prompt9.Say("You didn't enter your credit card security code. Please enter your security code. It's the 3 digits located on the back of your card.");
        pay.Append(prompt9);
        var prompt10 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InvalidSecurityCode}.ToList(), cardType: new []{Prompt.CardTypeEnum.Visa, Prompt.CardTypeEnum.Mastercard}.ToList(), for_: Prompt.ForEnum.SecurityCode);
        prompt10.Say("That was an invalid security code. The security code must be 3 digits. Please try again.");
        pay.Append(prompt10);
        var prompt11 = new Prompt(cardType: new []{Prompt.CardTypeEnum.Amex}.ToList(), for_: Prompt.ForEnum.SecurityCode);
        prompt11.Say("Please enter your security code. It's the 4 digits located on the front of your card.");
        pay.Append(prompt11);
        var prompt12 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), cardType: new []{Prompt.CardTypeEnum.Amex}.ToList(), for_: Prompt.ForEnum.SecurityCode);
        prompt12.Say("You didn't enter your credit card security code.  Please enter your security code. It's the 4 digits located on the front of your card.");
        pay.Append(prompt12);
        var prompt13 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.InvalidSecurityCode}.ToList(), cardType: new []{Prompt.CardTypeEnum.Amex}.ToList(), for_: Prompt.ForEnum.SecurityCode);
        prompt13.Say("That was an invalid security code. The security code must be 4 digits. Please try again.");
        pay.Append(prompt13);
        var prompt14 = new Prompt(for_: Prompt.ForEnum.PostalCode);
        prompt14.Say("Please enter your 5 digit billing zip code.");
        pay.Append(prompt14);
        var prompt15 = new Prompt(errorType: new []{Prompt.ErrorTypeEnum.Timeout}.ToList(), for_: Prompt.ForEnum.PostalCode);
        prompt15.Say("You didn't enter your billing zip code. Please enter your 5 digit billing zip code.");
        pay.Append(prompt15);
        var prompt16 = new Prompt(for_: Prompt.ForEnum.PaymentProcessing);
        prompt16.Say("Thank you. Please wait while we process your payment.");
        pay.Append(prompt16);
        response.Append(pay);

        Console.WriteLine(response.ToString());
    }
}

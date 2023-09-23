import { FormGroup, FormControl, FormGroupDirective, NgForm, ValidatorFn } from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material/core';
// import { ErrorStateMatcher } from '@angular/material/err';

export const regExps: { [key: string]: RegExp } = {
    Password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\.*])(?=.{6,})/,
    LoginId: /^([a-zA-Z0-9_-]){5,}$/,
    FTPPassword: /^([a-zA-Z0-9_-]){5,}$/,
    OTP: /^[0-9]{6,}$/,
    RewardCode: /^([a-zA-Z0-9_-]){8,8}$/,
    RewardAmount: /^(\d{1,5}|\d{1,5}\.\d{0,2})$/,
    RewardDays: /^(\d{1,2}|\d{1,2})$/,
    PromoCode: /^([a-zA-Z0-9_-]){8,8}$/,
    Amount: /^(\d{1,5}|\d{1,5}\.\d{0,2})$/,
    ResidentId: /^[0-9]{16}$/,
    SIPNumber: /^[0-9]{3,6}$/,
    MobileNumber: /^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$/,
    EmailId: /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/,
    Image: /^([a-zA-Z0-9_\-\.]+).*(.png|.PNG|.jpeg|.JPEG|.jpg|.JPG|.gif|.GIF)$/,
    // RegistrationNumber:/^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$/, //India
    RegistrationNumber: /^[A-Z]{1,2}[0-9]{3,4}[A-Z]{2,3}$/,
    IpAddress: /^([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})$/,
    PortNumber: /^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$/,
    SingleDigit: /\b[1-9]\b/,
    Latitude: /^(\+|-)?(?:90(?:(?:\.0{1,9})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,9})?))$/,
    Longitude: /^(\+|-)?(?:180(?:(?:\.0{1,9})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,9})?))$/,
    URL: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
    APIURL: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
    FTPURL: /^(?:ftp(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/,
    DecimalThreeDigit: /^(\d{1,5}|\d{1,5}\.\d{0,3})$/,
    DecimalTwoDigit: /^(\d{1,5}|\d{1,5}\.\d{0,2})$/,
    AlphabetOnly: /^[A-Za-z]+$/,
    SpaceAlphabetOnly: /^[a-zA-Z ]*$/,
    DigitSpaceAlphabetOnly: /^[a-zA-Z0-9 ]*$/,
    AlphaNumericSingleSpace: /^([a-zA-Z0-9]+\s?)*$/,
    OnlyDigit: /^(0|[1-9][0-9]*)$/,
    ChainageNumber:/^(\d{1,3}|\d{1,3}\.\d{0,3})$/
 };

// export class ConfirmValidParentMatcher implements ErrorStateMatcher {
//     isErrorState(control: FormControl, form: FormGroupDirective): boolean {
//         return control.parent.invalid && control.touched;
//     }
//     // notSame:false;
//     checkPasswords(group: FormGroup) { // here we have the 'passwords' group
//     const pass = group.get('NewPassword').value;
//     const confirmPass = group.get('ConfirmPassword').value;
//     return pass === confirmPass ? null : { notSame: true };
//   }
// }

export function ConfirmPasswordValidator(controlName: string, matchingControlName: string) {
    return (formGroup: FormGroup) => {
      let control = formGroup.controls[controlName];
      let matchingControl = formGroup.controls[matchingControlName]
      if (
        matchingControl.errors &&
        !matchingControl.errors['confirmPasswordValidator']
      ) {
        return;
      }
      if (control.value !== matchingControl.value) {
        matchingControl.setErrors({ confirmPasswordValidator: true });
      } else {
        matchingControl.setErrors(null);
      }
    };
  }

export const errorMessages: { [key: string]: string } = {
    Amount: 'Enter a valid amount.',
    LoginId: 'Login id must contain 5 characters with alphabets or number only.',
    FTPPassword: 'Password must contain 5 characters with alphabets or number only.',
    Password: 'Password must contain 6 characters or longer with 1 upper case letter,numbers and special characters.',
    ConfirmPassword: 'Passwords must match',
    ResidentId: 'Resident Id must be 16 numeric characters.',
    SIPNumber: 'Must contain 3 to 6 numeric value.',
    MobileNumber: 'Please enter valid mobile number.',
    EmailId: 'Email must be a valid email address (username@domain).',
    Image: 'Please select (png/jpeg/jpg/gif)',
    RegistrationNumber: 'Please enter valid Registration Number (special characters not required)',
    IpAddress: 'Please enter valid Ip Address',
    PortNumber: 'Please enter valid Port',
    SingleDigit: 'Please enter valid value(allow only numeric single digit)',
    Latitude: 'Please enter valid latitude',
    Longitude: 'Please enter valid longitude',
    URL: 'Please enter valid URL',
    APIURL: 'Please enter valid API URL',
    FTPURL: 'Please enter valid ftp path',
    DecimalThreeDigit: 'Please enter valid value',
    DecimalTwoDigit: 'Please enter valid value',
    AlphabetOnly: 'Please enter alphabet characters only',
    SpaceAlphabetOnly: 'Please enter alphabet characters with space only',
    DigitSpaceAlphabetOnly: 'No spacial characters',
    AlphaNumericSingleSpace: 'Single space required',
    OnlyDigit: 'Only numeric values allowed',
    ChainageNumber:"Please enter valid chainage"
};

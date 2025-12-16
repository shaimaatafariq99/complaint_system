<?php

namespace App\Http\Requests\auth;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CustomerRegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'first_name'      => "required|string|max:255|regex:/^[A-Za-z0-9 _]+$/",
            'last_name'      => "required|string|max:255|regex:/^[A-Za-z0-9 _]+$/",
            'phone_number'     => "required|numeric|regex:/^09[0-9]{8}/",
            'email' => [
                'required',
                'email',
                'max:255',
                 Rule::unique('center_users', 'email'),
            ],
            'password'  => "required|string|min:6|max:255",
        ];
    }

    public function messages(): array
    {
        return [
            'first_name.required' => 'The first name field is required.',
            'first_name.string' => 'The first name must be a string.',
            'first_name.max' => 'The first name may not be greater than 255 characters.',
            'first_name.regex' => 'The first name may only contain letters, numbers, spaces, and underscores.',
            'last_name.required' => 'The last name field is required.',
            'last_name.string' => 'The last name must be a string.',
            'last_name.max' => 'The last name may not be greater than 255 characters.',
            'last_name.regex' => 'The last name may only contain letters, numbers, spaces, and underscores.',
            'phone_number.required' => 'The phone number field is required.',
            'phone_number.numeric' => 'The phone number must be numeric.',
            'phone_number.regex' => 'The phone number must start with 09 and be followed by 8 digits.',
            'phone_number.unique' => 'This phone number is already in use.',
            'email.required' => 'The email field is required.',
            'email.email' => 'Please enter a valid email address.',
            'email.max' => 'The email may not be greater than 255 characters.',
            'email.unique' => 'This email is already in use.',
            'password.required' => 'The password field is required.',
            'password.string' => 'The password must be a string.',
            'password.min' => 'The password must be at least 6 characters.',
            'password.max' => 'The password may not be greater than 255 characters.',
        ];
    }
}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

/**
 *
 * @author Phong
 */
public class RegisterError {

    private String emailError;
    private String emailUniqueError;
    private String passwordError;
    private String phoneError;
    private String fullnameError;
    private String confirmPasswordError;

    public RegisterError() {
    }

    public RegisterError(String emailError, String passwordError, String phoneError) {
        this.emailError = emailError;
        this.passwordError = passwordError;
        this.phoneError = phoneError;
    }

    /**
     * @return the emailError
     */
    public String getEmailError() {
        return emailError;
    }

    /**
     * @param emailError the emailError to set
     */
    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    /**
     * @return the emailUniqueError
     */
    public String getEmailUniqueError() {
        return emailUniqueError;
    }

    /**
     * @param emailUniqueError the emailUniqueError to set
     */
    public void setEmailUniqueError(String emailUniqueError) {
        this.emailUniqueError = emailUniqueError;
    }

    /**
     * @return the passwordError
     */
    public String getPasswordError() {
        return passwordError;
    }

    /**
     * @param passwordError the passwordError to set
     */
    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    /**
     * @return the phoneError
     */
    public String getPhoneError() {
        return phoneError;
    }

    /**
     * @param phoneError the phoneError to set
     */
    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    /**
     * @return the fullnameError
     */
    public String getFullnameError() {
        return fullnameError;
    }

    /**
     * @param fullnameError the fullnameError to set
     */
    public void setFullnameError(String fullnameError) {
        this.fullnameError = fullnameError;
    }

    /**
     * @return the confirmPasswordError
     */
    public String getConfirmPasswordError() {
        return confirmPasswordError;
    }

    /**
     * @param confirmPasswordError the confirmPasswordError to set
     */
    public void setConfirmPasswordError(String confirmPasswordError) {
        this.confirmPasswordError = confirmPasswordError;
    }

}

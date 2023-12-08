/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

/**
 *
 * @author Phong
 */
public class PasswordResetError {
    private String newPasswordError;
    private String confirmPasswordError;

    public PasswordResetError() {
    }

    public PasswordResetError(String newPasswordError, String confirmPasswordError) {
        this.newPasswordError = newPasswordError;
        this.confirmPasswordError = confirmPasswordError;
    }

    /**
     * @return the newPasswordError
     */
    public String getNewPasswordError() {
        return newPasswordError;
    }

    /**
     * @param newPasswordError the newPasswordError to set
     */
    public void setNewPasswordError(String newPasswordError) {
        this.newPasswordError = newPasswordError;
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.models;

/**
 *
 * @author Phong
 */
public class UpdateUsersError {

    private String updatePhoneError;
    private String updatePasswordError;

    public UpdateUsersError() {
    }

    /**
     * @return the updatePhoneError
     */
    public String getUpdatePhoneError() {
        return updatePhoneError;
    }

    /**
     * @param updatePhoneError the updatePhoneError to set
     */
    public void setUpdatePhoneError(String updatePhoneError) {
        this.updatePhoneError = updatePhoneError;
    }

    /**
     * @return the updatePasswordError
     */
    public String getUpdatePasswordError() {
        return updatePasswordError;
    }

    /**
     * @param updatePasswordError the updatePasswordError to set
     */
    public void setUpdatePasswordError(String updatePasswordError) {
        this.updatePasswordError = updatePasswordError;
    }

}

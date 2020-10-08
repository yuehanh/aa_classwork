import * as SessionUtil from "../util/session_api_util";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_SESSION_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (payload) => {
    return {
        type: RECEIVE_CURRENT_USER,
        payload,
    };
};

export const logoutCurrentUser = () => {
    return {
        type: LOGOUT_CURRENT_USER,
    };
};

export const receiveError = (payload) => {
    debugger;
    return {
        type: RECEIVE_SESSION_ERRORS,
        payload,
    };
};

export const login = (user) => (dispatch) => {
    return SessionUtil.login(user)
        .then((payload) => {
            // debugger;
            return dispatch(receiveCurrentUser(payload));
        })
        .catch((payload) => {
            // debugger
            dispatch(receiveError(payload));
        });
};

export const logout = () => (dispatch) => {
    return SessionUtil.logout()
        .then(() => dispatch(logoutCurrentUser()))
        .catch((payload) => dispatch(receiveError(payload)));
};

export const signUp = (user) => (dispatch) => {
    return SessionUtil.signUp(user)
        .then((payload) => dispatch(receiveCurrentUser(payload)))
        .catch((payload) => dispatch(receiveError(payload)));
};

import React from "react";
import { Provider } from "react-redux";
import App from "./app";

const Root = ({ store }) => {
    debugger
    return (
        // object deconstruction same as passing in props and reading props.store
        <Provider store={store}>
            <App />
        </Provider>
    );
};

export default Root;

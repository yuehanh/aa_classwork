import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./frontend/store/store";
import {receiveTodos, receiveTodo} from "./frontend/actions/todo_actions"
import Root from "./frontend/components/root"
import {allTodos} from "./frontend/reducers/selectors"

document.addEventListener("DOMContentLoaded", function () {
    const store = configureStore();
    ReactDOM.render(<Root store = {store} />, document.getElementById("content"));
    


    // test
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.allTodos = allTodos
});
